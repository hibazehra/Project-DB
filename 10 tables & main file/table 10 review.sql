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

SELECT * FROM Reviews
WHERE BookID = 1;

SELECT BookID, AVG(Rating) AS AverageRating
FROM Reviews
WHERE BookID = 1
GROUP BY BookID;

SELECT * FROM Reviews
WHERE BookID = 1
ORDER BY ReviewDate DESC
LIMIT 1;

SELECT * FROM Reviews
WHERE UserID = 1;

SELECT BookID, COUNT(*) AS ReviewCount, AVG(Rating) AS AverageRating
FROM Reviews
GROUP BY BookID;

