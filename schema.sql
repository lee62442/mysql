CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Insert users (from command line):

INSERT INTO users (email) VALUES('Katie34@yahoo.com'), ('Tunde@gmail.com');

-- Check that users are added:

SELECT * FROM users;

-- To SELECT all users from database:
# -- node js

# var q = 'SELECT * FROM users ';
# connection.query(q, function (error, results, fields) {
#   if (error) throw error;
#   console.log(results);
# });

# -- To count the number of users in the database:
# -- node js

# var q = 'SELECT COUNT(*) AS total FROM users ';
# connection.query(q, function (error, results, fields) {
#   if (error) throw error;
#   console.log(results[0].total);
# });

INSERT INTO users(email, created_at) VALUES
('dusty@gmail.com', '2020-05-05T22:22:40.599Z');

-- ================EXERCISE========================

-- Find earliest date A user joined

SELECT DATE_FORMAT(created_at, '%b %D %Y') AS earliest_date FROM users
ORDER BY created_at
LIMIT 1;

/* Colt solution */
SELECT DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date FROM users;

-- Find the email of the earliest user


SELECT email, created_at FROM users
WHERE created_at = (
    SELECT created_at FROM users
    ORDER BY created_at
    LIMIT 1
);

/* Colt solution */
SELECT * FROM users
WHERE created_at = (
    SELECT MIN(created_at) AS earliest_date 
    FROM users
);

-- users according to the month they joined

SELECT MONTHNAME(created_at) AS month, COUNT(*) AS count
FROM users
GROUP BY month;

SELECT DATE_FORMAT(created_at, '%M') AS month, COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

-- COUNT NUMBER OF USERS WITH YAHOO EMAILS

SELECT COUNT(*) AS yahoo_users FROM users
WHERE email LIKE '%@yahoo.com';

-- Calculate total number of users for each email host

SELECT 
    CASE 
        WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;






