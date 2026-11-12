USE nphcda_clinic;

-- ============================================================
-- BRANCHES (PHC Centres)
-- ============================================================
INSERT INTO branch (name, address, phone) VALUES
('NPHCDA PHC Garki',        'Area 1, Garki, Abuja Municipal, FCT',        '0803-111-0001'),
('NPHCDA PHC Wuse',         'Wuse Zone 4, Abuja Municipal, FCT',           '0803-111-0002'),
('NPHCDA PHC Karu',         'Karu Site, Abuja Municipal, FCT',             '0803-111-0003'),
('NPHCDA PHC Nyanya',       'Nyanya, Abuja Municipal, FCT',                '0803-111-0004');

-- ============================================================
-- STAFF (Health Workers & Admin)
-- ============================================================
INSERT INTO staff (branch_id, first_name, last_name, role, email, phone, hired_at) VALUES
(1,'Amina','Bello','doctor',        'amina.bello@nphcda.gov.ng',    '0803-200-0001','2019-03-11'),
(1,'Chinedu','Okafor','doctor',     'chinedu.okafor@nphcda.gov.ng', '0803-200-0002','2018-07-02'),
(2,'Fatima','Yusuf','doctor',       'fatima.yusuf@nphcda.gov.ng',   '0803-200-0003','2020-01-20'),
(2,'Emeka','Nwosu','doctor',        'emeka.nwosu@nphcda.gov.ng',    '0803-200-0004','2021-09-14'),
(3,'Halima','Sani','doctor',        'halima.sani@nphcda.gov.ng',    '0803-200-0005','2017-05-30'),
(1,'Grace','Adeyemi','nurse',       'grace.adeyemi@nphcda.gov.ng',  '0803-300-0001','2020-04-01'),
(1,'Musa','Ibrahim','nurse',        'musa.ibrahim@nphcda.gov.ng',   '0803-300-0002','2019-11-12'),
(2,'Blessing','Eze','nurse',        'blessing.eze@nphcda.gov.ng',   '0803-300-0003','2021-02-22'),
(3,'Ngozi','Obi','nurse',           'ngozi.obi@nphcda.gov.ng',      '0803-300-0004','2018-08-09'),
(1,'Tunde','Balogun','lab_technician','tunde.balogun@nphcda.gov.ng','0803-400-0001','2019-06-17'),
(2,'Rukayat','Lawal','lab_technician','rukayat.lawal@nphcda.gov.ng','0803-400-0002','2020-10-25'),
(3,'Ifeanyi','Madu','lab_technician', 'ifeanyi.madu@nphcda.gov.ng', '0803-400-0003','2021-12-01'),
(1,'Zainab','Aliyu','pharmacist',   'zainab.aliyu@nphcda.gov.ng',   '0803-500-0001','2019-09-03'),
(2,'Samuel','Okon','pharmacist',    'samuel.okon@nphcda.gov.ng',    '0803-500-0002','2020-07-15'),
(1,'Aisha','Mohammed','receptionist','aisha.mohammed@nphcda.gov.ng','0803-600-0001','2021-01-04'),
(2,'Peace','Uche','receptionist',   'peace.uche@nphcda.gov.ng',     '0803-600-0002','2020-03-19'),
(3,'Daniel','Abiodun','receptionist','daniel.abiodun@nphcda.gov.ng','0803-600-0003','2021-05-27'),
(1,'Umar','Abdullahi','admin',      'umar.abdullahi@nphcda.gov.ng', '0803-700-0001','2016-02-10'),
(2,'Kemi','Alabi','admin',          'kemi.alabi@nphcda.gov.ng',     '0803-700-0002','2017-09-21'),
(4,'Peter','Danladi','admin',       'peter.danladi@nphcda.gov.ng',  '0803-700-0003','2018-11-30');

-- ============================================================
-- DOCTORS (1:1 with staff rows that are doctors)
-- ============================================================
INSERT INTO doctor (staff_id, specialty, license_no) VALUES
(1,'General Practice',     'MDCN-10001'),
(2,'Paediatrics',          'MDCN-10002'),
(3,'Obstetrics & Gynaecology','MDCN-10003'),
(4,'Internal Medicine',    'MDCN-10004'),
(5,'Family Medicine',      'MDCN-10005');

-- ============================================================
-- PATIENTS (40)
-- ============================================================
INSERT INTO patient (first_name, last_name, dob, gender, phone, email, address, registered_branch_id) VALUES
('John','Obi',      '1985-04-12','M','0801-000-0001','john.obi@example.com','Garki, FCT',1),
('Maryam','Sule',   '1992-09-30','F','0801-000-0002','maryam.sule@example.com','Wuse, FCT',2),
('Peter','Ade',     '1978-01-05','M','0801-000-0003','peter.ade@example.com','Karu, FCT',3),
('Ngozi','Anyanwu','1990-06-18','F','0801-000-0004','ngozi.anyanwu@example.com','Garki, FCT',1),
('Sani','Musa',     '2000-11-22','M','0801-000-0005','sani.musa@example.com','Nyanya, FCT',4),
('Adaeze','Okonkwo','1987-02-14','F','0801-000-0006','adaeze.okonkwo@example.com','Garki, FCT',1),
('Bello','Ali',     '1975-08-09','M','0801-000-0007','bello.ali@example.com','Wuse, FCT',2),
('Chiamaka','Eze',  '1995-03-27','F','0801-000-0008','chiamaka.eze@example.com','Karu, FCT',3),
('Yusuf','Abubakar','1982-12-01','M','0801-000-0009','yusuf.abubakar@example.com','Garki, FCT',1),
('Halima','Bello',  '1998-07-19','F','0801-000-0010','halima.bello@example.com','Wuse, FCT',2),
('Emmanuel','Ojo',  '1993-05-11','M','0801-000-0011','emmanuel.ojo@example.com','Karu, FCT',3),
('Blessing','Ikenna','1991-10-08','F','0801-000-0012','blessing.ikenna@example.com','Garki, FCT',1),
('Tunde','Afolabi', '1980-01-25','M','0801-000-0013','tunde.afolabi@example.com','Nyanya, FCT',4),
('Rukayat','Yakubu','1996-09-17','F','0801-000-0014','rukayat.yakubu@example.com','Wuse, FCT',2),
('Samuel','Peter',  '2002-04-03','M','0801-000-0015','samuel.peter@example.com','Karu, FCT',3),
('Kemi','Adeniyi',  '1989-12-20','F','0801-000-0016','kemi.adeniyi@example.com','Garki, FCT',1),
('Musa','Danjuma',  '1974-06-06','M','0801-000-0017','musa.danjuma@example.com','Wuse, FCT',2),
('Ngozi','Eze',     '1997-02-28','F','0801-000-0018','ngozi.eze@example.com','Karu, FCT',3),
('Ibrahim','Sani',  '1986-11-13','M','0801-000-0019','ibrahim.sani@example.com','Garki, FCT',1),
('Grace','Uche',    '1994-08-22','F','0801-000-0020','grace.uche@example.com','Nyanya, FCT',4),
('Adebayo','Ogun',  '1983-03-15','M','0801-000-0021','adebayo.ogun@example.com','Garki, FCT',1),
('Fatima','Lawan',  '1999-05-07','F','0801-000-0022','fatima.lawan@example.com','Wuse, FCT',2),
('Chinedu','Nnamdi','1988-10-10','M','0801-000-0023','chinedu.nnamdi@example.com','Karu, FCT',3),
('Amaka','Obi',     '1992-01-19','F','0801-000-0024','amaka.obi@example.com','Garki, FCT',1),
('Bala','Garba',    '1979-07-24','M','0801-000-0025','bala.garba@example.com','Wuse, FCT',2),
('Mercy','Johnson', '1998-12-02','F','0801-000-0026','mercy.johnson@example.com','Karu, FCT',3),
('Kelechi','Anyi',  '1985-09-09','M','0801-000-0027','kelechi.anyi@example.com','Nyanya, FCT',4),
('Aisha','Bello',   '2001-06-12','F','0801-000-0028','aisha.bello@example.com','Garki, FCT',1),
('Obinna','Ike',    '1990-04-30','M','0801-000-0029','obinna.ike@example.com','Wuse, FCT',2),
('Zainab','Sule',   '1993-11-08','F','0801-000-0030','zainab.sule@example.com','Karu, FCT',3),
('Daniel','Eze',    '1987-02-17','M','0801-000-0031','daniel.eze@example.com','Garki, FCT',1),
('Peace','Okon',    '1995-08-21','F','0801-000-0032','peace.okon@example.com','Wuse, FCT',2),
('Emeka','Chukwu',  '1981-10-14','M','0801-000-0033','emeka.chukwu@example.com','Karu, FCT',3),
('Halima','Sadiq',  '1997-03-25','F','0801-000-0034','halima.sadiq@example.com','Nyanya, FCT',4),
('Tosin','Oladipo', '1992-07-07','M','0801-000-0035','tosin.oladipo@example.com','Garki, FCT',1),
('Ifeoma','Nwosu',  '1999-12-16','F','0801-000-0036','ifeoma.nwosu@example.com','Wuse, FCT',2),
('Sadiq','Yusuf',   '1984-05-05','M','0801-000-0037','sadiq.yusuf@example.com','Karu, FCT',3),
('Nkechi','Obi',    '1996-09-11','F','0801-000-0038','nkechi.obi@example.com','Garki, FCT',1),
('Suleiman','Ali',  '1977-01-02','M','0801-000-0039','suleiman.ali@example.com','Wuse, FCT',2),
('Chidinma','Eze',  '1994-06-20','F','0801-000-0040','chidinma.eze@example.com','Nyanya, FCT',4);

-- ============================================================
-- APPOINTMENTS (30)
-- ============================================================
INSERT INTO appointment (patient_id, doctor_id, branch_id, scheduled_at, status, reason) VALUES
(1,1,1,'2026-01-05 09:00:00','completed','Fever and headache'),
(2,3,2,'2026-01-06 10:30:00','completed','Antenatal check-up'),
(3,5,3,'2026-01-07 11:00:00','completed','Chest pain'),
(4,1,1,'2026-01-08 08:30:00','completed','Routine check-up'),
(5,2,2,'2026-01-09 14:00:00','completed','Child immunisation'),
(6,1,1,'2026-01-10 09:45:00','completed','Cough and cold'),
(7,3,2,'2026-01-11 13:00:00','completed','Antenatal check-up'),
(8,5,3,'2026-01-12 10:15:00','completed','Skin rash'),
(9,1,1,'2026-01-13 08:00:00','completed','Malaria symptoms'),
(10,3,2,'2026-01-14 15:30:00','completed','Antenatal check-up'),
(11,5,3,'2026-01-15 09:30:00','completed','Back pain'),
(12,1,1,'2026-01-16 10:00:00','completed','Fever'),
(13,4,4,'2026-01-17 11:30:00','completed','Diabetes follow-up'),
(14,3,2,'2026-01-18 12:00:00','completed','Antenatal check-up'),
(15,2,3,'2026-01-19 09:00:00','completed','Child vaccination'),
(16,1,1,'2026-01-20 14:30:00','completed','Stomach pain'),
(17,4,2,'2026-01-21 08:30:00','completed','Hypertension review'),
(18,5,3,'2026-01-22 10:00:00','completed','Routine check-up'),
(19,1,1,'2026-01-23 09:15:00','completed','Malaria'),
(20,2,4,'2026-01-24 13:45:00','completed','Child immunisation'),
(21,1,1,'2026-01-25 08:00:00','completed','Headache'),
(22,3,2,'2026-01-26 15:00:00','completed','Antenatal check-up'),
(23,5,3,'2026-01-27 11:15:00','completed','Joint pain'),
(24,1,1,'2026-01-28 09:30:00','completed','Fatigue'),
(25,4,2,'2026-01-29 10:45:00','completed','Diabetes review'),
(26,2,3,'2026-01-30 14:00:00','completed','Child vaccination'),
(27,5,4,'2026-02-01 08:30:00','completed','Chest infection'),
(28,1,1,'2026-02-02 10:00:00','booked','Routine check-up'),
(29,4,2,'2026-02-03 13:30:00','booked','Blood pressure review'),
(30,2,3,'2026-02-04 09:45:00','cancelled','Child fever');

-- ============================================================
-- CONSULTATIONS (for completed appointments only)
-- ============================================================
INSERT INTO consultation (appointment_id, diagnosis, notes) VALUES
(1,'Malaria','Patient presented with fever and headache. Prescribed antimalarials.'),
(2,'Normal pregnancy','Antenatal visit at 24 weeks. Vitals normal.'),
(3,'Hypertension','BP 160/100. Advised lifestyle changes and medication.'),
(4,'Healthy','Routine check-up. No abnormalities.'),
(5,'Healthy','Child immunisation administered.'),
(6,'Upper respiratory infection','Prescribed antibiotics and rest.'),
(7,'Normal pregnancy','Antenatal visit at 28 weeks.'),
(8,'Allergic dermatitis','Prescribed antihistamine.'),
(9,'Malaria','Confirmed with RDT. Prescribed ACT.'),
(10,'Normal pregnancy','Antenatal visit at 30 weeks.'),
(11,'Musculoskeletal pain','Advised physiotherapy and analgesics.'),
(12,'Typhoid fever','Confirmed with Widal test. Prescribed antibiotics.'),
(13,'Type 2 Diabetes','HbA1c review. Adjusted medication.'),
(14,'Normal pregnancy','Antenatal visit at 32 weeks.'),
(15,'Healthy','Child vaccination administered.'),
(16,'Gastroenteritis','Prescribed ORS and antibiotics.'),
(17,'Hypertension','BP 150/95. Continued medication.'),
(18,'Healthy','Routine check-up.'),
(19,'Malaria','Prescribed ACT and paracetamol.'),
(20,'Healthy','Child immunisation administered.'),
(21,'Tension headache','Advised rest and analgesics.'),
(22,'Normal pregnancy','Antenatal visit at 34 weeks.'),
(23,'Osteoarthritis','Advised physiotherapy.'),
(24,'Anaemia','Prescribed iron supplements.'),
(25,'Type 2 Diabetes','Glucose levels elevated. Adjusted medication.'),
(26,'Healthy','Child vaccination administered.'),
(27,'Chest infection','Prescribed antibiotics.');

-- ============================================================
-- MEDICATIONS & VACCINES
-- ============================================================
INSERT INTO medication (name, form, unit_price, stock_qty) VALUES
('Artemether/Lumefantrine','tablet', 1500.00, 500),
('Paracetamol',            'tablet',  200.00, 2000),
('Amoxicillin',            'capsule', 800.00, 1200),
('Ibuprofen',              'tablet',  300.00, 1500),
('ORS',                    'sachet',  150.00, 800),
('Iron Supplements',       'tablet',  400.00, 600),
('Antihistamine',          'tablet',  250.00, 900),
('Metformin',              'tablet',  600.00, 700),
('Amlodipine',             'tablet',  500.00, 650),
('BCG Vaccine',            'vial',   2500.00, 120),
('OPV Vaccine',            'vial',   1800.00, 150),
('Pentavalent Vaccine',    'vial',   3200.00, 100),
('Measles Vaccine',        'vial',   2200.00, 110),
('Tetanus Toxoid',         'vial',   1500.00, 200);

-- ============================================================
-- PRESCRIPTIONS (from consultations)
-- ============================================================
INSERT INTO prescription (consultation_id, doctor_id, status) VALUES
(1,1,'dispensed'),(2,3,'dispensed'),(3,5,'dispensed'),(4,1,'dispensed'),
(5,2,'dispensed'),(6,1,'dispensed'),(7,3,'dispensed'),(8,5,'dispensed'),
(9,1,'dispensed'),(10,3,'dispensed'),(11,5,'dispensed'),(12,1,'dispensed'),
(13,4,'dispensed'),(14,3,'dispensed'),(15,2,'dispensed'),(16,1,'dispensed'),
(17,4,'dispensed'),(18,5,'dispensed'),(19,1,'dispensed'),(20,2,'dispensed'),
(21,1,'dispensed'),(22,3,'dispensed'),(23,5,'dispensed'),(24,1,'dispensed'),
(25,4,'dispensed'),(26,2,'dispensed'),(27,5,'dispensed');

-- ============================================================
-- PRESCRIPTION ITEMS
-- ============================================================
INSERT INTO prescription_item (prescription_id, medication_id, dosage, quantity, unit_price) VALUES
(1,1,'2 tablets twice daily for 3 days',6,1500.00),
(1,2,'1 tablet three times daily',9,200.00),
(2,6,'1 tablet daily',30,400.00),
(3,9,'1 tablet daily',30,500.00),
(4,2,'1 tablet as needed',5,200.00),
(5,11,'0.5 ml single dose',1,1800.00),
(6,3,'1 capsule three times daily',15,800.00),
(7,6,'1 tablet daily',30,400.00),
(8,7,'1 tablet daily',7,250.00),
(9,1,'2 tablets twice daily for 3 days',6,1500.00),
(10,6,'1 tablet daily',30,400.00),
(11,4,'1 tablet twice daily',10,300.00),
(12,3,'1 capsule three times daily',15,800.00),
(13,8,'1 tablet twice daily',60,600.00),
(14,6,'1 tablet daily',30,400.00),
(15,12,'0.5 ml single dose',1,3200.00),
(16,5,'1 sachet after each stool',10,150.00),
(17,9,'1 tablet daily',30,500.00),
(18,2,'1 tablet as needed',5,200.00),
(19,1,'2 tablets twice daily for 3 days',6,1500.00),
(20,13,'0.5 ml single dose',1,2200.00),
(21,2,'1 tablet three times daily',9,200.00),
(22,6,'1 tablet daily',30,400.00),
(23,4,'1 tablet twice daily',10,300.00),
(24,6,'1 tablet daily',30,400.00),
(25,8,'1 tablet twice daily',60,600.00),
(26,14,'0.5 ml single dose',1,1500.00),
(27,3,'1 capsule three times daily',15,800.00);

-- ============================================================
-- LAB TESTS (15)
-- ============================================================
INSERT INTO lab_test (patient_id, doctor_id, test_type, requested_at, status) VALUES
(1,1,'Malaria RDT',          '2026-01-05 09:15:00','completed'),
(2,3,'Blood Group',          '2026-01-06 10:45:00','completed'),
(3,5,'Lipid Profile',        '2026-01-07 11:15:00','completed'),
(5,2,'Haemoglobin',          '2026-01-09 14:15:00','completed'),
(8,5,'Skin Swab Culture',    '2026-01-12 10:30:00','completed'),
(9,1,'Malaria RDT',          '2026-01-13 08:15:00','completed'),
(10,3,'Urinalysis',          '2026-01-14 15:45:00','completed'),
(12,1,'Widal Test',          '2026-01-16 10:15:00','completed'),
(13,4,'HbA1c',               '2026-01-17 11:45:00','completed'),
(16,1,'Stool Culture',       '2026-01-20 14:45:00','completed'),
(17,4,'Lipid Profile',       '2026-01-21 08:45:00','completed'),
(19,1,'Malaria RDT',         '2026-01-23 09:30:00','completed'),
(24,1,'Full Blood Count',    '2026-01-28 09:45:00','completed'),
(25,4,'HbA1c',               '2026-01-29 11:00:00','completed'),
(27,5,'Chest X-Ray',         '2026-02-01 08:45:00','completed');

-- ============================================================
-- LAB RESULTS
-- ============================================================
INSERT INTO lab_result (test_id, result_value, result_unit, technician_id) VALUES
(1,'Positive','',10),
(2,'O+','',10),
(3,'Total cholesterol 220','mg/dL',11),
(4,'11.5','g/dL',12),
(5,'Staphylococcus aureus','',11),
(6,'Positive','',10),
(7,'Protein trace','',12),
(8,'Positive (1:160)','',10),
(9,'7.2','%',11),
(10,'No growth','',12),
(11,'Total cholesterol 190','mg/dL',11),
(12,'Positive','',10),
(13,'9.8','g/dL',12),
(14,'7.8','%',11),
(15,'Mild infiltrate','',12);

-- ============================================================
-- PAYMENTS (20)
-- ============================================================
INSERT INTO payment (patient_id, appointment_id, amount, method, status) VALUES
(1,1,  2500.00,'cash','paid'),
(2,2,  3000.00,'insurance','paid'),
(3,3,  4000.00,'card','paid'),
(4,4,  1500.00,'cash','paid'),
(5,5,  2000.00,'insurance','paid'),
(6,6,  2200.00,'cash','paid'),
(7,7,  3000.00,'insurance','paid'),
(8,8,  1800.00,'card','paid'),
(9,9,  2500.00,'cash','paid'),
(10,10,3000.00,'insurance','paid'),
(11,11,2000.00,'cash','paid'),
(12,12,2800.00,'transfer','paid'),
(13,13,3500.00,'insurance','paid'),
(14,14,3000.00,'insurance','paid'),
(15,15,2000.00,'cash','paid'),
(16,16,2500.00,'card','paid'),
(17,17,3500.00,'insurance','paid'),
(18,18,1500.00,'cash','paid'),
(19,19,2500.00,'cash','paid'),
(20,20,2000.00,'insurance','paid');

-- ============================================================
-- AUDIT LOG (sample entries)
-- ============================================================
INSERT INTO audit_log (table_name, record_id, action, changed_by, details) VALUES
('patient',    1, 'INSERT', 15, JSON_OBJECT('note','Patient registered at Garki PHC')),
('patient',    2, 'INSERT', 16, JSON_OBJECT('note','Patient registered at Wuse PHC')),
('appointment',1, 'INSERT', 15, JSON_OBJECT('note','Appointment booked for patient 1')),
('appointment',1, 'UPDATE', 1,  JSON_OBJECT('from','booked','to','completed')),
('consultation',1,'INSERT', 1,  JSON_OBJECT('note','Consultation recorded for appointment 1')),
('prescription',1,'INSERT', 1,  JSON_OBJECT('note','Prescription issued')),
('medication', 1, 'UPDATE', 13, JSON_OBJECT('field','stock_qty','delta',-6)),
('lab_test',   1, 'INSERT', 1,  JSON_OBJECT('note','Malaria RDT requested')),
('lab_result', 1, 'INSERT', 10, JSON_OBJECT('note','Lab result recorded')),
('payment',    1, 'INSERT', 15, JSON_OBJECT('note','Payment received for appointment 1'));
