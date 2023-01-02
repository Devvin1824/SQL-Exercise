/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name
 FROM products 
 INNER JOIN categories ON products.CategoryID = categories.CategoryID
 WHERE categories.Name = 'computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating
 FROM products
 INNER JOIN reviews ON products.productID = reviews.productID
 WHERE reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT FirstName, employees.LastName, SUM(sales.Quantity) AS total
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
GROUP BY sales.employeeID
ORDER BY SUM(sales.Quantity) DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS 'department', categories.Name AS 'category'
FROM categories
INNER JOIN departments ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.quantity) as 'Total Units Sold', SUM(s.Quantity * s.PricePerUnit) as 'Total Price'
FROM products as p
INNER JOIN sales as s ON s.ProductID = p.ProductID
WHERE p.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.reviewer, r.rating, r.Comment 
FROM products as p
INNER JOIN reviews as r ON r.productID = p.productID
WHERE p.productID = 857 AND r.rating = 1; 


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.employeeID, e.firstname, e.lastname, p.Name, SUM(s.quantity) as "Total Sold"
FROM sales as s
INNER JOIN employees as e ON e.employeeID = s.EmployeeID
INNER JOIN products as p ON p.productID = s.productID
GROUP BY e.employeeID, p.ProductID
ORDER BY e.firstname;