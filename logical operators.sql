SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;
 
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;
 
SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;
 
SELECT CAST('2017-05-02' AS DATETIME);
 
show databases;
 
use new_testing_db;
 
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
 
SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
    \
    
# IN AND NOT IN
show databases();
use book_shop;
 
SELECT 
    title, 
    author_lname 
FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';
 
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);
 
SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
 
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
 
 # USE MODULO
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0;
 
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;

# case statements
SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
SELECT title,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 

# EXERCISE 
SELECT 10!=10;
SELECT 15>14 && 99-5<=94;
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;

SELECT * FROM books WHERE released_year < 1980;
SELECT * FROM books WHERE author_lname IN ('EGGERS', 'CHABON');

SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Lahiri' && released_year > 2000;

SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;

/* not best solution */
SELECT title, author_lname FROM books 
WHERE author_lname LIKE 'C%' OR author_lname LIKE 's%';

/* USE SUBSTRING */
SELECT title, author_lname FROM books
WHERE SUBSTRING(author_lname,1,1) IN ('c', 's')



SELECT title, author_lname,
    CASE 
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title IN ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
    ELSE 'Novel'
    END AS TYPE
FROM books;




SELECT title, author_lname,
    CASE 
    WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book')
    ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books
GROUP BY author_lname, author_fname 



SELECT title, author_lname, COUNT(*) AS COUNT 
FROM books
GROUP BY author_lname, author_fname

SELECT title, author_lname, CONCAT(COUNT(*), ' book(s)') AS COUNT 
FROM books
GROUP BY author_lname, author_fname

# SELECT title, author_lname, CONCAT(COUNT(*),
#                                   CASE 
#                                    WHEN COUNT(*) = 1, THEN ' book'
#                                    ELSE ' books'
#                                   END
#                                   ) AS COUNT
# FROM books
# GROUP BY author_lname, author_fname

# SELECT title, author_lname, (
#     SELECT B.COUNT(*) FROM books B
#     GROUP BY B.author_lname, B.author_fname)
#         CASE
#         WHEN B.COUNT(*) = 1 THEN CONCAT(B.COUNT(*), ' book')
#         ELSE CONCAT(B.COUNT(*), ' books')
#     END AS COUNT
# FROM books


