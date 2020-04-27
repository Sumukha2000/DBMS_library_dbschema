--SOLUTION TO QUERIES:
--Name: Sumukha MK,4I
--1
SELECT Author_name,title FROM book
JOIN Book_authors
ON Book.Book_id=Book_authors.Book_id
ORDER BY author_name,title;

--2
SELECT title,name FROM book
JOIN Publisher
ON Book.Publisher_name=Publisher.name;

--3
SELECT Book.Title,library_branch.branch_name,book_copies.no_of_copies
From Book,library_branch,book_copies
WHERE library_branch.Branch_id=Book_copies.Branch_id AND Book_copies.book_id = book.book_id
ORDER BY library_branch.branch_id,book.Publisher_name,Book.title;

--4
SELECT No_of_copies
FROM book_copies WHERE Branch_id IN (SELECT Branch_id FROM library_branch WHERE Branch_name = "Vijayanagar")
AND Book_id IN (SELECT Book_id FROM book WHERE Title = "Harry Potter");	

--5
SELECT lb.Branch_name,bc.No_of_copies
FROM book_copies as bc, library_branch as lb
WHERE bc.Book_id IN (SELECT Book_id FROM book WHERE Title = "War and Peace") AND bc.Branch_id=lb.Branch_id;	

--6
SELECT b.Title,bc.No_of_copies
FROM book AS b,book_copies as bc
WHERE bc.Branch_id IN (SELECT Branch_id 
		       FROM library_branch 
                       WHERE Branch_name ="Central") 
                       AND 
                       b.Book_id IN (SELECT Book_id
			             FROM book_authors
				     WHERE Author_name="J.K. Rowling")
				     AND
				     bc.Book_id = b.Book_id;
--7
SELECT lb.Branch_name,COUNT(bl.Book_id) AS "No_of_books"
FROM library_branch AS lb, book_loans AS bl
WHERE lb.Branch_id = bl.Branch_id
GROUP BY lb.Branch_name
ORDER BY 2 DESC,1 DESC;
--8
SELECT borr.Name, borr.Address, COUNT(bl.Book_id) AS No_of_books
FROM borrower AS borr, book_loans AS bl
WHERE borr.Card_no=bl.Card_no
GROUP BY borr.Name,borr.Address
HAVING COUNT(bl.Book_id) > 5
ORDER BY No_of_books;

--9
SELECT bor.Name,bor.Address,b.Title
FROM borrower AS bor,book_loans AS bl,book AS b
WHERE bor.Card_no=bl.Card_no
AND bl.Branch_id IN (SELECT Branch_id
		     FROM library_branch
		     WHERE Branch_name = "Vijayanagar")
AND bl.Due_date=CURRENT_DATE
AND b.Book_id=bl.Book_id;



--10
SELECT Name
FROM borrower
WHERE Card_no NOT IN (SELECT Card_no FROM book_loans);
		  
