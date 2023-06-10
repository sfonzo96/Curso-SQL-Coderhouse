SELECT * 
FROM products AS p 
JOIN
categories AS c
ON p.category_id = c.id;
