
-- SQL Solutions for Homework Questions

-- Question 1: Create a view with the name samsBills
CREATE VIEW samsBills AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM bills
WHERE waiter_name = 'Sam Pitt';

-- Question 2: Query using samsBills view for bills over £400
SELECT *
FROM samsBills
WHERE bill_total > 400;

-- Question 3: Create a view with the name roomTotals
CREATE VIEW roomTotals AS
SELECT room_name, SUM(bill_total) AS total_sum
FROM bills
GROUP BY room_name;

-- Question 4: Create a view with the name teamTotals
CREATE VIEW teamTotals AS
SELECT CONCAT(first_name, ' ', surname) AS headwaiter_name, SUM(bill_total) AS total_sum
FROM bills
GROUP BY CONCAT(first_name, ' ', surname);
