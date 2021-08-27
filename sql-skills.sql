-- ARTIST TABLE
-- 1
INSERT INTO artist (name)
VALUES ('Aurora'), ('Florence & the Machines'), ('Ava Max');

-- 2
SELECT * FROM artist
ORDER BY name ASC
LIMIT 5;

-- EMPLOYEE TABLE
-- 1
SELECT first_name, last_name FROM employee
WHERE city = 'Calgary';

-- 2
SELECT * 
FROM employee
WHERE reports_to IN (
	SELECT employee_id
	FROM employee
	WHERE first_name = 'Nancy');

-- 3
SELECT COUNT(*) 
FROM employee
WHERE city = 'Lethbridge';

-- INVOICE TABLE
-- 1
SELECT COUNT(*) 
FROM invoice
WHERE billing_country = 'USA';

-- 2
SELECT MAX(total) FROM invoice

-- 3
SELECT MIN(total) FROM invoice

-- 4
SELECT * FROM invoice
WHERE total > 5;

-- 5
SELECT COUNT(*) FROM invoice
WHERE total < 5;

-- 6
SELECT SUM(total) FROM invoice;

-- JOIN QUERIES
-- 1
SELECT * 
FROM invoice i
JOIN invoice_line il
ON i.invoice_id = il.invoice_id
WHERE unit_price > .99;

-- 2
SELECT c.first_name AS firstname, c.last_name AS lastname, i.invoice_date AS date, i.total AS total
FROM customer c
JOIN invoice i
ON c.customer_id = i.customer_id;

-- 3
SELECT c.first_name AS firstname, c.last_name AS lastname, e.first_name AS employeefirstname, e.last_name AS employeelastname
FROM customer c
JOIN employee e
ON c.support_rep_id = e.employee_id;

-- 4
SELECT al.title AS title, ar.name AS name
FROM artist ar
JOIN album al
ON ar.artist_id = al.artist_id;

-- EXTRA CREDIT
-- 1
SELECT * FROM artist
ORDER BY name DESC
LIMIT 10;

-- 2
SELECT * FROM artist
WHERE name LIKE 'Black%'

-- 3
SELECT * FROM artist
WHERE name LIKE '%Black%'

-- EMPLOYEE TABLE
-- 1
SELECT * FROM employee
ORDER BY birth_date DESC
LIMIT 1;

-- 2
SELECT * FROM employee
ORDER BY birth_date ASC
LIMIT 1;

-- INVOICE TABLE
-- 1
SELECT * FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ')

-- 2
SELECT AVG(total) FROM invoice

-- MORE JOIN QUERIES
-- 1
SELECT p.name AS name, t.track_id AS track_id
FROM playlist p
JOIN playlist_track t
ON p.playlist_id = t.playlist_id
WHERE name = 'Music'
ORDER BY track_id ASC;

-- 2
SELECT p.name AS playlist, t.name AS name, p.playlist_id AS playlistid
FROM playlist p
JOIN playlist_track pt
ON p.playlist_id = pt.playlist_id
JOIN track t
ON pt.track_id = t.track_id
WHERE p.playlist_id = 5
ORDER BY playlist ASC;

-- 3
SELECT p.name AS playlist, t.name AS name
FROM playlist p
JOIN playlist_track pt
ON p.playlist_id = pt.playlist_id
JOIN track t
ON pt.track_id = t.track_id
ORDER BY playlist ASC;

-- 4
SELECT a.title AS title, t.name AS trackname, g.name AS genre
FROM album a
JOIN track t
ON a.album_id = t.album_id
JOIN genre g
ON t.genre_id = g.genre_id
WHERE g.name IN ('Alternative', 'Rock')
ORDER BY genre ASC;
