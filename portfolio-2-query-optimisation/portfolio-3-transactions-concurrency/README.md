# Portfolio 3: Transactions and Concurrency

This folder demonstrates the ACID properties of the `nphcda_clinic` database, specifically focusing on Atomicity and Isolation. It includes SQL scripts for COMMIT, ROLLBACK, SAVEPOINTS, and row-level locking.

## Folder Contents

* `transaction-demo.sql`: Contains the SQL scripts used to test transaction committing, rolling back, and savepoints.
* `concurrency-demo.md`: A written explanation and evidence of how the database handles simultaneous connections (row-level locking).
* `transaction-output.md`: Captured outputs/screenshots showing the before and after states of the database during the transaction tests.
* `README.md`: This instruction file.

## Demonstrations Included

### 1. Atomicity (COMMIT and ROLLBACK)
* **The Happy Path (COMMIT):** Simulates a pharmacist successfully dispensing medication and deducting the stock. Once both actions succeed, the `COMMIT` command saves the changes permanently.
* **The Error Path (ROLLBACK):** Simulates a scenario where a prescription is created, but the requested quantity exceeds available stock. The `ROLLBACK` command cancels the entire transaction, ensuring no partial data is saved. 

### 2. Partial Rollbacks (SAVEPOINTS)
* Demonstrates how to create a `SAVEPOINT` during a transaction. If an error occurs later in the process, the database can `ROLLBACK TO SAVEPOINT` without losing the valid work done prior to the savepoint.

### 3. Concurrency and Locking (Isolation)
* Demonstrates MySQL's default `InnoDB` row-level locking. 
* When User A runs a `SELECT ... FOR UPDATE` on a specific row, User B is temporarily blocked from modifying that row until User A runs `COMMIT` or `ROLLBACK`. This prevents race conditions (e.g., two pharmacists trying to deduct the last box of medication at the same time).

## How to Reproduce

1. Ensure XAMPP and MySQL are running.
2. Open phpMyAdmin and select the `nphcda_clinic` database.
3. Run the scripts in `transaction-demo.sql` in the SQL tab. Observe how the `COMMIT` saves data, while the `ROLLBACK` discards it.
4. To test concurrency, open two separate browser tabs with phpMyAdmin. Follow the steps outlined in `concurrency-demo.md`.
