DELIMITER $$

CREATE PROCEDURE GenerateData()
BEGIN
    DECLARE i INT DEFAULT 1;
    SET FOREIGN_KEY_CHECKS = 0;
    SET UNIQUE_CHECKS = 0;
    SET AUTOCOMMIT = 0;

    WHILE i <= 2000000 DO
        INSERT INTO workers (name, department_id, salary)
        VALUES (
            CONCAT('Worker_', i), 
            FLOOR(1 + RAND() * 5), 
            FLOOR(500 + RAND() * 5000)
        );
        
        IF (i % 50000 = 0) THEN
            COMMIT;
        END IF;
        
        SET i = i + 1;
    END WHILE;

    COMMIT;
    SET FOREIGN_KEY_CHECKS = 1;
    SET UNIQUE_CHECKS = 1;
    SET AUTOCOMMIT = 1;
END$$

DELIMITER ;

-- Call this to generate data:
-- CALL GenerateData();
