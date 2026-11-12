# QuickOpen: Digital Account Onboarding BA Case Study

> **Status: In progress** (started November 2026). Sections are added as each phase is completed.

## Business problem

Sahyadri Bank (a fictional bank) lets customers open a zero-balance savings account fully in its mobile app. Many customers start the journey but do not finish it. As a Business Analyst, the goal is to find **where** and **why** customers drop off, and to define a requirement-backed solution that raises the completion rate.

**Business goal (SMART):** raise journey completion by at least 10 percentage points and halve average onboarding time within 6 months.

## Customer journey (7 stages)

Mobile OTP → Personal Details → PAN Verification → Aadhaar eKYC → Video KYC → Nominee & Preferences → First Deposit & Activation

## Data

Synthetic data created for practice: 20,150 application records (with deliberate data-quality issues) and 14,577 Video KYC call records. See [`01_data/DATA_DICTIONARY.md`](01_data/DATA_DICTIONARY.md).

## Tools

Excel (Power Query, pivots) · PostgreSQL · Power BI · Draw.io · JIRA · Figma

## Approach and progress

| Phase | Work | Folder | Status |
| --- | --- | --- | --- |
| 1. Data cleaning + funnel | Remove duplicates, fix spellings and blanks, 7-stage funnel, pivots | `02_excel` | ⏳ In progress |
| 2. SQL analysis | 6 business questions: drop-off by stage, VKYC wait vs failure, city tier | `03_sql` | ⬜ Planned |
| 3. Dashboard | 2-page Power BI dashboard: funnel overview and root cause | `04_powerbi` | ⬜ Planned |
| 4. BA documentation | Problem statement, AS-IS / TO-BE flows, 5 Whys, gap analysis, MoSCoW, BRD, user stories, RTM, UAT cases, ROI | `05_ba_docs` | ⬜ Planned |
| 5. Solution design | Wireframes and JIRA board | `06_design` | ⬜ Planned |

## Key findings

To be added after the analysis phases are complete.

## Author

Salil Gokhale · [LinkedIn](https://www.linkedin.com/in/salil-gokhale-analytics) · [GitHub](https://github.com/Salil360-cyber)
