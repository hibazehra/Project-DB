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

INSERT INTO Loans (LoanID, UserID, BookID, LoanDate, ReturnDate)
VALUES
(1, 1, 1, '2024-03-01', '2024-03-15'),
(2, 2, 2, '2024-03-05', '2024-03-20');
   -- Agreegate Function--
SELECT count(LoanID) 
FROM Loans;
SELECT sum(UserID) 
FROM Loans;
SELECT avg(BookID) 
FROM Loans;
SELECT max(LoanDate) 
FROM Loans;
SELECT min(ReturnDate) 
FROM Loans;
