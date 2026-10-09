# Brazilian E-Commerce Data Analytics — dbt & PostgreSQL

## Project Overview

This project transforms real Brazilian e-commerce data into reliable analytical models using **dbt Core** and **PostgreSQL**.

The project uses the Brazilian E-Commerce Public Dataset by Olist to analyze sales performance, customer behavior, and state-level business performance.

## Tech Stack

* **PostgreSQL** — Data storage and SQL processing
* **dbt Core** — Data transformation, modeling, and testing
* **SQL** — Data cleaning, joins, aggregations, and analytics
* **Git & GitHub** — Version control and project documentation
* **Power BI** — Planned data visualization stage

## Data Pipeline

```text
Olist Dataset
     ↓
PostgreSQL Raw Layer
     ↓
dbt Sources
     ↓
Staging Models
     ↓
Intermediate Models
     ↓
Fact & Dimension Models
     ↓
Sales Marts
     ↓
Power BI Dashboards
```

## Current Analytical Models

* `stg_orders` — Cleans and prepares order data.
* `stg_customers` — Standardizes customer information.
* `stg_order_items` — Prepares order item and financial data.
* `int_orders` — Adds order delivery duration.
* `fct_orders` — Provides order-level analytical data.
* `fct_order_items` — Provides order item-level data.
* `dim_customers` — Organizes customer attributes.
* `mart_sales` — Aggregates item sales, freight, and total amounts by order.
* `mart_customer_sales` — Summarizes sales and orders by customer.
* `mart_state_sales` — Aggregates sales performance by Brazilian state.

## Data Quality

dbt tests are used to validate:

* Unique and non-null identifiers
* Required customer and order fields
* Non-null financial measures
* Uniqueness of order-level and state-level records

## Current Dataset Summary

| Metric                         |            Value |
| ------------------------------ | ---------------: |
| Orders with item records       |           98,666 |
| Total product sales            | R$ 13,591,643.70 |
| Total freight                  |  R$ 2,251,909.54 |
| Total amount including freight | R$ 15,843,553.24 |
| Brazilian states represented   |               27 |

*These figures describe the current transformed dataset and may change as the models are updated.*

## Running the Project

1. Install dbt Core and the PostgreSQL adapter.
2. Configure your PostgreSQL connection in your local dbt profile.
3. From the project directory, run:

```bash
dbt debug
dbt run
dbt test
```

**Security note:** Keep database passwords and other credentials in your local dbt profile. Never commit credentials to GitHub.

## Project Status

The core transformation models and data quality tests have been implemented. The next planned stage is connecting the analytical marts to Power BI for interactive reporting.

## Dataset

Brazilian E-Commerce Public Dataset by Olist.

Learn more about dbt: https://docs.getdbt.com/
