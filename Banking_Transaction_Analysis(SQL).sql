-- ////////// Banking Transaction Analysis ////////////

-- =====================================================
-- STEP 1: CREATE DATABASE
-- =====================================================
CREATE DATABASE bank_system;

USE bank_system;

-- =====================================================
-- STEP 2: CREATE TABLES
-- =====================================================

-- Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    account_type VARCHAR(20),
    account_balance DECIMAL(10,2)
);

-- Transactions Table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(10),
    transaction_mode VARCHAR(20),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =====================================================
-- STEP 3: INSERT 10 RECORDS INTO CUSTOMERS
-- =====================================================

INSERT INTO customers (name, email, city, account_type, account_balance) VALUES
('Alice', 'alice@gmail.com', 'Hyderabad', 'Savings', 2500.00),
('Bob', 'bob@gmail.com', 'Delhi', 'Current', 1200.00),
('Charlie', 'charlie@gmail.com', 'Mumbai', 'Savings', 3000.00),
('David', 'david@gmail.com', 'Chennai', 'Current', 1800.00),
('Anjali', 'anjali@gmail.com', 'Bangalore', 'Savings', 4000.00),
('Arjun', 'arjun@gmail.com', 'Hyderabad', 'Current', 2200.00),
('Meena', 'meena@gmail.com', 'Delhi', 'Savings', 900.00),
('Rahul', 'rahul@gmail.com', 'Mumbai', 'Current', 3500.00),
('Sneha', 'sneha@gmail.com', 'Chennai', 'Savings', 2700.00),
('Kiran', 'kiran@gmail.com', 'Bangalore', 'Current', 1500.00);

-- =====================================================
-- STEP 4: INSERT 10 RECORDS INTO TRANSACTIONS
-- =====================================================

INSERT INTO transactions (customer_id, amount, transaction_type, transaction_mode, transaction_date) VALUES
(1, 1000, 'credit', 'UPI', '2026-04-01 10:00:00'),
(1, -200, 'debit', 'ATM', '2026-04-02 12:00:00'),
(2, -500, 'debit', 'NEFT', '2026-04-03 09:30:00'),
(3, 1500, 'credit', 'IMPS', '2026-04-04 11:15:00'),
(4, -300, 'debit', 'UPI', '2026-04-05 14:20:00'),
(5, 2000, 'credit', 'ATM', '2026-04-06 16:45:00'),
(6, -700, 'debit', 'NEFT', '2026-04-07 18:00:00'),
(7, 800, 'credit', 'IMPS', '2026-04-08 08:10:00'),
(8, -400, 'debit', 'UPI', '2026-04-08 19:00:00'),
(9, 1200, 'credit', 'ATM', '2026-04-09 07:50:00');

-- =====================================================
-- STEP 5: SOLUTIONS
-- =====================================================

-- 1. WHERE
SELECT * 
FROM customers
WHERE account_balance > 1500;

-- -----------------------------------------------------

-- 2. ORDER BY
SELECT * 
FROM transactions
ORDER BY transaction_date DESC;

-- -----------------------------------------------------

-- 3. DISTINCT
SELECT DISTINCT transaction_type 
FROM transactions;

-- -----------------------------------------------------

-- 4. LIMIT (Top 5 highest transactions)
SELECT * 
FROM transactions
ORDER BY amount DESC
LIMIT 5;

-- -----------------------------------------------------

-- 5. WILDCARD (LIKE)
SELECT * 
FROM customers
WHERE name LIKE 'A%';

-- -----------------------------------------------------

-- 6. GROUP BY (Total transaction per customer)
SELECT customer_id, SUM(amount) AS total_amount
FROM transactions
GROUP BY customer_id;

-- -----------------------------------------------------

-- 7. HAVING
SELECT customer_id, SUM(amount) AS total_amount
FROM transactions
GROUP BY customer_id
HAVING SUM(amount) > 200;

-- -----------------------------------------------------

-- 8. JOIN
SELECT c.name, t.amount, t.transaction_type
FROM customers c
JOIN transactions t
ON c.customer_id = t.customer_id;

-- -----------------------------------------------------

-- 9. WINDOW FUNCTION (Running Total)
SELECT 
    customer_id,
    amount,
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY transaction_date) AS running_total
FROM transactions;

-- -----------------------------------------------------

-- 10. DENSE_RANK
SELECT 
    customer_id,
    name,
    account_balance,
    DENSE_RANK() OVER (ORDER BY account_balance DESC) AS rank_no
FROM customers;

-- -----------------------------------------------------

-- 11. CTE (Average comparison)

WITH avg_txn AS (
    SELECT customer_id, AVG(amount) AS avg_amount
    FROM transactions
    GROUP BY customer_id
),
overall_avg AS (
    SELECT AVG(amount) AS overall_avg_amount
    FROM transactions
)

SELECT a.customer_id, a.avg_amount
FROM avg_txn a, overall_avg o
WHERE a.avg_amount > o.overall_avg_amount;

-- =====================================================
-- END
-- =====================================================