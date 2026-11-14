# SQL results

Output of [`03_analysis.sql`](03_analysis.sql) run in PostgreSQL 16 on the cleaned data (20,000 applications, 14,577 Video KYC calls).

## Q1. What is the overall completion rate?

```
 total | completed | completion_pct 
-------+-----------+----------------
 20000 |     10526 |           52.6
(1 row)
```

**Insight:** 52.6% of customers who start the journey complete it.

## Q2. Funnel: how many customers reached each stage?

```
 stage_no | reached | pct_of_start 
----------+---------+--------------
        1 |   20000 |        100.0
        2 |   19037 |         95.2
        3 |   17550 |         87.8
        4 |   15676 |         78.4
        5 |   14577 |         72.9
        6 |   11401 |         57.0
        7 |   11040 |         55.2
(7 rows)
```

**Insight:** The biggest single fall is from stage 5 (Video KYC, 14,577) to stage 6 (11,401).

## Q3. At which stage do customers drop off?

```
 last_stage_no |      last_stage_name       | dropped 
---------------+----------------------------+---------
             1 | Mobile OTP                 |     963
             2 | Personal Details           |    1487
             3 | PAN Verification           |    1874
             4 | Aadhaar eKYC               |    1099
             5 | Video KYC                  |    3176
             6 | Nominee & Preferences      |     361
             7 | First Deposit & Activation |     514
(7 rows)
```

**Insight:** Video KYC loses the most customers (3,176), followed by PAN Verification (1,874).

## Q4. Why do customers drop at Video KYC?

```
      drop_reason      | cases 
-----------------------+-------
 Missed scheduled call |  1365
 Long wait for agent   |  1143
 Poor network on call  |   668
(3 rows)
```

**Insight:** Missed calls and long waits explain 2,508 of the 3,176 Video KYC drops (79%).

## Q5. Which time band has the longest agent wait and highest failure?

```
 time_band | calls | avg_wait_min | fail_pct 
-----------+-------+--------------+----------
 Morning   |  2998 |          5.5 |     13.3
 Afternoon |  3600 |          8.5 |     17.2
 Evening   |  5134 |         15.5 |     23.3
 Night     |  2845 |         27.5 |     33.8
(4 rows)
```

**Insight:** Night customers wait 5x longer than morning customers (27.5 vs 5.5 min) and fail 2.5x as often.

## Q6. How does failure change as wait time grows?

```
 wait_bucket | calls | fail_pct 
-------------+-------+----------
 0-5         |  3189 |     11.2
 6-15        |  6404 |     18.1
 16-30       |  3659 |     28.9
 30+         |  1325 |     45.4
(4 rows)
```

**Insight:** Failure rises steadily with wait: 11.2% at 0-5 min to 45.4% above 30 min.

## Q7. Video KYC approval by city tier (JOIN)

```
 city_tier | calls | avg_wait_min | approval_pct 
-----------+-------+--------------+--------------
 Tier 1    |  5796 |         14.1 |         79.7
 Tier 2    |  5133 |         14.2 |         78.3
 Tier 3    |  3526 |         13.7 |         75.6
 Unknown   |   122 |         14.6 |         79.5
(4 rows)
```

**Insight:** Wait time is the same across tiers (~14 min), but Tier 3 approval is lower (75.6%), pointing to network quality, not queueing.

## Q8. Completion rate by channel and by city tier

```
 dimension |  value  | applications | completion_pct 
-----------+---------+--------------+----------------
 channel   | iOS     |         4576 |           53.1
 channel   | Android |        12593 |           52.8
 channel   | Web     |         2831 |           51.0
 city_tier | Tier 1  |         7859 |           54.3
 city_tier | Tier 2  |         6929 |           53.7
 city_tier | Tier 3  |         5032 |           48.8
 city_tier | Unknown |          180 |           48.3
(7 rows)
```

**Insight:** Channel matters little (51-53%); Tier 3 cities trail Tier 1 by 5.5 points.

## Q9. Completion rate by acquisition source

```
   source   | applications | completion_pct 
------------+--------------+----------------
 Referral   |         2975 |           54.5
 Organic    |         5903 |           52.7
 Google Ads |         4009 |           52.5
 Social Ads |         7113 |           51.8
(4 rows)
```

**Insight:** Referral customers complete slightly more often (54.5%) than Social Ads (51.8%).

## Q10. Monthly applications and completion rate (CTE)

```
   month    | applications | completed | completion_pct 
------------+--------------+-----------+----------------
 2026-04-01 |         3330 |      1771 |           53.2
 2026-05-01 |         3376 |      1752 |           51.9
 2026-06-01 |         3273 |      1699 |           51.9
 2026-07-01 |         3366 |      1768 |           52.5
 2026-08-01 |         3426 |      1762 |           51.4
 2026-09-01 |         3229 |      1774 |           54.9
(6 rows)
```

**Insight:** Completion is stable month to month (51-55%), so the problem is structural, not seasonal.

## Q11. Average journey time for completed customers (minutes)

```
 avg_minutes_completed 
-----------------------
                  48.1
(1 row)
```

**Insight:** Completed customers spend about 48 minutes on average across the journey.

