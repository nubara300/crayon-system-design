CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Type VARCHAR(50),
    RowVersion ROWVERSION,
    CreatedBy VARCHAR(255),
    ModifiedBy VARCHAR(255),
    DateCreated DATETIME,
    DateModified DATETIME
);

CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountName VARCHAR(255),
    Email VARCHAR(255),
    RowVersion ROWVERSION,
    CreatedBy VARCHAR(255),
    ModifiedBy VARCHAR(255),
    DateCreated DATETIME,
    DateModified DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Service (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(255),
    ExpirationDate DATE,
    State VARCHAR(20), -- Active, Inactive, etc.
    RowVersion ROWVERSION,
    CreatedBy INT,
    ModifiedBy INT,
    DateCreated DATETIME,
    DateModified DATETIME
);

CREATE TABLE Licence (
    LicenceID INT PRIMARY KEY,
    LicenceKey VARCHAR(255),
    ServiceID INT, -- One-to-One: Licence has one Service
    RowVersion ROWVERSION,
    CreatedBy VARCHAR(255),
    ModifiedBy VARCHAR(255),
    DateCreated DATETIME,
    DateModified DATETIME,
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID) -- One-to-One
);

CREATE TABLE AccountSubscription (
    AccountSubscriptionID INT PRIMARY KEY,
    AccountID INT,
    ServiceID INT,
    SubscriptionDate DATE,
    RowVersion ROWVERSION,
    CreatedBy INT,
    ModifiedBy INT,
    DateCreated DATETIME,
    DateModified DATETIME,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
);

CREATE TABLE Order_ (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    AccountID INT,
    OrderDate DATE,
    RowVersion ROWVERSION,
    CreatedBy INT,
    ModifiedBy INT,
    DateCreated DATETIME,
    DateModified DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10, 2),
    InvoiceDate DATE,
    RowVersion ROWVERSION,
    CreatedBy INT,
    ModifiedBy INT,
    DateCreated DATETIME,
    DateModified DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Order_(OrderID)
);
