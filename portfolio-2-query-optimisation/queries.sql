-- ============================================================
-- Portfolio 2: Query Processing and Optimisation
-- File: queries.sql
-- Description: The 5 core queries used to test performance 
--              before and after adding indexes.
-- ============================================================

-- Query 1 — Patient visit history (multi-table join)
SELECT
  a.appointment_id,
  a.scheduled_at,
  CONCAT(s.first_name, ' ', s.last_name) AS doctor_name,
  b.name AS branch_name,
  c.diagnosis,
  p.amount AS amount_paid,
  p.method AS payment_method
FROM appointment a
JOIN doctor d        ON d.doctor_id = a.doctor_id
JOIN staff  s        ON s.staff_id  = d.staff_id
JOIN branch b        ON b.branch_id = a.branch_id
LEFT JOIN consultation c ON c.appointment_id = a.appointment_id
LEFT JOIN payment p      ON p.appointment_id = a.appointment_id
WHERE a.patient_id = 1
ORDER BY a.scheduled_at DESC;

-- Query 2 — Appointment count per doctor per branch
SELECT
  b.name AS branch_name,
  CONCAT(s.first_name, ' ', s.last_name) AS doctor_name,
  COUNT(a.appointment_id) AS total_appointments
FROM doctor d
JOIN staff s        ON s.staff_id  = d.staff_id
JOIN branch b       ON b.branch_id = s.branch_id
LEFT JOIN appointment a ON a.doctor_id = d.doctor_id
GROUP BY b.name, s.first_name, s.last_name
ORDER BY b.name, total_appointments DESC;

-- Query 3 — Revenue by branch
SELECT
  b.name AS branch_name,
  p.method,
  COUNT(p.payment_id) AS payment_count,
  SUM(p.amount) AS total_revenue
FROM payment p
JOIN patient pt  ON pt.patient_id = p.patient_id
JOIN branch b    ON b.branch_id  = pt.registered_branch_id
WHERE p.status = 'paid'
GROUP BY b.name, p.method
ORDER BY b.name, total_revenue DESC;

-- Query 4 — Monthly appointment trend
SELECT
  DATE_FORMAT(scheduled_at, '%Y-%m') AS month,
  COUNT(*) AS appointment_count
FROM appointment
WHERE scheduled_at >= '2026-01-01' AND scheduled_at < '2027-01-01'
GROUP BY DATE_FORMAT(scheduled_at, '%Y-%m')
ORDER BY month;

-- Query 5 — Top prescribed medications
SELECT
  m.name AS medication,
  m.form,
  COUNT(pi.item_id) AS times_prescribed,
  SUM(pi.quantity) AS total_quantity
FROM medication m
JOIN prescription_item pi ON pi.medication_id = m.medication_id
GROUP BY m.medication_id, m.name, m.form
ORDER BY times_prescribed DESC
LIMIT 5;
