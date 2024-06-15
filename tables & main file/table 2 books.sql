CREATE DATABASE Library_management;
USE Library_management;

-- Table 2: BOOKS

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Author VARCHAR(255),
    ISBN VARCHAR(20),
    Publisher VARCHAR(255),
    YearPublished INT,
    Genre VARCHAR(100)
);

INSERT INTO Books (Title, Author, ISBN, Publisher, YearPublished, Genre)
VALUES
('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 'J.B. Lippincott & Co.', 1960, 'Fiction'),
('1984', 'George Orwell', '9780451524935', 'Secker & Warburg', 1949, 'Dystopian');

-- Update book title:

UPDATE Books SET Title = 'To Kill a Mockingbird (50th Anniversary Edition)' WHERE BookID = 1;


-- Update author name:

UPDATE Books SET Author = 'Harper Lee ( deceased )' WHERE BookID = 1;


-- Update publisher information:

UPDATE Books SET Publisher = 'Penguin Books' WHERE BookID = 2;


-- Update year published:

UPDATE Books SET YearPublished = 1950 WHERE BookID = 2;


-- Update genre:

UPDATE Books SET Genre = 'Classic Fiction' WHERE BookID = 1;