# 02_excel

[`QuickOpen_Analysis.xlsx`](QuickOpen_Analysis.xlsx): the full Excel analysis.

| Sheet | What it shows |
| --- | --- |
| About | What each sheet does |
| Cleaning_Log | The 3 data-quality issues fixed in the raw file (150 duplicates, 500 inconsistent channel values, 180 blank city tiers) |
| Clean_Data | 20,000 cleaned applications as an Excel Table (`apps`) |
| VKYC_Calls | 14,577 Video KYC calls, with a `wait_bucket` column built with nested `IF` |
| Funnel | Customers reaching each of the 7 stages (`COUNTIF` with `">="&stage`), % of start, pass rate, and a bar chart |
| Analysis | Drop-off by stage, VKYC drop reasons, completion by channel / city tier / source, VKYC wait and failure by time band and by wait bucket (`COUNTIFS`, `AVERAGEIF`), plus a chart |

Every number on Funnel and Analysis is a formula, and all of them match the SQL results in [`../03_sql/results.md`](../03_sql/results.md).

**Excel skills used:** Remove Duplicates, `TRIM`, `PROPER`, Go To Special, Excel Tables, `COUNTIF`, `COUNTIFS`, `AVERAGEIF`, nested `IF`, absolute references, number formats, charts.
