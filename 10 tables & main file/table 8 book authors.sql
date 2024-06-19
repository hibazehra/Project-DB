CREATE DATABASE Library_management;
USE Library_management;
-- Table 8: BOOK AUTHORS

CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO BookAuthors (BookID, AuthorID)
VALUES
(1, 1),
(2, 2);

SELECT Books.BookID, Books.Title, Authors.AuthorID, Authors.Name
FROM BookAuthors
RIGHT JOIN Books ON BookAuthors.BookID = Books.BookID
RIGHT JOIN Authors ON BookAuthors.AuthorID = Authors.AuthorID;

SELECT Authors.AuthorID, Authors.Name, Books.BookID, Books.Title
FROM BookAuthors
RIGHT JOIN Authors ON BookAuthors.AuthorID = Authors.AuthorID
RIGHT JOIN Books ON BookAuthors.BookID = Books.BookID;

SELECT Books.*
FROM Books
RIGHT JOIN BookAuthors ON Books.BookID = BookAuthors.BookID
WHERE BookAuthors.BookID IS NULL;

SELECT Authors.*
FROM Authors
RIGHT JOIN BookAuthors ON Authors.AuthorID = BookAuthors.AuthorID
WHERE BookAuthors.AuthorID IS NULL;

SELECT Books.BookID, Books.Title, Authors.AuthorID, Authors.Name
FROM BookAuthors
RIGHT JOIN Books ON BookAuthors.BookID = Books.BookID
RIGHT JOIN Authors ON BookAuthors.AuthorID = Authors.AuthorID
WHERE BookAuthors.AuthorID = (
    SELECT MAX(AuthorID)
    FROM BookAuthors AS BA
    WHERE BA.BookID = Books.BookID);
    
    SELECT Authors.AuthorID, Authors.Name, Books.BookID, Books.Title
FROM BookAuthors
RIGHT JOIN Authors ON BookAuthors.AuthorID = Authors.AuthorID
RIGHT JOIN Books ON BookAuthors.BookID = Books.BookID
WHERE BookAuthors.BookID = (
    SELECT MAX(BookID)
    FROM BookAuthors AS BA
    WHERE BA.AuthorID = Authors.AuthorID
);






