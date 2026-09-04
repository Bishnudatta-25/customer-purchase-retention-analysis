# Customer Purchase & Retention Analysis

## Project Overview

This project analyzes customer purchasing behavior for an e-commerce business
to understand customer retention, purchasing patterns, product performance,
and geographic performance.

The project follows a complete data analytics workflow:

Raw Data → Data Audit → Data Cleaning → SQL Analysis → Power BI Dashboard → Business Insights

## Business Problem

The e-commerce company wants to understand:

- Who are its customers?
- How many customers return to make additional purchases?
- Which products and categories generate the most revenue?
- Which customer segments are most valuable?
- Which geographic markets perform best?
- Which marketing channels attract customers?

## Dataset

The dataset contains e-commerce transaction-level data covering 2024–2025.

Key dimensions include:

- Customer
- Order
- Product
- Geography
- Payment Method
- Marketing Channel
- Customer Type

## Tools Used

- Microsoft Excel
- SQL
- Power BI
- GitHub

## Project Status

### Phase 1 — Data Audit ✅

Completed:

- Dataset structure validation
- Unique order/customer/product analysis
- Missing-value analysis
- Duplicate detection
- Invalid-value detection
- Categorical consistency checks

### Phase 2 — Data Cleaning ✅

The dataset was cleaned using Microsoft Excel.

Cleaning steps included:

- Removed 25 exact duplicate records
- Removed 8 records with invalid negative quantities
- Removed 6 records with discounts above 100%
- Standardized `Orissa` to `Odisha`
- Resolved missing City values using available customer information
- Replaced missing Discount values with 0%
- Replaced missing Payment Method values with `Unknown`
- Replaced missing Marketing Channel values with `Unknown`
- Validated revenue using an independent business-rule calculation

### Final Dataset

- Initial records: 16,878
- Records removed: 39
- Final records: 16,839
- Duplicate records remaining: 0
- Business-rule validation errors: 0

### Phase 3 — SQL Analysis ✅

Completed using MySQL.

The SQL analysis focused on revenue performance, product and category
performance, customer behavior, customer value, retention, and marketing
channel effectiveness.

#### Business KPI Analysis

Calculated:

- Total Revenue
- Total Orders
- Total Customers
- Total Quantity Sold
- Average Order Value

#### Monthly Revenue Analysis

Analyzed:

- Monthly Revenue
- Monthly Orders
- Monthly Quantity Sold
- Average Order Value
- Previous Month Revenue
- Month-over-Month Revenue Growth

Key findings:

- Highest revenue month: January 2024
- Lowest revenue month: August 2024
- Highest MoM growth: December 2025
- Largest MoM decline: February 2024

#### Category Analysis

Analyzed revenue and sales performance across product categories.

Key findings:

- Electronics was the highest-performing category.
- Electronics generated 70.18% of total revenue.
- Category-level Average Order Value and Revenue per Unit were also analyzed.

#### Product Analysis

Analyzed individual product performance using:

- Total Revenue
- Total Orders
- Revenue per Order
- Top 10 products by revenue
- Revenue contribution of the Top 10 products

Key finding:

- The Top 10 products generated 85.97% of total revenue.

#### Customer Analysis

Analyzed customer purchasing behavior using:

- One-time vs Returning Customers
- Customer revenue
- Customer purchase frequency
- Customer segments
- Customer lifetime
- Revenue-based customer quartiles

Key findings:

- Returning customers: 2,615 (67.90%)
- One-time customers: 1,236 (32.10%)
- High-value customers represented 24.98% of customers.
- High-value customers generated 69.50% of total revenue.

High-value customers averaged:

- 3.69 orders per customer
- ₹85,046.19 revenue per customer
- ₹29,751.45 revenue per order

#### Cohort Retention Analysis

Performed cohort analysis based on customers' first purchase month.

The analysis included:

- First Order Date
- Cohort Month
- Order Month
- Months Since First Purchase
- Active Customers
- Cohort Size
- Retention Percentage
- Cohort Retention Matrix

This analysis was used to understand how customer retention changes
over time after the first purchase.

#### Marketing Channel Analysis

Compared marketing channels using:

- Customer Count
- Order Count
- Total Revenue
- Average Order Value
- Revenue per Customer

Key finding:

- Organic was the strongest channel by total customers, orders,
  revenue, and revenue per customer.

#### SQL Techniques Used

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- Aggregate Functions
- `COUNT(DISTINCT)`
- `SUM()`
- `AVG()`
- `ROUND()`
- `CASE`
- Common Table Expressions (CTEs)
- Window Functions
- `LAG()`
- `NTILE()`
- Date Functions
- Cohort Analysis
- Revenue and customer segmentation

### Phase 4 — Power BI Dashboard ⏳

Not started

### Phase 5 — Business Insights ⏳

Not started

## Data Quality Findings

The initial audit identified:

- 25 exact duplicate rows
- Missing values in City
- Missing values in Discount
- Missing values in Payment Method
- Missing values in Marketing Channel
- Negative quantities
- Discount values above 100%
- State naming inconsistency between Odisha and Orissa

## Repository Structure

```text
data/
documentation/
excel/
sql/
powerbi/
screenshots/
insights/
