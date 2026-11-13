# Portfolio 2: Query Processing and Optimisation

This folder contains the SQL queries, execution plans, and performance analysis for the `nphcda_clinic` database.

## Folder Contents

* `queries.sql`: Contains the 5 core SQL queries used for this portfolio.
* `indexes.sql`: Contains the `CREATE INDEX` statements applied to optimise the queries.
* `before-indexes.txt`: The `EXPLAIN ANALYZE` outputs for the 5 queries *before* optimisation.
* `after-indexes.txt`: The `EXPLAIN ANALYZE` outputs for the 5 queries *after* the indexes were applied.
* `analysis.md`: A detailed breakdown of the before/after execution plans, explaining the optimiser's choices.

## How to reproduce this portfolio

1. Ensure the `nphcda_clinic` database is imported and seeded (see Portfolio 1).
2. Open `queries.sql` in phpMyAdmin and run the queries to see the results.
3. To see the baseline performance, run the `EXPLAIN ANALYZE` commands found in `before-indexes.txt`.
4. Run the SQL commands in `indexes.sql` to apply the optimisation.
5. Re-run the `EXPLAIN ANALYZE` commands in `after-indexes.txt` to see the performance improvements.
6. Read `analysis.md` for the full performance report.
