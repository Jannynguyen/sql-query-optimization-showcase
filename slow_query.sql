-- 1. Test Join performance without index
SELECT w.name, d.name, w.salary 
FROM workers w 
JOIN departments d ON w.department_id = d.id 
WHERE d.name = 'Production';

-- 2. Test Complex filter with subquery (The "Disaster" case)
-- Use SQL_NO_CACHE to see real disk I/O time
SELECT SQL_NO_CACHE COUNT(*) 
FROM workers 
WHERE salary > (SELECT AVG(salary) FROM workers) 
AND name LIKE '%Worker_999%';

-- 3. Check Explain plan
EXPLAIN SELECT COUNT(*) FROM workers WHERE salary > (SELECT AVG(salary) FROM workers);
