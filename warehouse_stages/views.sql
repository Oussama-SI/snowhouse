CREATE VIEW tasty_bytes.public.truck_franchise AS
SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes.raw_pos.truck t
JOIN tasty_bytes.raw_pos.franchise f
    ON t.franchise_id = f.franchise_id
where franchisee_first_name = 'Sara';


DESCRIBE VIEW tasty_bytes.public.truck_franchise;

DROP VIEW tasty_bytes.public.truck_franchise;

CREATE OR REPLACE DYNAMIC TABLE tasty_bytes.public.truck_franchise_dynamic
    TARGET_LAG = '1 hour'
    WAREHOUSE = COMPUTE_WH
AS
SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes.raw_pos.truck t
JOIN tasty_bytes.raw_pos.franchise f
    ON t.franchise_id = f.franchise_id
where franchisee_first_name = 'Sara';

CREATE OR REPLACE DYNAMIC TABLE test_database.test_schema.nissan 
TARGET_LAG = '5 minutes' 
WAREHOUSE = compute_wh 
AS SELECT t.* 
FROM tasty_bytes.raw_pos.truck t 
WHERE t.make = 'Nissan';

DROP DYNAMIC TABLE test_database.test_schema.nissan;
DROP DYNAMIC TABLE tasty_bytes.public.truck_franchise_dynamic;
