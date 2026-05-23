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
