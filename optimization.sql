-- 1. Add Index to Foreign Key
CREATE INDEX idx_department_id ON workers(department_id);

-- 2. Add Index to Salary (For range scanning)
CREATE INDEX idx_salary ON workers(salary);

-- 3. Add Index to Department Name
CREATE INDEX idx_dept_name ON departments(name);

-- After running these, re-run slow_query.sql to see the magic!
