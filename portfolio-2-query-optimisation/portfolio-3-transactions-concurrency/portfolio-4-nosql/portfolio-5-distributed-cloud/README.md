NPHCDA Clinic — Organisation Statement + Normalisation Writeup
Paste both sections below directly into your portfolio-1-database-design/README.md on GitHub. They're written to exam standard — clear, specific, and defensible if you're sampled for verification.

PART A — Organisation Statement
Selected Case Study: NPHCDA Primary Health Care Centre
Organisation name: NPHCDA Primary Health Care Centre (simulated case study modelled on the National Primary Health Care Development Agency, Nigeria).

Nature of the business/system:
The organisation is a government-run primary healthcare provider operating multiple Primary Health Care (PHC) centres across Local Government Areas (LGAs) and states. Each PHC centre delivers outpatient consultations, maternal and child health services, immunisation, laboratory testing, and pharmaceutical dispensing. A central coordinating office aggregates health data across PHCs for reporting, planning, and national health surveillance.

The database system supports day-to-day clinical operations at each PHC centre and provides consolidated data for LGA- and state-level health administration.

Users of the database:

User role	Primary interaction with the system
Health Records Officer (receptionist)	Registers patients, books and cancels appointments, records payments
Doctor	Records consultations and diagnoses, issues prescriptions, requests lab tests
Nurse / Midwife	Assists consultations, records immunisation and maternal health data
Laboratory Technician	Records lab test results against requested tests
Pharmacist	Dispenses prescriptions, updates medication stock levels
PHC Administrator	Manages staff and branch records, monitors stock and appointment load
LGA / State Health Officer	Reviews aggregated reports across PHCs (read-only reporting access)
Patient	Receives care; may query their own visit history via a patient-facing portal
Major data to be stored:

PHC centres (branches): name, address, contact details

Staff: health workers and administrative staff, their roles, branch assignment, contact details

Doctors: medical specialisation and licence details (a specialisation of staff)

Patients: demographic and contact information, registered PHC centre

Appointments: scheduled visits linking patients, doctors, and PHC centres

Consultations: diagnosis and clinical notes recorded against completed appointments

Medications and vaccines: drug/vaccine name, form, unit price, stock quantity

Prescriptions and prescription items: medications issued per consultation, dosage, quantity, price at time of dispensing

Laboratory tests and results: test type requested, result value, unit, recording technician

Payments: amount, method (cash, card, transfer, NHIS/insurance), status

Audit logs: who changed which record, when, and what changed

Key operations the database will support:

Register a new patient at a PHC centre.

Book, reschedule, or cancel an appointment with a doctor.

Record a consultation, diagnosis, and clinical notes after a visit.

Issue a prescription containing one or more medications.

Dispense a prescription with an atomic stock check and deduction.

Request a laboratory test and record its result.

Process a payment (cash, card, transfer, or NHIS/insurance) against a visit.

Retrieve a patient's full visit history across consultations, prescriptions, lab tests, and payments.

Track immunisation and medication stock levels per PHC centre.

Maintain an audit trail of insertions, updates, and deletions for accountability.

Why this case study suits the portfolio:
The NPHCDA multi-PHC structure naturally supports all five portfolio activities. The relational schema captures clinical and financial data with strong integrity constraints (Portfolio 1). Clinical and administrative questions — patient history, PHC-level immunisation coverage, stock-out analysis — provide realistic query and optimisation scenarios (Portfolio 2). Appointment booking, prescription dispensing, and payment processing are inherently transactional operations requiring commit, rollback, and concurrency control (Portfolio 3). Clinical notes and immunisation records are semi-structured and suit a document-oriented NoSQL model (Portfolio 4). Finally, the geographical distribution of PHC centres across LGAs and states provides a genuine distributed database scenario involving replication, sharding, availability, and consistency trade-offs (Portfolio 5).

PART B — Normalisation Writeup
Normalisation Analysis
The relational schema was designed through a process of identifying entities, attributes, and functional dependencies, then applying normalisation to the Third Normal Form (3NF). Each stage is documented below.

1. Unnormalised Form (UNF) — identified problems
An initial flat representation of clinic data would combine patient, appointment, doctor, prescription, and medication details into a single record, for example:

(patient_id, patient_name, dob, gender, phone, branch_name, doctor_name, specialty, appointment_datetime, diagnosis, medication_list, lab_tests, payment_amount)

This design has multiple problems: repeating groups (medication_list, lab_tests), redundant patient and branch data repeated per appointment, and update/insert/delete anomalies.

2. First Normal Form (1NF) — atomic values, no repeating groups
Rule applied: Every attribute must hold a single atomic value, each row must be uniquely identifiable, and there must be no repeating groups.

Changes made:

The repeating medication_list was extracted into a separate prescription_item table, with one row per medication per prescription.

The repeating lab_tests were extracted into a separate lab_test table (and lab_result for results).

Multi-valued concepts such as a patient's addresses were kept atomic; only a single contact address is stored in this scope.

Every table received a primary key (patient_id, appointment_id, prescription_id, item_id, etc.).

Result: All 13 tables in the schema are in 1NF — each cell contains one value, each table has a primary key, and there are no repeating groups.

3. Second Normal Form (2NF) — remove partial dependencies
Rule applied: The table must be in 1NF, and every non-key attribute must depend on the whole primary key — not part of it.

Analysis:

Most tables use a single-attribute surrogate primary key (branch_id, patient_id, appointment_id, etc.), so partial dependency is impossible by definition.

The only table with a potential composite key is prescription_item, which logically relates prescription_id and medication_id. Instead of a composite primary key, the table uses a surrogate item_id. The non-key attributes dosage, quantity, and unit_price describe a specific line item, not just the prescription or the medication alone. Therefore they depend fully on item_id, satisfying 2NF.

appointment's non-key attributes (scheduled_at, status, reason) depend on the full appointment_id, not on patient_id or doctor_id separately.

Result: All tables satisfy 2NF.

4. Third Normal Form (3NF) — remove transitive dependencies
Rule applied: The table must be in 2NF, and no non-key attribute may depend transitively on another non-key attribute (i.e., no non-key attribute should determine another non-key attribute).

Changes made:

Doctor as a specialisation of Staff. In a flat design, a doctor's specialty and license_no would sit in staff alongside non-doctor roles (nurses, pharmacists, etc.), creating attributes that apply only to doctors. These were moved to a dedicated doctor table keyed on doctor_id with a 1:1 foreign key to staff_id. This removes the transitive dependency of specialty and license_no on the role of a staff member.

Branch data in staff and patient. Rather than duplicating branch_name and branch_address in every staff and patient row, branch_id is stored as a foreign key. This removes the transitive dependency staff_id → branch_id → branch_name.

Medication details in prescription_item. Rather than storing medication name and form per line item, prescription_item references medication_id. This removes the transitive dependency item_id → medication_id → medication_name.

Lab result in a separate table. lab_result is separated from lab_test so that result values (which depend on the outcome of the test, not on the request itself) do not transitively depend on the test type.

Payment in a separate table. Payment attributes (amount, method, status) depend on the payment event, not on the appointment directly, so they are stored in their own payment table linked by foreign key.

Result: All 13 tables satisfy 3NF.

5. Documented Denormalisation (Justified Exception)
Two attributes are deliberately denormalised for business and audit reasons. This is an intentional design decision, not an oversight:

prescription_item.unit_price — stores the price of the medication at the time of dispensing. Although the current price is available via medication.unit_price, prices change over time. Storing the historical price preserves the financial truth of each prescription and prevents retroactive changes to past bills. This is a controlled redundancy justified by audit and financial-integrity requirements.

lab_result as a separate table from lab_test — strictly speaking, a 1:1 relationship could be merged into one table. It is kept separate because a lab test exists as a request before any result exists, and the result has its own recording timestamp and recording technician. Separating them avoids nullable columns in lab_test and models the real-world workflow (request → result) accurately.

Both exceptions are documented here and will be referenced in the technical reflection. They demonstrate an understanding that normalisation is a design discipline with justified exceptions, not an absolute rule.

6. Summary of Normalisation Outcome
Normal form	Status	Key evidence
1NF	✅ Achieved	Atomic values; repeating medication and lab-test groups extracted into prescription_item and lab_test/lab_result
2NF	✅ Achieved	Surrogate keys on all tables; no partial dependencies on composite keys
3NF	✅ Achieved	Doctor specialisation extracted to doctor table; branch, medication, and payment details referenced by foreign key rather than duplicated
Denormalisation	⚠️ Justified	prescription_item.unit_price (historical pricing) and separated lab_result table (workflow modelling) — both documented above