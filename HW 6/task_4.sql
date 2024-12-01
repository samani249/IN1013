
-- Task 4.1: List customers who spent more than 450 on a bill when ‘Charles’ was their Headwaiter.
SELECT DISTINCT c.name
FROM Customers c
JOIN Bills b ON c.customer_id = b.customer_id
JOIN Headwaiters h ON b.headwaiter_id = h.headwaiter_id
WHERE b.amount > 450 AND h.name = 'Charles';

-- Task 4.2: Name and surname of the Headwaiter for Nerida's complaint on 11th January 2016.
SELECT h.name, h.surname
FROM Headwaiters h
JOIN Teams t ON h.headwaiter_id = t.headwaiter_id
JOIN Bills b ON t.team_id = b.team_id
JOIN Customers c ON b.customer_id = c.customer_id
WHERE c.name = 'Nerida' AND b.date = '2016-01-11';

-- Task 4.3: Names of customers with the smallest bill.
SELECT c.name
FROM Customers c
JOIN Bills b ON c.customer_id = b.customer_id
WHERE b.amount = (SELECT MIN(amount) FROM Bills);

-- Task 4.4: Names of waiters who have not taken any bills.
SELECT w.name
FROM Waiters w
WHERE w.waiter_id NOT IN (SELECT b.waiter_id FROM Bills b);

-- Task 4.5: Customers with the largest bill, including details.
SELECT c.name AS customer_name, h.name AS headwaiter_name, h.surname AS headwaiter_surname, r.name AS room_name
FROM Customers c
JOIN Bills b ON c.customer_id = b.customer_id
JOIN Headwaiters h ON b.headwaiter_id = h.headwaiter_id
JOIN Rooms r ON b.room_id = r.room_id
WHERE b.amount = (SELECT MAX(amount) FROM Bills);
