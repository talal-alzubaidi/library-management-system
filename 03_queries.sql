-- ============================================================
-- Project: Library Management System
-- File: 03_queries.sql
-- Database: PostgreSQL
--
-- Description:
-- SQL queries for retrieving and analyzing library data.
--
-- SQL Concepts:
-- SELECT, WHERE, ORDER BY, DISTINCT
-- INNER JOIN, LEFT JOIN, RIGHT JOIN
-- SEMI JOIN (EXISTS), ANTI JOIN (NOT EXISTS)
-- GROUP BY, HAVING
-- Aggregate Functions (COUNT, SUM, AVG, MAX)
-- Subqueries and Correlated Subqueries
-- CASE, COALESCE
-- UNION, INTERSECT
-- ============================================================








-- Available books published after 2000 with their categories

SELECT b.title , b.author , b.published_year , c.category_name
 FROM books AS b 
    INNER JOIN categories AS c USING(category_id)

WHERE b.status = 'Available' AND b.Published_year > 2000
ORDER BY b.published_year DESC;




-- Total books in each category, including empty categories

SELECT c.category_name , COUNT(b.book_id) AS total_books
 FROM categories AS c
    LEFT JOIN books AS b USING(category_id)
  
GROUP BY c.category_name
ORDER BY COUNT(b.book_id) DESC;




-- Members with active loans and their borrowed books

SELECT m.member_name , b.title , l.loan_date , l.return_date
 FROM members AS m
    INNER JOIN loans AS l USING(member_id)
	INNER JOIN books AS b USING(book_id)

WHERE l.return_date IS NULL ;




-- Books borrowed by both Regular and Premium members

SELECT  b.title 
 FROM books AS b 
 
WHERE EXISTS(

   SELECT 1
   FROM loans AS l
   INNER JOIN members AS m USING(member_id)
   WHERE b.book_id = l.book_id 
   AND membership_type ='Regular'
)

AND EXISTS(

   SELECT 1
   FROM loans AS l
   INNER JOIN members AS m USING(member_id)
   WHERE l.book_id = b.book_id
   AND membership_type = 'Premium'
   
)

ORDER BY b.title ASC;




-- Members with more than one loan

SELECT m.member_name , m.member_id , COUNT(l.loan_id) AS total_loans
 FROM members AS m
    INNER JOIN loans AS l USING(member_id)

GROUP BY m.member_name , member_id
HAVING COUNT(l.loan_id) > 1
ORDER BY total_loans DESC;




-- Books that have never been borrowed(NOT EXISTS)

SELECT b.title
  FROM books AS b

WHERE NOT EXISTS(
SELECT 1
FROM loans AS l
WHERE b.book_id = l.book_id 
);




-- Books that have never been borrowed(NOT IN)

SELECT b.title
 FROM books AS b

WHERE book_id NOT IN(
SELECT book_id
  FROM loans 
);




-- Total fines for members who have borrowed books

SELECT m.member_name , COALESCE(SUM(f.fine_amount) , 0) AS total_fines
  FROM members AS m
  INNER JOIN loans AS l USING(member_id)
  LEFT JOIN fines AS f USING(loan_id)

GROUP BY m.member_name
ORDER BY total_fines DESC;




-- Members with unpaid fines

SELECT m.member_id , m.member_name , SUM(f.fine_amount) AS total_unpaid_fines 
  FROM members AS m
      INNER JOIN loans AS l 
	  ON m.member_id = l.member_id
	  INNER JOIN fines AS f
	  ON f.loan_id = l.loan_id
	  LEFT JOIN payments AS p 
	  ON p.loan_id = l.loan_id

WHERE p.payment_id IS NULL
GROUP BY m.member_id , m.member_name
ORDER BY total_unpaid_fines  DESC;




--Most borrowed books

SELECT b.title , COUNT(l.loan_id) AS total_loans
 FROM books AS b
    INNER JOIN loans AS l USING(book_id)

GROUP BY b.title , b.book_id
HAVING  COUNT(l.loan_id) >= 2
ORDER BY total_loans DESC;




-- Loan status for borrowed book

SELECT m.member_name , b.title , l.loan_date ,

   CASE
      WHEN l.return_date IS NULL THEN 'Active'
	  ELSE 'Returned'
	  END AS loan_status

	  
  FROM members AS m
  INNER JOIN loans AS l
  ON l.member_id = m.member_id
  INNER JOIN books AS b
  ON b.book_id = l.book_id

ORDER BY l.loan_date DESC;




--Members who borrowed books from mutiple categories

SELECT m.member_name , COUNT(DISTINCT b.category_id) AS total_categories
  FROM members AS m
  INNER JOIN loans AS l USING(member_id)
  INNER JOIN books AS b USING(book_id)

GROUP BY m.member_id
HAVING COUNT(DISTINCT b.category_id) >= 2
ORDER BY total_categories DESC;




-- Members who borrowed more books than the average

SELECT m.member_name , COUNT(l.loan_id) AS total_loans
  FROM members AS m
  INNER JOIN loans AS l USING(member_id)

GROUP BY m.member_id
HAVING COUNT(l.loan_id) > (

   SELECT AVG(total_loans)
    FROM ( 
	
	SELECT COUNT(l.loan_id) AS total_loans
	FROM members AS m
	LEFT JOIN loans AS l USING(member_id)

GROUP BY m.member_id
	

   ) AS member_loans
)

ORDER BY total_loans DESC;




-- Members who borrowed books but never made a payment

SELECT DISTINCT m.member_name
 FROM members AS m
 INNER JOIN loans AS l USING(member_id)

WHERE NOT EXISTS (

      SELECT 1
	  FROM loans AS l
	  INNER JOIN payments AS p USING(loan_id)
	  WHERE m.member_id = l.member_id
	  
);




-- Loans counts by membership type

SELECT m.membership_type , COUNT(loan_id) AS total_loans
 FROM members AS m
    LEFT JOIN loans AS l USING(member_id)

GROUP BY m.membership_type
ORDER BY total_loans DESC;




-- Members who borrowed more books than a specific member

SELECT m.member_name , COUNT(l.loan_id) AS total_loans
  FROM members AS m
     INNER JOIN loans AS l USING(member_id)


GROUP BY m.member_name
HAVING COUNT(l.loan_id) > (

   SELECT COUNT(l.loan_id)
     FROM members AS m
     INNER JOIN loans AS l USING(member_id)

WHERE member_id = 1


)

ORDER BY total_loans DESC;




-- Members who borrowed books from both Technology and Science categories

SELECT m.member_id, m.member_name
  FROM members AS m
    INNER JOIN loans AS l USING(member_id)
    INNER JOIN books AS b USING(book_id)
    INNER JOIN categories AS c USING(category_id)

WHERE c.category_name = 'Technology'

INTERSECT

SELECT m.member_id, m.member_name
  FROM members AS m
    INNER JOIN loans AS l USING(member_id)
    INNER JOIN books AS b USING(book_id)
    INNER JOIN categories AS c USING(category_id)

WHERE c.category_name = 'Science'

ORDER BY member_name ASC;




-- Members with active loans or recorded fine payments


SELECT m.member_id, m.member_name
  FROM members AS m
    INNER JOIN loans AS l USING(member_id)

WHERE l.return_date IS NULL

UNION

SELECT m.member_id, m.member_name
  FROM members AS m
    INNER JOIN loans AS l USING(member_id)
    INNER JOIN payments AS p USING(loan_id)

ORDER BY member_name ASC;



-- Members who have borrowed at least one book (SEMI JOIN)

SELECT m.member_id, m.member_name
  FROM members AS m


WHERE EXISTS (
    
	SELECT 1
    FROM loans AS l
    WHERE l.member_id = m.member_id
)


ORDER BY m.member_name ASC;











  


