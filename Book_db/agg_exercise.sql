SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT AVG(released_year), author_fname, author_lname FROM books
GROUP BY 2,3;

SELECT CONCAT(author_fname, ' ', author_lname) FROM books
ORDER BY pages DESC LIMIT 1;
SELECT CONCAT(author_fname, ' ', author_lname) FROM books
WHERE pages = (SELECT MAX(pages) FROM books)

SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'avg pages'
FROM books 
GROUP BY released_year;













