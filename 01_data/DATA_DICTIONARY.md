# Data dictionary

Both files are **synthetic** (generated for practice). Sahyadri Bank is a fictional bank.

## applications_raw.csv (20,150 rows) and applications_clean.csv (20,000 rows)

One row per account-opening application, April to September 2026. The raw file deliberately contains data-quality issues for the cleaning step: 150 duplicate rows, inconsistent `channel` spellings and spaces, and 180 blank `city_tier` values. `applications_clean.csv` has these fixed: duplicates removed, `channel` standardised to Android / iOS / Web, blank `city_tier` set to `Unknown`.

| Column | Meaning |
| --- | --- |
| application_id | Unique application ID (QO00001 ...) |
| start_date | Date the customer started the journey |
| channel | Android / iOS / Web |
| city_tier | Tier 1 / Tier 2 / Tier 3 |
| age_group | 18-24 / 25-34 / 35-44 / 45+ |
| source | Social Ads / Referral / Organic / Google Ads |
| last_stage_no | Last stage reached (1-7) |
| last_stage_name | Name of that stage |
| status | Completed / Dropped |
| drop_reason | Reason for dropping (blank if completed) |
| total_minutes | Total time spent in the journey |

## vkyc_calls.csv (14,577 rows)

One row per customer who reached the Video KYC stage.

| Column | Meaning |
| --- | --- |
| application_id | Links to applications.application_id |
| time_band | Morning / Afternoon / Evening / Night |
| wait_minutes | Minutes the customer waited for a VKYC agent |
| call_result | Approved / No-show / Rejected / Reschedule Abandoned |

## Journey stages

1 Mobile OTP, 2 Personal Details, 3 PAN Verification, 4 Aadhaar eKYC, 5 Video KYC, 6 Nominee & Preferences, 7 First Deposit & Activation
