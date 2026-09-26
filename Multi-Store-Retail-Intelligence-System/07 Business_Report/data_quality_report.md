# Data Quality Report

## Dataset Inspection

Data types reviewed for all tables.

Observations:
- Date columns identified
- Numeric columns identified
- Text columns identified

Further checks pending:
- Missing values
- Duplicates
- Invalid values

## Primary Key Validation

All primary key columns were checked for duplicate values.

Result:
- user_id → No duplicates found
- product_id → No duplicates found
- order_id → No duplicates found
- order_item_id → No duplicates found
- review_id → No duplicates found
- event_id → No duplicates found

Conclusion:
All primary keys are unique and valid.

### Item Total Validation

Rule:
- item_total = quantity × item_price

Result:
- Passed

Observation:
- Initial comparison showed 1369 mismatches due to floating-point precision.

- After rounding values to two decimal places, all records matched successfully.

Conclusion:
- No data quality issues found.

### Negative Value Validation

Columns Checked:
- quantity
- item_price
- item_total
- product price

Result:
No negative values found.

Conclusion:
All numeric fields contain valid business values.

### Rating Validation

Columns Checked:
- reviews.rating
- products.rating

Result:
All ratings are within the valid range of 1 to 5.

Conclusion:
Rating data is valid and ready for analysis.

### Order Status Validation

Unique Statuses Found:
- processing
- shipped
- completed
- returned
- cancelled

Result:
All order statuses are valid business values.

Conclusion:
Order status data is clean and ready for analysis.