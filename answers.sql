-- Question 1 🗑️
-- Drop an index named IdxPhone from customers table
DROP INDEX IdxPhone ON customers;

-- Question 2 👤
-- Create a user named bob with the password 'S$cu3r3!' for localhost
CREATE USER 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';

-- Question 3 🔑
-- Grant INSERT privilege to bob on the salesDB database
GRANT INSERT ON salesDB.* TO 'bob'@'localhost';

-- Question 4 🔐
-- Change the password for bob to 'P$55!23'
ALTER USER 'bob'@'localhost' IDENTIFIED BY 'P$55!23';

-- Question 1 🧑‍💼
-- Get firstName, lastName, email, and officeCode from employees with INNER JOIN on offices
SELECT e.firstName, e.lastName, e.email, e.officeCode
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode;

-- Question 2 🛍️
-- Get productName, productVendor, and productLine using LEFT JOIN on productlines
SELECT p.productName, p.productVendor, p.productLine
FROM products p
LEFT JOIN productlines pl ON p.productLine = pl.productLine;

-- Question 3 📦
-- Retrieve orderDate, shippedDate, status, and customerNumber using RIGHT JOIN on customers
SELECT o.orderDate, o.shippedDate, o.status, o.customerNumber
FROM customers c
RIGHT JOIN orders o ON c.customerNumber = o.customerNumber
LIMIT 10;

-- Question 1 Achieving 1NF 🛠️
-- Transform ProductDetail to 1NF structure
CREATE TABLE ProductDetail_1NF (
  OrderID INT,
  CustomerName VARCHAR(100),
  Product VARCHAR(100)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Question 2 Achieving 2NF 🧩
-- Create separate Orders and OrderItems tables to remove partial dependencies
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
