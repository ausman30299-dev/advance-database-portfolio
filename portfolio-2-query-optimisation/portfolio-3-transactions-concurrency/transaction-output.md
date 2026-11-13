## Demo 2: Savepoints
 MySQL returned an empty result set (i.e. zero rows). (Query took 0.0002 seconds.)
START TRANSACTION;
[ Edit inline ] [ Edit ] [ Create PHP code ]
 1 row inserted.
Inserted row id: 41 (Query took 0.0007 seconds.)
-- 1. Register a new patient INSERT INTO patient (first_name, last_name, dob, gender, phone, address, registered_branch_id) VALUES ('Test', 'Patient', '1990-01-01', 'M', '0800-000-0000', 'Abuja', 1);
[ Edit inline ] [ Edit ] [ Create PHP code ]
 MySQL returned an empty result set (i.e. zero rows). (Query took 0.0003 seconds.)
-- Create a savepoint! SAVEPOINT after_patient_insert;
[ Edit inline ] [ Edit ] [ Create PHP code ]
 MySQL returned an empty result set (i.e. zero rows). (Query took 0.0003 seconds.)
-- 2. Create an appointment for this patient SET @new_patient_id = LAST_INSERT_ID();
[ Edit inline ] [ Edit ] [ Create PHP code ]
 1 row inserted.
Inserted row id: 31 (Query took 0.0012 seconds.)
INSERT INTO appointment (patient_id, doctor_id, branch_id, scheduled_at, status, reason) VALUES (@new_patient_id, 1, 1, '2026-03-01 10:00:00', 'booked', 'Test appointment');
[ Edit inline ] [ Edit ] [ Create PHP code ]
 MySQL returned an empty result set (i.e. zero rows). (Query took 0.0004 seconds.)
-- 3. Oops! We used the wrong details. Rollback ONLY the appointment. ROLLBACK TO SAVEPOINT after_patient_insert;
[ Edit inline ] [ Edit ] [ Create PHP code ]
 MySQL returned an empty result set (i.e. zero rows). (Query took 0.0076 seconds.)
-- 4. The patient is still saved, but the appointment is gone. Let's finish. COMMIT;
[ Edit inline ] [ Edit ] [ Create PHP code ]
Open new phpMyAdmin window
