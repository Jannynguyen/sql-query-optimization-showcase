# sql-query-optimization-showcase
sql-query-optimization-showcase
SQL Performance Optimization: 2M+ Rows Query Tuning
Overview
This project demonstrates how to identify and fix performance bottlenecks in a MySQL/MariaDB database with over 2 million records. By using EXPLAIN plans and strategic Indexing, I reduced query execution time from seconds to milliseconds.
The Challenge
A common "disaster" query in production environments:
Joining large tables without proper keys.
Filtering with non-sargable operators (e.g., LIKE '%word%').
Subqueries that trigger full table scans.
Phase 1: The "Slow" Query (Before Optimization)
The Problematic SQL:
sql
SELECT COUNT(*) 
FROM workers 
WHERE salary > (SELECT AVG(salary) FROM workers) 
AND name LIKE '%Worker%';

Analysis using EXPLAIN:
id	select_type	table	type	rows	Extra
1	PRIMARY	workers	ALL	1,996,510	Using where
2	SUBQUERY	workers	ALL	1,996,510	
Type: ALL: This indicates a Full Table Scan. The database engine had to read nearly 2 million rows from the disk.
Execution Time: ~2.5 - 5 seconds (depending on hardware).
Bottleneck: No index on the salary column and a leading wildcard in the LIKE operator.

Phase 2: The Optimization (After)
The Solution:
Indexing: Applied a B-Tree index on the salary column to speed up comparisons.
Query Refactoring: While LIKE '%Worker%' is inherently slow, adding an index on salary allows the engine to filter the numerical range first before checking the string pattern.
sql
-- Adding the index
CREATE INDEX idx_salary ON workers(salary);

New EXPLAIN Result:
id	select_type	table	type	rows	Extra
1	PRIMARY	workers	range	840,120	Using where; Using index
Type: range: The engine now uses the index to jump directly to the relevant data.
Execution Time: Reduced to 0.08s (Over 30x faster).
Key Results
Query Time: ~2.5s -->reduces 0.08s
Scan Type: Full Table Scan -->change to Index Range Scan
Efficiency: Improved performance by ~96%.
How to Reproduce
Run schema.sql to create the structure.
Run the stored procedure in data_gen.sql to generate 2,000,000 rows.
Execute slow_query.sql and check the time.
Run optimization.sql to apply indexes.
Re-run the query and compare the results!
Connect with me
If you have a slow database or complex queries that need tuning, feel free to reach out via my Upwork Profile or LinkedIn.
