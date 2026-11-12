CREATE DATABASE IF NOT EXISTS nphcda_clinic
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE nphcda_clinic;

CREATE TABLE branch (
  branch_id   INT AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(100) NOT NULL,
  address     VARCHAR(255) NOT NULL,
  phone       VARCHAR(20),
  created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE staff (
  staff_id    INT AUTO_INCREMENT PRIMARY KEY,
  branch_id   INT NOT NULL,
  first_name  VARCHAR(60) NOT NULL,
  last_name   VARCHAR(60) NOT NULL,
  role        ENUM('receptionist','doctor','nurse','lab_technician','pharmacist','admin') NOT NULL,
  email       VARCHAR(120) NOT NULL UNIQUE,
  phone       VARCHAR(20),
  hired_at    DATE,
  CONSTRAINT fk_staff_branch FOREIGN KEY (branch_id)
    REFERENCES branch(branch_id) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE doctor (
  doctor_id   INT AUTO_INCREMENT PRIMARY KEY,
  staff_id    INT NOT NULL UNIQUE,
  specialty   VARCHAR(80) NOT NULL,
  license_no  VARCHAR(40) NOT NULL UNIQUE,
  CONSTRAINT fk_doctor_staff FOREIGN KEY (staff_id)
    REFERENCES staff(staff_id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE patient (
  patient_id           INT AUTO_INCREMENT PRIMARY KEY,
  first_name           VARCHAR(60) NOT NULL,
  last_name            VARCHAR(60) NOT NULL,
  dob                  DATE NOT NULL,
  gender               ENUM('M','F','O') NOT NULL,
  phone                VARCHAR(20),
  email                VARCHAR(120),
  address              VARCHAR(255),
  registered_branch_id INT NOT NULL,
  created_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_patient_branch FOREIGN KEY (registered_branch_id)
    REFERENCES branch(branch_id) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE appointment (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id     INT NOT NULL,
  doctor_id      INT NOT NULL,
  branch_id      INT NOT NULL,
  scheduled_at   DATETIME NOT NULL,
  status         ENUM('booked','completed','cancelled','no_show') NOT NULL DEFAULT 'booked',
  reason         VARCHAR(255),
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_appt_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  CONSTRAINT fk_appt_doctor  FOREIGN KEY (doctor_id)  REFERENCES doctor(doctor_id),
  CONSTRAINT fk_appt_branch  FOREIGN KEY (branch_id)  REFERENCES branch(branch_id),
  INDEX idx_appt_doctor_time (doctor_id, scheduled_at)
) ENGINE=InnoDB;

CREATE TABLE consultation (
  consultation_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id  INT NOT NULL UNIQUE,
  diagnosis       VARCHAR(255) NOT NULL,
  notes           TEXT,
  created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_cons_appt FOREIGN KEY (appointment_id)
    REFERENCES appointment(appointment_id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE medication (
  medication_id INT AUTO_INCREMENT PRIMARY KEY,
  name          VARCHAR(120) NOT NULL,
  form          VARCHAR(40) NOT NULL,
  unit_price    DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
  stock_qty     INT NOT NULL DEFAULT 0 CHECK (stock_qty >= 0),
  UNIQUE KEY uq_med_name_form (name, form)
) ENGINE=InnoDB;

CREATE TABLE prescription (
  prescription_id INT AUTO_INCREMENT PRIMARY KEY,
  consultation_id INT NOT NULL,
  doctor_id       INT NOT NULL,
  issued_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status          ENUM('pending','dispensed','cancelled') NOT NULL DEFAULT 'pending',
  CONSTRAINT fk_presc_cons FOREIGN KEY (consultation_id)
    REFERENCES consultation(consultation_id) ON DELETE CASCADE,
  CONSTRAINT fk_presc_doc FOREIGN KEY (doctor_id)
    REFERENCES doctor(doctor_id)
) ENGINE=InnoDB;

CREATE TABLE prescription_item (
  item_id         INT AUTO_INCREMENT PRIMARY KEY,
  prescription_id INT NOT NULL,
  medication_id   INT NOT NULL,
  dosage          VARCHAR(80) NOT NULL,
  quantity        INT NOT NULL CHECK (quantity > 0),
  unit_price      DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_item_presc FOREIGN KEY (prescription_id)
    REFERENCES prescription(prescription_id) ON DELETE CASCADE,
  CONSTRAINT fk_item_med FOREIGN KEY (medication_id)
    REFERENCES medication(medication_id)
) ENGINE=InnoDB;

CREATE TABLE lab_test (
  test_id       INT AUTO_INCREMENT PRIMARY KEY,
  patient_id    INT NOT NULL,
  doctor_id     INT NOT NULL,
  test_type     VARCHAR(80) NOT NULL,
  requested_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status        ENUM('requested','in_progress','completed','cancelled') NOT NULL DEFAULT 'requested',
  CONSTRAINT fk_test_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  CONSTRAINT fk_test_doctor  FOREIGN KEY (doctor_id)  REFERENCES doctor(doctor_id)
) ENGINE=InnoDB;

CREATE TABLE lab_result (
  result_id      INT AUTO_INCREMENT PRIMARY KEY,
  test_id        INT NOT NULL UNIQUE,
  result_value   VARCHAR(120) NOT NULL,
  result_unit    VARCHAR(40),
  recorded_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  technician_id  INT NOT NULL,
  CONSTRAINT fk_result_test FOREIGN KEY (test_id)
    REFERENCES lab_test(test_id) ON DELETE CASCADE,
  CONSTRAINT fk_result_tech FOREIGN KEY (technician_id)
    REFERENCES staff(staff_id)
) ENGINE=InnoDB;

CREATE TABLE payment (
  payment_id     INT AUTO_INCREMENT PRIMARY KEY,
  patient_id     INT NOT NULL,
  appointment_id INT NULL,
  amount         DECIMAL(10,2) NOT NULL CHECK (amount > 0),
  method         ENUM('cash','card','transfer','insurance') NOT NULL,
  paid_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status         ENUM('paid','refunded','failed') NOT NULL DEFAULT 'paid',
  CONSTRAINT fk_pay_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  CONSTRAINT fk_pay_appt    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
) ENGINE=InnoDB;

CREATE TABLE audit_log (
  log_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
  table_name  VARCHAR(60) NOT NULL,
  record_id   BIGINT NOT NULL,
  action      ENUM('INSERT','UPDATE','DELETE') NOT NULL,
  changed_by  INT,
  changed_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  details     JSON,
  CONSTRAINT fk_audit_staff FOREIGN KEY (changed_by) REFERENCES staff(staff_id)
) ENGINE=InnoDB;