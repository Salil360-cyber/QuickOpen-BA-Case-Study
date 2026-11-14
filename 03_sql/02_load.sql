-- Run from the repo root in psql:  \i 03_sql/02_load.sql
-- (In pgAdmin: right-click each table > Import/Export Data > Import, CSV, Header ON)
\copy applications FROM '01_data/applications_clean.csv' WITH (FORMAT csv, HEADER true, NULL '')
\copy vkyc_calls   FROM '01_data/vkyc_calls.csv'         WITH (FORMAT csv, HEADER true)

SELECT COUNT(*) AS applications FROM applications;  -- expected 20000
SELECT COUNT(*) AS vkyc_calls   FROM vkyc_calls;    -- expected 14577
