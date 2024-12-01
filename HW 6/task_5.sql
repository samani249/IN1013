
-- Task 5.1: Waiters who have taken 2 or more bills on a single date.
SELECT w.name, w.surname, b.date, COUNT(b.bill_no) AS bills_count
FROM Waiters w
JOIN Bills b ON w.waiter_id = b.waiter_id
GROUP BY w.name, w.surname, b.date
HAVING COUNT(b.bill_no) >= 2;

-- Task 5.2: Rooms with tables that can serve more than 6 people and count of such tables.
SELECT r.name AS room_name, COUNT(t.table_id) AS table_count
FROM Rooms r
JOIN Tables t ON r.room_id = t.room_id
WHERE t.capacity > 6
GROUP BY r.name;

-- Task 5.3: Total bill amount by room.
SELECT r.name AS room_name, SUM(b.amount) AS total_bills
FROM Rooms r
JOIN Bills b ON r.room_id = b.room_id
GROUP BY r.name;

-- Task 5.4: Total bill amount taken by headwaiters' teams, ordered by largest first.
SELECT h.name, h.surname, SUM(b.amount) AS total_bills
FROM Headwaiters h
JOIN Teams t ON h.headwaiter_id = t.headwaiter_id
JOIN Waiters w ON t.team_id = w.team_id
JOIN Bills b ON w.waiter_id = b.waiter_id
GROUP BY h.name, h.surname
ORDER BY total_bills DESC;

-- Task 5.5: Customers who spent more than £400 on average.
SELECT c.name
FROM Customers c
JOIN Bills b ON c.customer_id = b.customer_id
GROUP BY c.name
HAVING AVG(b.amount) > 400;

-- Task 5.6: Waiters who have taken 3 or more bills on a single date.
SELECT w.name, w.surname, COUNT(b.bill_no) AS bills_count
FROM Waiters w
JOIN Bills b ON w.waiter_id = b.waiter_id
GROUP BY w.name, w.surname, b.date
HAVING COUNT(b.bill_no) >= 3;
