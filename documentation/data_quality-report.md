# Data Quality Report

## Dataset Overview

| Metric | Value |
|---|---:|
| Total Records | 16,878 |
| Total Columns | 20 |
| Unique Orders | 10,000 |
| Unique Customers | 3,851 |
| Unique Products | 23 |
| Start Date | 2024-01-01 |
| End Date | 2025-12-31 |

## Data Quality Issues

| Issue | Column | Count | Severity |
|---|---|---:|---|
| Exact duplicate rows | All columns | 25 | High |
| Missing values | City | 20 | Medium |
| Missing values | Discount | 20 | Medium |
| Missing values | Payment Method | 20 | Medium |
| Missing values | Marketing Channel | 20 | Medium |
| Negative quantity | Quantity | 8 | High |
| Invalid discount | Discount | 6 | High |
| Invalid revenue | Revenue | 16 | High |
| Inconsistent state naming | State | TBD | Medium |

## Observations

The dataset contains several quality issues that must be addressed
before performing business analysis.

Repeated Order IDs were not treated as duplicate orders because a
single order may contain multiple product line items.

## Next Step

The next phase is data cleaning and validation.