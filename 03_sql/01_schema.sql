-- QuickOpen: table setup (PostgreSQL)
DROP TABLE IF EXISTS vkyc_calls;
DROP TABLE IF EXISTS applications;

CREATE TABLE applications (
  application_id   VARCHAR(10) PRIMARY KEY,
  start_date       DATE,
  channel          VARCHAR(10),
  city_tier        VARCHAR(10),
  age_group        VARCHAR(10),
  source           VARCHAR(20),
  last_stage_no    INT,
  last_stage_name  VARCHAR(40),
  status           VARCHAR(10),
  drop_reason      VARCHAR(40),
  total_minutes    INT
);

CREATE TABLE vkyc_calls (
  application_id   VARCHAR(10) REFERENCES applications(application_id),
  time_band        VARCHAR(10),
  wait_minutes     INT,
  call_result      VARCHAR(25)
);
