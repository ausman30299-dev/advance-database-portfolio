# Query Optimisation Analysis

## Overview
This document analyses the performance of 5 queries run against the `nphcda_clinic` database. It compares execution plans taken **before** adding indexes (`before-indexes.txt`) with plans taken **after** adding targeted indexes (`after-indexes.txt`). 

The primary goal was to eliminate full table scans and reduce temporary filesorts.

## Indexes Applied
The following indexes were added in `indexes.sql`:
1. `idx_appointment_patient_date` on `appointment (patient_id, scheduled_at)`
2. `idx_appointment_date` on `appointment (scheduled_at)`
3. `idx_payment_appointment` on `payment (appointment_id)`
4. `idx_payment_patient` on `payment (patient_id)`
5. `idx_prescription_item_med` on `prescription_item (medication_id)`

---

## Query-by-Query Analysis

### Query 1 — Patient visit history
* **Before:** The optimiser performed a `Table scan on appointment` because it had to look through all 30 rows to find those belonging to `patient_id = 1`. It also performed a table scan on `payment`.
* **After:** The optimiser now uses `Index lookup on appointment using idx_appointment_patient_date`. The rows examined dropped to exactly 1. 
* **Result:** The table scan is eliminated, and the query time significantly decreased.

### Query 2 — Appointment count per doctor per branch
* **Before:** The plan showed a `Table scan on appointment` and relied on `Using temporary; Using filesort` to group the counts.
* **After:** While a filesort still exists (because we are grouping by branch and doctor, which are in different tables), the `Table scan` is now faster because the joins utilise the primary keys and the new indexes. The cost decreased.
* **Result:** Better join performance.

### Query 3 — Revenue by branch
* **Before:** The optimiser used a `Table scan on payment` to filter `status = 'paid'`.
* **After:** The plan now uses `Index lookup on payment using idx_payment_patient` and `idx_payment_appointment` to perform the joins, making the aggregation much faster. 
* **Result:** Eliminated the full table scan on the payment table.

### Query 4 — Monthly appointment trend
* **Before:** Because we filtered by `scheduled_at`, MySQL had to perform a `Table scan on appointment` to check the dates for every single row.
* **After:** The optimiser now uses `Index range scan on appointment using idx_appointment_date`. It can jump straight to the `2026-01-01` mark and stop at `2027-01-01`.
* **Result:** Massive reduction in rows examined. A table scan was replaced by a highly efficient range scan. (Note: `Using temporary; Using filesort` remains because `DATE_FORMAT()` is a function).

### Query 5 — Top prescribed medications
* **Before:** A `Table scan on prescription_item` was performed to find the medication IDs.
* **After:** The optimiser uses `Index lookup on prescription_item using idx_prescription_item_med`. It joins the `medication` table much faster.
* **Result:** The join cost dropped significantly, and the table scan was eliminated.

---

## Conclusion
The addition of targeted composite and single-column indexes successfully transformed slow, resource-intensive full table scans into fast index lookups and range scans. 

Where `Using temporary; Using filesort` remains (Queries 2, 3, 4), this is due to `GROUP BY` clauses on calculated columns (like `DATE_FORMAT`) or columns spread across multiple joined tables. In these cases, the performance penalty is minimal due to the small dataset, and further indexing would not provide a meaningful return on investment.
