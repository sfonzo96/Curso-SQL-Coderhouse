-- Creación del esquema commerce
CREATE SCHEMA commerce;

-- Uso del esquema de commerce
USE commerce;

-- Creación de la tabla employees
CREATE TABLE employees (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
dni VARCHAR(20),
full_name VARCHAR(100),
email VARCHAR(100),
birth_date DATE
);

-- Creación de tabla categories
CREATE TABLE categories (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
description VARCHAR(250)
);

-- Creación de tabla suppliers
CREATE TABLE suppliers (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
telephone VARCHAR(25)
);

-- Creación de tabla products
CREATE TABLE products (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
description VARCHAR(250),
sku VARCHAR(15),
stock INT UNSIGNED,
category_id BIGINT UNSIGNED,
supplier_id BIGINT UNSIGNED,
FOREIGN KEY (category_id) REFERENCES categories(id),
FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Creación de tabla clients

CREATE TABLE clients (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(50),
password VARCHAR(100),
full_name VARCHAR(100),
phone VARCHAR(20),
balance DECIMAL
);

-- Creación de tabla purchases
CREATE TABLE purchases (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
created_at DATE,
subtotal DECIMAL,
supplier_id BIGINT UNSIGNED,
FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Creación de tabla purchases_details
CREATE TABLE purchases_details (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
total DECIMAL,
quantity INT UNSIGNED,
product_id BIGINT UNSIGNED,
purchase_id BIGINT UNSIGNED,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (purchase_id) REFERENCES purchases(id)
);

-- Creación de tabla sales
CREATE TABLE sales (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
subtotal BIGINT UNSIGNED,
created_at DATE,
employee_id BIGINT UNSIGNED,
client_id BIGINT UNSIGNED,
FOREIGN KEY (employee_id) REFERENCES employees(id),
FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- Creación de tabla sales_details
CREATE TABLE sales_details (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
total DECIMAL,
quantity INT UNSIGNED,
product_id BIGINT UNSIGNED,
sale_id BIGINT UNSIGNED,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (sale_id) REFERENCES sales(id)
);