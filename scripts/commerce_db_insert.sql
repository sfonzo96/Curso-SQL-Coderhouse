-- INSERTS FOR TABLES THAT HAS NO FOREIGN KEY, SHOULD BE EXECUTED ISOLATED FROM THOS THAT HAVE IT

INSERT INTO clients (email, full_name, birth_date, telephone)
VALUES 
	('johndoe1@gmail.com','John Doe1','1990-01-01','3417123456'),
	('johndoe2@gmail.com','John Doe2','1991-02-02','3416789123'),
	('johndoe3@gmail.com','John Doe3','1992-03-03','3413456789'),
	('johndoe4@gmail.com','John Doe4','1993-04-04','3415123456'),
	('johndoe5@gmail.com','John Doe5','1994-05-05','3417789123'),
	('johndoe6@gmail.com','John Doe6','1995-06-06','3416123456'),
	('johndoe7@gmail.com','John Doe7','1996-07-07','3412123456');

INSERT INTO employees (email, full_name, birth_date)
VALUES 
	('janedoe1@gmail.com','Jane Doe1','1990-08-01'),
	('janedoe2@gmail.com','Jane Doe2','1991-09-02'),
	('janedoe3@gmail.com','Jane Doe3','1992-10-03');

INSERT INTO suppliers (name, email, telephone)
VALUES 
	('Lotus', 'lotus@gmail.com', '3417888766'),
	('Midway', 'Midway@gmail.com', '3417999766'),
	('Nasa', 'nasa@gmail.com', '3417333766'),
	('BA', 'ba@gmail.com', '3417222766');
    
INSERT INTO categories (name, description)
VALUES 
	('Remeras', 'Remeras general'),
	('Pantalones', 'Pantalones general'),
	('Camperas','Camperas general'),
	('Buzos','Buzos general');

INSERT INTO products (name, description, sku, price, stock, category_id, supplier_id)
VALUES 
	('Remera Lotus Manga Corta','Remeras de algodón de mangas cortas','REML001',7000,5,1,1),
	('Remera Lotus Manga Larga','Remeras de algodón de mangas largas','REML002',7500,5,1,1),
	('Jean Lotus Clásico','Jeans clásico de lotus','JEAN001',12000,10,2,1),
	('Jean Lotus Premium','Jeans clásico de lotus','JEAN001',15000,10,2,1),
	('Campera Puffer Midway', 'Campera puffer de Midway', 'CAMP001',20000,5,3,2),
	('Buzo Frisa Nasa', 'Buzo Frisa de Nasa', 'BUZ001',16000,6,4,3);

-- SUBTOTALS CALCULATED WITH TRIGGERS ON CREATION?

INSERT INTO sales (subtotal, products_quantity, employee_id, client_id)
VALUES 
	(14000,2,1, 1),
	(27000,2,1,2),
    (42000,3,2,1),
    (16000,1,3,3);

INSERT INTO sales_details (total, quantity, product_id, sale_id)
VALUES 

	(14000,2,1,1),
    
	(12000,1,3,2),
    (15000,1,4,2),
    
    (15000,1,4,3),
    (20000,1,5,3),
    (7000,1,1,3),
    
    (16000,1,6,4);
    
INSERT INTO purchases (subtotal, products_quantity, supplier_id)
VALUES 
	(72500,10,1),
	(100000,10,2);

INSERT INTO purchases_details (total, quantity, product_id, purchase_id)
VALUES 
	(35000,5,1,1),
	(37500,5,2,1),
	(100000,5,5,2);

    

