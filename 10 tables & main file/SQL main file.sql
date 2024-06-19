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

-- Table 3: LOANS

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    BookID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Loans (UserID, BookID, LoanDate, ReturnDate)
VALUES
(1, 1, '2024-03-01', '2024-03-15'),
(2, 2, '2024-03-05', '2024-03-20');

-- Table 4: AUTHORS

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Bio TEXT,
    BirthDate DATE
);

INSERT INTO Authors (Name, Bio, BirthDate)
VALUES
('Harper Lee', 'American novelist widely known for To Kill a Mockingbird.', '1926-04-28'),
('George Orwell', 'English novelist, essayist, journalist and critic.', '1903-06-25');

-- Table 5: PUBLISHERS

CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

INSERT INTO Publishers (Name, Address, Phone, Email)
VALUES
('J.B. Lippincott & Co.', '227 S 6th St, Philadelphia, PA', '215-555-1234', 'info@lippincott.com'),
('Secker & Warburg', '20 Vauxhall Bridge Rd, London', '020-7881-2435', 'info@seckerwarburg.co.uk');

-- Table 6: CATEGORIES

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Description TEXT
);

INSERT INTO Categories (Name, Description)
VALUES
('Fiction', 'Literature created from the imagination.'),
('Dystopian', 'A genre of speculative fiction.');

-- Table 7: BOOK CATEGORIES

CREATE TABLE BookCategories (
    BookID INT,
    CategoryID INT,
    PRIMARY KEY (BookID, CategoryID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO BookCategories (BookID, CategoryID)
VALUES
(1, 1),
(2, 2);

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

-- Table 9:RESERVATIONS

CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    BookID INT,
    ReservationDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Reservations (UserID, BookID, ReservationDate, Status)
VALUES
(1, 2, '2024-03-10', 'Pending'),
(2, 1, '2024-03-12', 'Confirmed');

-- Table 10: REVIEWS

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    BookID INT,
    ReviewDate DATE,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    Comments TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Reviews (UserID, BookID, ReviewDate, Rating, Comments)
VALUES
(1, 1, '2024-03-20', 5, 'An excellent read.'),
(2, 2, '2024-03-22', 4, 'Thought-provoking and well-written.');