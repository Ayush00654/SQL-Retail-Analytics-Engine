# SQL Retail Analytics Engine

### End-to-End Sales, Customer & Product Analytics Using SQL Server

This project demonstrates how raw retail sales data can be transformed into actionable business insights using SQL Server.

The project covers the complete analytics workflow including:

- Data Loading
- Data Exploration
- Sales Analysis
- Customer Analysis
- Product Analysis
- Time-Based Analysis
- Customer Segmentation
- Product Segmentation
- Business KPI Reporting

---

## Project Architecture

```text
Raw CSV Files
      ↓
Database Creation
      ↓
Data Loading
      ↓
Exploratory Data Analysis
      ↓
Business Analytics
      ↓
Customer & Product Reporting
```

---

## Dataset

The project uses three datasets:

| Table | Description |
|---------|-------------|
| fact_sales | Transaction-level sales data |
| dim_customers | Customer information |
| dim_product | Product information |

---

## Project Modules

### Database Setup

- Create Database
- Create Tables
- Load CSV Files

### Exploratory Analysis

- Database Exploration
- Dimension Exploration
- Date Exploration
- Measure Exploration

### Sales Analytics

- Magnitude Analysis
- Ranking Analysis
- Change Over Time Analysis
- Cumulative Analysis
- Performance Analysis
- Part-To-Whole Analysis

### Segmentation

- Customer Segmentation
- Product Cost Segmentation

### Reporting

- Customer Report View
- Product Report View

---

## Key Business Questions Solved

### Sales Analysis

- Which categories generate the highest revenue?
- Which products contribute most to sales?
- How do sales change over time?

### Customer Analysis

- Who are the top customers?
- Which customers qualify as VIP customers?
- What is the average customer spend?

### Product Analysis

- Which products are High Performers?
- Which products generate the most revenue?
- How many unique customers purchase each product?

---

## Customer Report

The Customer Report provides a consolidated customer-level view.

### KPIs

- Total Orders
- Total Sales
- Total Quantity Purchased
- Total Products Purchased
- Customer Lifespan
- Customer Recency
- Average Order Value
- Average Monthly Spend

### Customer Segments

| Segment | Criteria |
|----------|----------|
| VIP | Lifespan ≥ 12 Months and Sales ≥ 5000 |
| Regular | Lifespan ≥ 12 Months and Sales < 5000 |
| New | Lifespan < 12 Months |

---

## Product Report

The Product Report provides product-level performance insights.

### KPIs

- Total Orders
- Total Sales
- Total Quantity Sold
- Total Customers
- Product Lifespan
- Product Recency
- Average Selling Price
- Average Order Revenue
- Average Monthly Revenue

### Product Segments

| Segment | Criteria |
|----------|----------|
| High Performer | Revenue > 50,000 |
| Mid Range | Revenue ≥ 10,000 |
| Low Performer | Revenue < 10,000 |

---

## SQL Concepts Used

```sql
JOINS
GROUP BY
CTEs
CASE Statements
Views
Aggregate Functions
Window Functions
Ranking Functions
LAG()
PARTITION BY
Running Totals
Moving Averages
Date Functions
```

---

## Project Structure

```text
SQL-Retail-Analytics-Engine
│
├── datasets
│   ├── dim_customers.csv
│   ├── dim_product.csv
│   └── fact_sales.csv
│
├── scripts
│   ├── 01_Create_Database_and_Load_Data.sql
│   ├── 02_Database_Exploration.sql
│   ├── 03_Dimension_Exploration.sql
│   ├── 04_Date_Exploration.sql
│   ├── 05_Measure_Exploration.sql
│   ├── 06_Magnitude_Analysis.sql
│   ├── 07_Ranking_Analysis.sql
│   ├── 08_Changes_Over_Time_Analysis.sql
│   ├── 09_Cumulative_Analysis.sql
│   ├── 10_Performance_Analysis.sql
│   ├── 11_Part_To_Whole_Analysis.sql
│   ├── 12_Data_Segmentation.sql
│   ├── 13_Customer_Report.sql
│   └── 14_Product_Report.sql
│
└── README.md
```

---

## Skills Demonstrated

- SQL Server
- Data Analysis
- Data Cleaning
- Business Analytics
- Customer Analytics
- Product Analytics
- KPI Development
- Window Functions
- Reporting Views

---

## Future Improvements

- Power BI Dashboard
- Customer RFM Analysis
- Customer Lifetime Value Analysis
- Sales Forecasting

---

## Author

**Ayush**

Aspiring Data Analyst

### Tech Stack

- SQL Server
- SQL
- Data Analytics
- Business Intelligence

---

⭐ If you found this project useful, consider giving it a star.
