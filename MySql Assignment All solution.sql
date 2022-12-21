CREATE TABLE SalesPeople( 
  Snum INT PRIMARY KEY, 
  Sname VARCHAR(255) UNIQUE NOT NULL, 
  City VARCHAR(255) NOT NULL,
  Comm DECIMAL(5,2) NOT NULL
); 

CREATE TABLE Customers(
  Cnum INT PRIMARY KEY,
  Cname VARCHAR(255) NOT NULL, 
  City VARCHAR(255) NOT NULL, 
  Snum INT,
  FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum) 
);

CREATE TABLE Orders(
  Onum INT PRIMARY KEY,
  Amt DECIMAL(7,2) NOT NULL,
  Odate DATE NOT NULL, 
  Cnum INT, 
  Snum INT,
  FOREIGN KEY (Cnum) REFERENCES Customers(Cnum), 
  FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum) 
);

INSERT INTO SalesPeople VALUES (1001, 'Peel.', 'London', 0.12);
INSERT INTO SalesPeople VALUES (1002, 'Serres', 'Sanjose', 0.13);
INSERT INTO SalesPeople VALUES (1004, 'Motika', 'London', 0.11);
INSERT INTO SalesPeople VALUES (1007, 'Rifkin', 'Barcelona', 0.15);
INSERT INTO SalesPeople VALUES (1003, 'Axelrod', 'Newyork', 0.10);

INSERT INTO Customers VALUES (2001, 'Hoffman', 'London', 1001);
INSERT INTO Customers VALUES (2002, 'Giovanni', 'Rome', 1003);
INSERT INTO Customers VALUES (2003, 'Liu', 'Sanjose', 1002);
INSERT INTO Customers VALUES (2004, 'Grass', 'Berlin', 1002);
INSERT INTO Customers VALUES (2006, 'Clemens', 'London', 1001);
INSERT INTO Customers VALUES (2008, 'Cisneros', 'Sanjose', 1007);
INSERT INTO Customers VALUES (2007, 'Pereira', 'Rome', 1004);

INSERT INTO Orders VALUES (3001, 18.69, '1990-10-03', 2008, 1007);
INSERT INTO Orders VALUES (3003, 767.19, '1990-10-03', 2001, 1001);
INSERT INTO Orders VALUES (3002, 1900.10, '1990-10-03', 2007, 1004);
INSERT INTO Orders VALUES (3005, 5160.45, '1990-10-03', 2003, 1002);
INSERT INTO Orders VALUES (3006, 1098.16, '1990-10-03', 2008, 1007);
INSERT INTO Orders VALUES (3009, 1713.23, '1990-10-04', 2002, 1003);
INSERT INTO Orders VALUES (3007, 75.75, '1990-10-04', 2004, 1002);
INSERT INTO Orders VALUES (3008, 4273.00, '1990-10-05', 2006, 1001);
INSERT INTO Orders VALUES (3010, 1309.95, '1990-10-06', 2004, 1002);
INSERT INTO Orders VALUES (3011, 9891.88, '1990-10-06', 2006, 1001);

#Count the number of Salesperson whose name begin with ‘a’/’A’.
SELECT COUNT(*)
FROM SalesPeople
WHERE SName LIKE 'A%';

#Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT Sname FROM SalesPeople WHERE Snum IN (SELECT Snum FROM Orders WHERE Amt > 2000);

#Count the number of Salesperson belonging to Newyork.
SELECT COUNT(*) FROM SalesPeople WHERE City = 'Newyork';

#Display the number of Salespeople belonging to London and belonging to Paris.
SELECT COUNT(*) FROM SalesPeople WHERE City = 'London' OR City = 'Paris';

#Display the number of orders taken by each Salesperson and their date of orders.
SELECT Snum, COUNT(*) AS NumOfOrders, Odate FROM Orders GROUP BY Snum, Odate;