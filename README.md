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

### Phase 3 — SQL Analysis ⏳

Not started

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