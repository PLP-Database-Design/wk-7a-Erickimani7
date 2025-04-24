-- Using MySQL 8.0+ with JSON_TABLE or string splitting
SELECT 
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product
FROM 
    ProductDetail
JOIN 
    (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) n
ON 
    CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n.n - 1;
-- Contains OrderID and CustomerName
SELECT DISTINCT
    OrderID,
    CustomerName
FROM
    OrderDetails;
-- Contains OrderID, Product, and Quantity
SELECT
    OrderID,
    Product,
    Quantity
FROM
    OrderDetails;
