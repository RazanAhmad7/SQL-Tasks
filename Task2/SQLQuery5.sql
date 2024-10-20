CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Birthdate DATE NOT NULL,
    PhoneNumber NVARCHAR(15) NOT NULL,
    NationalID NVARCHAR(50) NOT NULL,
    Nationality NVARCHAR(50) NOT NULL,
    MaritalStatus NVARCHAR(20) NOT NULL,
    PersonalPhoto NVARCHAR(255),
    EntryDate DATE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DeptID)
);

CREATE TABLE Managers (
    ManagerID INT Primary key,
    DeptID int ,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    Description NVARCHAR(500) NOT NULL,
    ImportanceLevel NVARCHAR(50) NOT NULL,
    EmployeeID int,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Feedbacks (
    FeedbackID INT PRIMARY KEY,
    EmployeeID INT,
    FeedbackDate DATETIME NOT NULL DEFAULT GETDATE(), 
    FeedbackText NVARCHAR(MAX) NOT NULL,
    ContactEmail NVARCHAR(255) NOT NULL
);
