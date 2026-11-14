# DAX measures

Tables: `applications` (applications_clean.csv), `vkyc_calls` (vkyc_calls.csv), related on `application_id` (one to one / one to many).

```
Total Applications = COUNTROWS(applications)

Completed = CALCULATE([Total Applications], applications[status] = "Completed")

Completion % = DIVIDE([Completed], [Total Applications])

Dropped = CALCULATE([Total Applications], applications[status] = "Dropped")

VKYC Calls = COUNTROWS(vkyc_calls)

Avg Wait (min) = AVERAGE(vkyc_calls[wait_minutes])

VKYC Fail % = DIVIDE(CALCULATE([VKYC Calls], vkyc_calls[call_result] <> "Approved"), [VKYC Calls])

Share of Drops = DIVIDE([Dropped], CALCULATE([Dropped], ALL(applications[last_stage_name])))
```

Calculated columns on `vkyc_calls`:

```
Wait Bucket = SWITCH(TRUE(),
    vkyc_calls[wait_minutes] <= 5, "0-5",
    vkyc_calls[wait_minutes] <= 15, "6-15",
    vkyc_calls[wait_minutes] <= 30, "16-30",
    "30+")

Bucket Order = SWITCH(TRUE(),
    vkyc_calls[wait_minutes] <= 5, 1,
    vkyc_calls[wait_minutes] <= 15, 2,
    vkyc_calls[wait_minutes] <= 30, 3,
    4)
```

Sort `Wait Bucket` by `Bucket Order` (Column tools > Sort by column).

**Expected values:** Total Applications 20,000 · Completed 10,526 · Completion % 52.6% · Avg Wait 14.0 · VKYC Fail % 21.8%.
