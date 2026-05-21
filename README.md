# Banking Transaction Analysis using SQL

## Objective
The main objective of this project is to analyze customer banking transactions using SQL queries in MySQL.
This project helps in understanding how banking data can be managed, filtered, analyzed, and reported using different SQL concepts.

## Dataset Information
The project contains two tables:

### 1. Customers Table

Stores customer details such as:

- Customer ID
- Name
- Email
- City
- Account Type
- Account Balance

### 2. Transactions Table

Stores transaction details such as:

- Transaction ID
- Customer ID
- Transaction Amount
- Transaction Type
- Transaction Mode
- Transaction Date

## Tech Used
- MySQL
- SQL
- GitHub

## SQL Concepts Used

This project covers important SQL concepts such as:
```
CREATE DATABASE
CREATE TABLE
INSERT INTO
WHERE
ORDER BY
DISTINCT
LIMIT
LIKE Operator
GROUP BY
HAVING
JOINS
WINDOW FUNCTIONS
DENSE_RANK()
CTE (Common Table Expression)
```

## Steps Included
1. Created the database
2. Created customer and transaction tables
3. Inserted sample banking data
4. Performed data analysis using SQL queries
5. Applied filtering, sorting, grouping, and ranking
6. Generated customer transaction insights

## Analysis Done

The following analysis was performed:

- Customers with high account balance
- Latest transactions
- Different transaction types
- Top highest transactions
- Customer search using wildcard
- Total transaction amount per customer
- Customers with transactions above average
- Customer and transaction mapping using JOIN
- Running total using Window Function
- Customer ranking based on account balance

## Key Insights
>- Savings account customers generally maintained higher balances.
>- UPI, ATM, IMPS, and NEFT were commonly used transaction modes.
>- Some customers performed higher-value credit transactions.
>- Window functions helped track running transaction totals efficiently.
>- Ranking functions helped identify top customers based on balance.


## Conclusion

```
This project demonstrates how SQL can be used for real-world banking transaction analysis.
It helps in understanding database creation, data handling, and analytical query writing using MySQL.
```
