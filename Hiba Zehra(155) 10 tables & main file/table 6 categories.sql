-- Table 6: CATEGORIES

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Description TEXT
);

INSERT INTO Categories (CategoryID, Name, Description)
VALUES
(3, 'Fiction', 'Literature created from the imagination.'),
(4, 'Dystopian', 'A genre of speculative fiction.');
  -- DISTINCT FUNCTION --
  SELECT DISTINCT CategoryID FROM Categories
  -- WHERE CLAUSE --
  SELECT Name FROM Categories
  WHERE CategoryID = 4
  -- LIMIT CLAUSE --
  SELECT * FROM Categories
  LIMIT 1 
  
 