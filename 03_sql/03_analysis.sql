-- QuickOpen: business questions (PostgreSQL)

-- Q1. What is the overall completion rate?
SELECT COUNT(*) AS total,
       SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed,
       ROUND(100.0 * SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) / COUNT(*), 1) AS completion_pct
FROM applications;

-- Q2. Funnel: how many customers reached each stage?
SELECT s.stage_no,
       COUNT(a.application_id) AS reached,
       ROUND(100.0 * COUNT(a.application_id) / (SELECT COUNT(*) FROM applications), 1) AS pct_of_start
FROM generate_series(1, 7) AS s(stage_no)
LEFT JOIN applications a ON a.last_stage_no >= s.stage_no
GROUP BY s.stage_no
ORDER BY s.stage_no;

-- Q3. At which stage do customers drop off?
SELECT last_stage_no, last_stage_name, COUNT(*) AS dropped
FROM applications
WHERE status = 'Dropped'
GROUP BY last_stage_no, last_stage_name
ORDER BY last_stage_no;

-- Q4. Why do customers drop at Video KYC?
SELECT drop_reason, COUNT(*) AS cases
FROM applications
WHERE status = 'Dropped' AND last_stage_name = 'Video KYC'
GROUP BY drop_reason
ORDER BY cases DESC;

-- Q5. Which time band has the longest agent wait and highest failure?
SELECT time_band,
       COUNT(*) AS calls,
       ROUND(AVG(wait_minutes), 1) AS avg_wait_min,
       ROUND(100.0 * SUM(CASE WHEN call_result <> 'Approved' THEN 1 ELSE 0 END) / COUNT(*), 1) AS fail_pct
FROM vkyc_calls
GROUP BY time_band
ORDER BY avg_wait_min;

-- Q6. How does failure change as wait time grows?
SELECT CASE WHEN wait_minutes <= 5  THEN '0-5'
            WHEN wait_minutes <= 15 THEN '6-15'
            WHEN wait_minutes <= 30 THEN '16-30'
            ELSE '30+' END AS wait_bucket,
       COUNT(*) AS calls,
       ROUND(100.0 * SUM(CASE WHEN call_result <> 'Approved' THEN 1 ELSE 0 END) / COUNT(*), 1) AS fail_pct
FROM vkyc_calls
GROUP BY wait_bucket
ORDER BY MIN(wait_minutes);

-- Q7. Video KYC approval by city tier (JOIN)
SELECT a.city_tier,
       COUNT(*) AS calls,
       ROUND(AVG(v.wait_minutes), 1) AS avg_wait_min,
       ROUND(100.0 * SUM(CASE WHEN v.call_result = 'Approved' THEN 1 ELSE 0 END) / COUNT(*), 1) AS approval_pct
FROM applications a
INNER JOIN vkyc_calls v ON a.application_id = v.application_id
GROUP BY a.city_tier
ORDER BY a.city_tier;

-- Q8. Completion rate by channel and by city tier
SELECT 'channel' AS dimension, channel AS value, COUNT(*) AS applications,
       ROUND(100.0 * SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) / COUNT(*), 1) AS completion_pct
FROM applications GROUP BY channel
UNION ALL
SELECT 'city_tier', city_tier, COUNT(*),
       ROUND(100.0 * SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) / COUNT(*), 1)
FROM applications GROUP BY city_tier
ORDER BY dimension, completion_pct DESC;

-- Q9. Completion rate by acquisition source
SELECT source, COUNT(*) AS applications,
       ROUND(100.0 * SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) / COUNT(*), 1) AS completion_pct
FROM applications
GROUP BY source
ORDER BY completion_pct DESC;

-- Q10. Monthly applications and completion rate (CTE)
WITH monthly AS (
  SELECT DATE_TRUNC('month', start_date)::date AS month,
         COUNT(*) AS applications,
         SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed
  FROM applications
  GROUP BY 1
)
SELECT month, applications, completed,
       ROUND(100.0 * completed / applications, 1) AS completion_pct
FROM monthly
ORDER BY month;

-- Q11. Average journey time for completed customers (minutes)
SELECT ROUND(AVG(total_minutes), 1) AS avg_minutes_completed
FROM applications
WHERE status = 'Completed';
