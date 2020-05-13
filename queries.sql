-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName, c.CategoryName
FROM category AS c
JOIN product AS p
ON c.Id = p.categoryId

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, s.Companyname
FROM [order] AS o
JOIN Shipper AS s
ON o.shipVia = s.id
WHERE o.orderdate < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, o.Quantity
FROM orderDetail as o
JOIN product as p
ON o.ProductId = p.Id
WHERE o.OrderId = "10251"
ORDER BY p.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.id, c.CompanyName, e.LastName
FROM [order] AS o
JOIN customer AS c
ON o.CustomerId = c.Id
JOIN employee AS e
ON o.EmployeeId = e.Id