CREATE DATABASE Library_management;
USE Library_management;

-- Table 4: AUTHORS

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(80),
    Bio TEXT,
    BirthDate DATE
);

INSERT INTO Authors (Name, Bio, BirthDate)
VALUES
('Harper Lee', 'American novelist widely known for To Kill a Mockingbird.', '1926-04-28'),
('George Orwell', 'English novelist, essayist, journalist and critic.', '1903-06-25');

-- List books and their authors:

SELECT Books.Title, Authors.Name AS Author 
FROM Books 
INNER JOIN Authors 
ON Books.Author = Authors.Name;

-- List authors and their book titles:

SELECT Authors.Name, Books.Title 
FROM Authors 
INNER JOIN Books 
ON Authors.Name = Books.Author;

-- List book titles and authors for a specific genre:

SELECT Books.Title, Authors.Name AS Author 
FROM Books 
INNER JOIN Authors 
ON Books.Author = Authors.Name 
WHERE Books.Genre = 'Fiction';


-- List author names and birthdates for authors who wrote books before 1950:

SELECT Authors.Name, Authors.BirthDate 
FROM Authors 
INNER JOIN Books 
ON Authors.Name = Books.Author 
WHERE Books.YearPublished < 1950;


-- List book titles and authors for books published between 1940 and 1960:

SELECT Books.Title, Authors.Name AS Author 
FROM Books 
INNER JOIN Authors 
ON Books.Author = Authors.Name 
WHERE Books.YearPublished BETWEEN 1940 AND 1960;