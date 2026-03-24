# SQL Query Optimization Case (Real-World Scenario)

## Problem

A reporting query in a production-like system was taking ~5 seconds to execute, causing delays in API responses and poor user experience.

## Root Cause

* Full table scan on large dataset
* Missing index on foreign key
* Inefficient filtering condition

## Solution

* Added composite index on (department_id, salary)
* Improved JOIN condition
* Analyzed execution plan using EXPLAIN

## Result

* Query time reduced from 5s → 0.2s (~95% improvement)
* Eliminated full table scan
* Improved system responsiveness

## Before vs After

| Metric         | Before | After |
| -------------- | ------ | ----- |
| Execution Time | ~5s    | ~0.2s |
| Scan Type      | ALL    | ref   |
| Rows Scanned   | High   | Low   |

## Tech Stack

* MySQL
* SQL
## Engineering Analysis
See detailed explanation in analysis.md
