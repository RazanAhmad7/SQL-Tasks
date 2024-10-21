CREATE TABLE Users (
    UserID INT PRIMARY KEY ,
    UserName NVARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
);
CREATE TABLE Messages (
    MessageID INT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    MessageContent TEXT NOT NULL,
    SentTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY ,
    ServiceName VARCHAR(50) NOT NULL,
    ServiceDescription TEXT
);
CREATE TABLE UserServices (
    UserID INT,
    ServiceID INT,
    PurchaseDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserID, ServiceID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY ,
    UserID INT,
    ServiceID INT,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

INSERT INTO Users (UserID, UserName, Email, Password) 
VALUES 
(100, 'Razan', 'razanalsamri@gmail.com', '1234'),
(101, 'Ali', 'ali@gmail.com', 'abcd'),
(102, 'Ahmad', 'ahmad@gmail.com', 'pass123'),
(103, 'Sarah', 'sara@gmail.com', 'sara456'),
(104, 'Layla', 'layla@gmail.com', 'layla789'),
(105, 'Mohammad', 'mohammad@gmail.com', 'mohammad123');

INSERT INTO Messages (MessageID, SenderID, ReceiverID, MessageContent)
VALUES
(1, 100, 101, 'Hello Ali'),
(2, 101, 100, 'Hi Razan'),
(3, 102, 103, 'How are you, Sara?'),
(4, 103, 102, 'I am fine, thanks Ahmad'),
(5, 104, 105, 'I love your work, Mohammad!'),
(6, 105, 104, 'Thank you, Layla, that is kind of you!');

INSERT INTO Services (ServiceID, ServiceName, ServiceDescription)
VALUES
(1, 'Instant Messaging', 'Send unlimited messages'),
(2, 'Video Calls', 'Enable video calling'),
(3, 'Custom Emojis', 'Access custom emojis'),
(4, 'Cloud Storage', 'Store history in the cloud'),
(5, 'Premium Support', 'Get premium customer support'),
(6, 'File Sharing', 'Share files with other users');


INSERT INTO UserServices (UserID, ServiceID)
VALUES
(100, 1), (100, 2), (101, 1), (101, 3), (102, 4), (103, 5);

INSERT INTO Payments (PaymentID, UserID, ServiceID, Amount)
VALUES
(1, 100, 1, 9.99), 
(2, 100, 2, 14.99), 
(3, 101, 1, 9.99), 
(4, 101, 3, 4.99),
(5, 102, 4, 19.99), 
(6, 103, 5, 29.99);



update Users Set UserName = 'RazanAhmad' where USERID = 1;
UPDATE Users
SET UserEmail = 'sara.newemail@gmail.com'
WHERE UserID = 103;

-- Messages table updates
UPDATE Messages
SET MessageContent = 'How are you, Khalid?'
WHERE MessageID = 1;

UPDATE Messages
SET MessageContent = 'I am doing well, how about you?'
WHERE MessageID = 2;

-- Services table updates
UPDATE Services
SET ServiceName = 'Super Messaging'
WHERE ServiceID = 1;

UPDATE Services
SET ServiceDescription = 'Secure cloud storage'
WHERE ServiceID = 4;

-- UserServices table updates
UPDATE UserServices
SET PurchaseDate = '2024-10-20 10:00:00'
WHERE UserID = 100 AND ServiceID = 2;

UPDATE UserServices
SET PurchaseDate = '2024-10-21 12:30:00'
WHERE UserID = 101 AND ServiceID = 3;

-- Payments table updates
UPDATE Payments
SET PaymentAmount = 11.99
WHERE PaymentID = 1;

UPDATE Payments
SET PaymentDate = '2024-10-18 09:00:00'
WHERE PaymentID = 4;


-- 4. Deleting 2 records from each table:

-- Users table deletes
DELETE FROM Users WHERE UserID = 105;
DELETE FROM Users WHERE UserID = 104;

-- Messages table deletes
DELETE FROM Messages WHERE MessageID = 5;
DELETE FROM Messages WHERE MessageID = 6;

-- Services table deletes
DELETE FROM Services WHERE ServiceID = 5;
DELETE FROM Services WHERE ServiceID = 6;

-- UserServices table deletes
DELETE FROM UserServices WHERE UserID = 103 AND ServiceID = 5;
DELETE FROM UserServices WHERE UserID = 102 AND ServiceID = 4;

-- Payments table deletes
DELETE FROM Payments WHERE PaymentID = 6;
DELETE FROM Payments WHERE PaymentID = 5;

-- 5. Renaming Tables in SQL Server:

-- Rename Messages table to UserMessages
EXEC sp_rename 'Messages', 'UserMessages';

-- Rename Payments table to ServicePayments
EXEC sp_rename 'Payments', 'ServicePayments';


-- 6. Renaming Columns and Changing Data Types in SQL Server:

-- Rename the Email column in the Users table to UserEmail
EXEC sp_rename 'Users.Email', 'UserEmail', 'COLUMN';

-- Change the data type of UserEmail to VARCHAR(150)
ALTER TABLE Users
ALTER COLUMN UserEmail VARCHAR(150);


-- Rename the Amount column in the Payments table to PaymentAmount
EXEC sp_rename 'ServicePayments.Amount', 'PaymentAmount', 'COLUMN';

-- Change the data type of PaymentAmount to DECIMAL(12, 2)
ALTER TABLE ServicePayments
ALTER COLUMN PaymentAmount DECIMAL(12, 2);
