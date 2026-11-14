# 03_sql

| File | What it does |
| --- | --- |
| [`01_schema.sql`](01_schema.sql) | Creates the `applications` and `vkyc_calls` tables |
| [`02_load.sql`](02_load.sql) | Loads the cleaned CSVs and checks row counts |
| [`03_analysis.sql`](03_analysis.sql) | 11 business questions: funnel, drop-off, VKYC wait vs failure, city tier, channel, source, monthly trend |
| [`results.md`](results.md) | The output of every query with a one-line insight |

SQL used: `CASE WHEN`, conditional aggregates, `GROUP BY`, `INNER JOIN`, `LEFT JOIN` with `generate_series`, `UNION ALL`, a CTE and `DATE_TRUNC`.
