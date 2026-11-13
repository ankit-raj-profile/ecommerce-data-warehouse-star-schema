
-- SCD Type 2 Implementation
-- Customer Rahul changes city from Pune to Mumbai

START TRANSACTION;

-- inactive or close the previous customer record
UPDATE dim_customer
SET
    end_date = '2026-05-31',
    is_current = FALSE
WHERE cus_id = '101'
AND is_current = TRUE;

-- Inserting the new record with preserving old record as inactive
INSERT INTO dim_customer
(cus_id, cus_name, city, start_date, end_date, is_current)
VALUES
('101', 'Rahul', 'Mumbai', '2026-06-01', NULL, TRUE);

COMMIT;

-- Validate customer history
SELECT *
FROM dim_customer
WHERE cus_id = '101'
ORDER BY start_date;


  
WHERE cus_id = '101'
ORDER BY start_date;
