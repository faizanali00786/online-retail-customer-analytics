\# Customer Segmentation, Retention \& Revenue Analysis



\## Project Overview



This project analyzes customer purchasing behavior, retention trends, revenue drivers, and customer segmentation using SQL and Power BI.



The objective was to uncover:



\* high-value customer groups

\* customer retention patterns

\* repeat purchase behavior

\* revenue concentration

\* business growth drivers

\* customer engagement trends



The project combines advanced SQL analytics with interactive Power BI dashboards to generate business-focused insights and recommendations.



\---



\# Business Objectives



The analysis was designed to answer key business questions:



\* Who are the highest-value customers?

\* How much revenue comes from repeat customers?

\* Are customers being retained over time?

\* Which customer segments contribute most to revenue?

\* Is revenue growth driven by customer acquisition or purchasing behavior?

\* How concentrated is revenue among top customers?

\* Which customer groups are at risk of churn?



\---



\# Dataset Information



\### Dataset Used



Online Retail Dataset



\### Dataset Features



The dataset contains:



\* customer transactions

\* invoice-level purchases

\* product quantities

\* unit prices

\* transaction dates

\* customer identifiers



\### Data Cleaning Performed



The following cleaning logic was applied:



```sql

WHERE customer\_id IS NOT NULL

AND quantity > 0

```



This removed:



\* null customer records

\* cancelled/returned transactions

\* invalid quantities



\---



\# Tools \& Technologies Used



| Tool        | Purpose                   |

| ----------- | ------------------------- |

| SQL (MySQL) | Data cleaning \& analytics |

| Power BI    | Dashboard development     |

| Excel/CSV   | Dataset source            |

| GitHub      | Project hosting           |



\---



\# SQL Concepts Used



This project demonstrates practical usage of:



\* Common Table Expressions (CTEs)

\* Window Functions

\* NTILE()

\* LAG()

\* Cohort Analysis

\* RFM Segmentation

\* Customer Segmentation

\* Revenue Decomposition

\* Aggregations

\* CASE WHEN Logic

\* Date Functions

\* Pareto Analysis



\---



\# Project Structure



```text

customer-segmentation-retention-analysis

│

├── SQL Queries

│   ├── 01\_data\_overview.sql

│   ├── 02\_data\_cleaning.sql

│   ├── 03\_basic\_kpis.sql

│   ├── 04\_cohort\_retention\_analysis.sql

│   ├── 05\_repeat\_vs\_onetime\_customers.sql

│   ├── 06\_high\_value\_customer\_analysis.sql

│   ├── 07\_active\_vs\_inactive\_customers.sql

│   ├── 08\_rfm\_customer\_segmentation.sql

│   ├── 09\_revenue\_decomposition\_analysis.sql

│   └── 10\_pareto\_analysis.sql

│

├── dashboard screenshots

│   ├── dashboard1.png

│   ├── dashboard2.png

│   └── dashboard3.png

│

└── README.md

```



\---



\# Dashboard Overview



\## 1. Revenue Driver \& Business Performance Analysis



This dashboard focuses on:



\* revenue trends

\* customer growth

\* average order value

\* purchase frequency

\* month-over-month business performance



\### Key KPIs



\* Total Revenue

\* Total Customers

\* Total Orders

\* Average Order Value (AOV)

\* Purchase Frequency



\---



\## 2. Customer Retention \& Cohort Analysis



This dashboard analyzes:



\* customer retention behavior

\* repeat purchase contribution

\* cohort retention decay

\* active vs inactive customer revenue



\### Key Insights



\* Repeat customers contributed more than 93% of total revenue.

\* Active customers generated the majority of overall business revenue.

\* Cohort retention declined progressively over time, indicating customer churn risk.



\---



\## 3. Customer Segmentation \& Value Analysis



This dashboard focuses on:



\* RFM segmentation

\* high-value customer identification

\* revenue concentration

\* customer purchase behavior



\### Key Insights



\* Top 10% customers contributed over 61% of total revenue.

\* High-value customers generated significantly higher revenue per customer.

\* Most customers belonged to lower-value behavioral segments.



\---



\# Key Business Insights



\## 1. Revenue Concentration



A small percentage of customers generated the majority of total revenue, indicating strong revenue concentration among premium customer segments.



\---



\## 2. Repeat Customers Drive Business Growth



Repeat customers contributed over 93% of total revenue, highlighting the importance of customer retention strategies.



\---



\## 3. Customer Retention Weakens Over Time



Cohort retention rates declined steadily across acquisition cohorts, suggesting increasing customer churn over longer periods.



\---



\## 4. High-Value Customers Are Critical



Top-value customers demonstrated significantly higher spending and purchasing frequency compared to the average customer base.



\---



\## 5. Revenue Growth Was Influenced by Customer Expansion



Monthly revenue growth aligned closely with increases in customer acquisition and purchasing activity.



\---



\# Business Recommendations



\## 1. Strengthen Customer Retention Programs



Since repeat customers contribute the majority of revenue, the business should:



\* implement loyalty programs

\* provide personalized offers

\* improve post-purchase engagement



\---



\## 2. Focus on High-Value Customers



The company should prioritize:



\* VIP customer targeting

\* premium membership programs

\* exclusive campaigns for top-spending customers



\---



\## 3. Reduce Customer Churn



The business can reduce churn by:



\* identifying inactive customers early

\* launching re-engagement campaigns

\* offering retention discounts



\---



\## 4. Improve Mid-Value Customer Conversion



Mid-value customers represent a growth opportunity and can be converted into high-value segments through:



\* targeted cross-selling

\* upselling strategies

\* personalized product recommendations



\---



\## 5. Monitor Cohort Retention Continuously



Tracking cohort retention monthly can help:



\* identify retention decline early

\* measure marketing effectiveness

\* improve long-term customer engagement



\---



\# Dashboard Screenshots



\## Revenue Driver Dashboard



!\[Revenue Dashboard](dashboard%20screenshots/dashboard1.png)



\---



\## Customer Retention Dashboard



!\[Retention Dashboard](dashboard%20screenshots/dashboard2.png)



\---



\## Customer Segmentation Dashboard



!\[Segmentation Dashboard](dashboard%20screenshots/dashboard3.png)



\---



\# Conclusion



This project demonstrates end-to-end analytical workflow including:



\* SQL-based data transformation

\* customer analytics

\* cohort analysis

\* RFM segmentation

\* business KPI tracking

\* interactive dashboard development



The analysis highlights how customer behavior, retention, and segmentation directly influence overall business performance and revenue growth.



\---



\# Author



\### MD Faizan Ali



Aspiring Business Analyst / Data Analyst



Skills:



\* SQL

\* Power BI

\* Excel

\* Business Analytics

\* Data Visualization

\* Customer Analytics



