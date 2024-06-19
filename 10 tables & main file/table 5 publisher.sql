-- Table 5: PUBLISHERS

CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

INSERT INTO Publishers (PublisherID, Name, Address, Phone, Email)
VALUES
(3, 'J.B. Lippincott & Co.', '227 S 6th St, Philadelphia, PA', '215-555-1234', 'info@lippincott.com'),
(4, 'Secker & Warburg', '20 Vauxhall Bridge Rd, London', '020-7881-2435', 'info@seckerwarburg.co.uk');
   -- String Function --
SELECT length (PublisherID)
FROM Publishers;
SELECT upper (Name)
From Publishers;
SELECT lower (Address)
From Publishers;
SELECT  trim(Phone)
From Publishers;
SELECT concat (Name, Email),Name, Email 
From Publishers;
