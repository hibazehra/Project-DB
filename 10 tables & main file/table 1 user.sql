CREATE DATABASE Library_management;
USE Library_management;

-- Table 1:USER

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    MembershipDate DATE
);

INSERT INTO Users (FirstName, LastName, Email, Phone, Address, MembershipDate)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Maple Street', '2024-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue', '2024-02-20');

SELECT Title, Author 
FROM Books;

SELECT FirstName, LastName, MembershipDate 
FROM Users;

SELECT Title, Genre 
FROM Books 
WHERE Genre = 'Fiction';

SELECT U.FirstName, U.LastName, B.Title 
FROM Users U 
JOIN Loans L ON U.UserID = L.UserID 
JOIN Books B ON L.BookID = B.BookID;

SELECT B.Title, AVG(R.Rating) as AverageRating 
FROM Books B 
JOIN Reviews R ON B.BookID = R.BookID 
GROUP BY B.Title;