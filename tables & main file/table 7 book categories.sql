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
  -- Sub Queries --
   -- INNER QUERY --
SELECT BookID 
  FROM BookCategories
  WHERE BookID IN (select BookID from BookCategories);
   -- COMPARISON QUERY --
SELECT avg (CategoryID) FROM BookCategories;
SELECT BookCategories
FROM CategoryID > (select avg (CategoryID) from BookCategories);
