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
SELECT
    r.ReservationID,
    r.BookID,
    r.ReservationDate,
    r.Status,
    u.UserID,
    u.FirstName,
    u.LastName
FROM
    (SELECT * FROM Reservations) r
    LEFT JOIN (SELECT * FROM Users) u ON r.UserID = u.UserID;
    
    SELECT
    r.ReservationID,
    r.UserID,
    r.ReservationDate,
    r.Status,
    b.BookID,
    b.Title
FROM
    (SELECT * FROM Reservations) r
    LEFT JOIN (SELECT * FROM Books) b ON r.BookID = b.BookID;
    
    SELECT
    b.BookID,
    b.Title,
    (SELECT r.ReservationID FROM Reservations r WHERE r.BookID = b.BookID ORDER BY r.ReservationDate DESC LIMIT 1) AS ReservationID,
    (SELECT r.ReservationDate FROM Reservations r WHERE r.BookID = b.BookID ORDER BY r.ReservationDate DESC LIMIT 1) AS ReservationDate,
    (SELECT r.Status FROM Reservations r WHERE r.BookID = b.BookID ORDER BY r.ReservationDate DESC LIMIT 1) AS Status
FROM
    Books b;
    
    SELECT
    u.UserID,
    u.FirstName,
    u.LastName,
    (SELECT r.ReservationID FROM Reservations r WHERE r.UserID = u.UserID ORDER BY r.ReservationDate DESC LIMIT 1) AS ReservationID,
    (SELECT r.ReservationDate FROM Reservations r WHERE r.UserID = u.UserID ORDER BY r.ReservationDate DESC LIMIT 1) AS ReservationDate,
    (SELECT r.Status FROM Reservations r WHERE r.UserID = u.UserID ORDER BY r.ReservationDate DESC LIMIT 1) AS Status
FROM
    Users u;
    
    SELECT
    u.UserID,
    u.FirstName,
    u.LastName,
    COALESCE((SELECT COUNT(r.ReservationID) FROM Reservations r WHERE r.UserID = u.UserID AND r.ReservationDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)), 0) AS ReservationCount
FROM
    Users u;
    
    SELECT
    r.ReservationID,
    r.ReservationDate,
    r.Status,
    (SELECT u.UserID FROM Users u WHERE u.UserID = r.UserID) AS UserID,
    (SELECT u.FirstName FROM Users u WHERE u.UserID = r.UserID) AS FirstName,
    (SELECT u.LastName FROM Users u WHERE u.UserID = r.UserID) AS LastName,
    (SELECT b.BookID FROM Books b WHERE b.BookID = r.BookID) AS BookID,
    (SELECT b.Title FROM Books b WHERE b.BookID = r.BookID) AS Title
FROM
    Reservations r;


