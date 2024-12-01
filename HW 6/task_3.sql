
-- Task 3.1: List the names of the waiters who have served the customer Tanya Singh.
SELECT w.name
FROM Waiters w
JOIN Bills b ON w.waiter_id = b.waiter_id
JOIN Customers c ON b.customer_id = c.customer_id
WHERE c.name = 'Tanya Singh';

-- Task 3.2: On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room?
SELECT m.date
FROM Management m
JOIN Headwaiters h ON m.headwaiter_id = h.headwaiter_id
JOIN Rooms r ON m.room_id = r.room_id
WHERE h.name = 'Charles' AND r.name = 'Green' AND m.date LIKE '2016-02%';

-- Task 3.3: List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
SELECT w.name, w.surname
FROM Waiters w
JOIN Teams t1 ON w.team_id = t1.team_id
WHERE t1.headwaiter_id = (SELECT t2.headwaiter_id
                          FROM Waiters z
                          JOIN Teams t2 ON z.team_id = t2.team_id
                          WHERE z.name = 'Zoe' AND z.surname = 'Ball');

-- Task 3.4: List customer name, amount spent, and waiter’s name for all bills. Order by amount spent, highest first.
SELECT c.name AS customer_name, b.amount, w.name AS waiter_name
FROM Bills b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Waiters w ON b.waiter_id = w.waiter_id
ORDER BY b.amount DESC;

-- Task 3.5: List waiters who serve tables in the same team that served bills 00014 and 00017.
SELECT DISTINCT w.name, w.surname
FROM Waiters w
JOIN Teams t ON w.team_id = t.team_id
WHERE t.team_id IN (SELECT t1.team_id
                    FROM Bills b
                    JOIN Waiters wt ON b.waiter_id = wt.waiter_id
                    JOIN Teams t1 ON wt.team_id = t1.team_id
                    WHERE b.bill_no IN ('00014', '00017'));

-- Task 3.6: List waiters in the team (including the headwaiter) that served Blue room on 160312.
SELECT w.name, w.surname
FROM Waiters w
JOIN Teams t ON w.team_id = t.team_id
WHERE t.room_id = (SELECT r.room_id
                   FROM Rooms r
                   WHERE r.name = 'Blue')
AND '160312' IN (SELECT b.date
                 FROM Bills b
                 WHERE b.room_id = t.room_id);
