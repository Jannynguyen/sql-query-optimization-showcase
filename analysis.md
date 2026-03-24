
# Query Optimization Analysis

## 1. Why was the query slow?

The original query performed a full table scan (type: ALL), which means MySQL had to read all rows in the table.

This happens because:

* No index on the filtering column
* The database cannot quickly locate matching records

As data grows, this causes significant performance degradation.

---

## 2. How does indexing improve performance?

Indexes allow the database to quickly locate data without scanning the entire table.

Instead of checking every row, MySQL uses the index to:

* Jump directly to matching values
* Reduce the number of rows scanned

In this case, adding an index on the foreign key significantly improved lookup speed.

---

## 3. Why use composite index?

A composite index is useful when:

* Multiple columns are used together in filtering or joining
* The query frequently accesses combined conditions

Example:

* (department_id, salary)

This allows MySQL to optimize both filtering and sorting operations.

---

## 4. When NOT to use indexes?

Indexes are not always beneficial.

Avoid excessive indexing when:

* Tables have frequent INSERT/UPDATE operations
* Index is not used in queries
* Low selectivity columns (many duplicate values)

Too many indexes can slow down write performance.

---

## 5. Key takeaway

* Identify bottleneck using EXPLAIN
* Avoid full table scan when possible
* Use indexing strategically, not blindly
