-- Create Database
CREATE DATABASE IF NOT EXISTS OnlineRetailStore;
USE OnlineRetailStore;

-- Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Region VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT fk_orderdetails_order
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_orderdetails_product
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Customers
INSERT INTO Customers (CustomerID, Name, Region) VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'South');

-- Insert Products
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Tablet', 'Electronics', 800.00),
(4, 'Headphones', 'Accessories', 150.00),
(5, 'Earbuds', 'Accessories', 150.00),
(6, 'Mouse', 'Accessories', 100.00);

-- Insert Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2023-01-15'),
(2, 2, '2023-02-20');

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 1);


SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

-- ROW_NUMBER() → assigns a unique sequential number to each row (no ties), even when values are equal.
-- RANK() → assigns the same rank to tied values but skips the next rank.
-- DENSE_RANK() → assigns the same rank to tied values without skipping any rank numbers.


SELECT ProductName, Category, Price, rn
FROM (
    SELECT
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS rn
    FROM Products
) ranked
WHERE rn <= 3;


SELECT ProductName, Category, Price, rnk
FROM (
    SELECT
        ProductName,
        Category,
        Price,
        RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS rnk
    FROM Products
) ranked
WHERE rnk <= 3;


SELECT ProductName, Category, Price, drnk
FROM (
    SELECT
        ProductName,
        Category,
        Price,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS drnk
    FROM Products
) ranked
WHERE drnk <= 3;

