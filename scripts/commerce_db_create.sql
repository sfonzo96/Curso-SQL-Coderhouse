-- Creación del esquema commerce
CREATE SCHEMA IF NOT EXISTS commerce;

-- Uso del esquema de commerce
USE commerce;

-- Creación de la tabla employees
CREATE TABLE IF NOT EXISTS employees (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100),
email VARCHAR(100) UNIQUE,
birth_date DATE
);

-- Creación de tabla categories
CREATE TABLE IF NOT EXISTS categories (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
description VARCHAR(250)
);

-- Creación de tabla suppliers
CREATE TABLE IF NOT EXISTS suppliers (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100) UNIQUE,
telephone VARCHAR(25)
);

-- Creación de tabla products
CREATE TABLE IF NOT EXISTS products (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
description VARCHAR(250),
price DECIMAL,
sku VARCHAR(15),
stock INT UNSIGNED,
category_id BIGINT UNSIGNED,
supplier_id BIGINT UNSIGNED,
FOREIGN KEY (category_id) REFERENCES categories(id),
FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Creación de tabla clients

CREATE TABLE IF NOT EXISTS clients (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(100) UNIQUE,
full_name VARCHAR(100),
birth_date DATE,
telephone VARCHAR(25),
balance DECIMAL DEFAULT 0.00
);

-- Creación de tabla purchases
CREATE TABLE IF NOT EXISTS purchases (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
subtotal DECIMAL,
products_quantity INT UNSIGNED,
created_at DATE DEFAULT (CURRENT_DATE),
supplier_id BIGINT UNSIGNED,
FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Creación de tabla purchases_details
CREATE TABLE IF NOT EXISTS purchases_details (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
total DECIMAL,
quantity INT UNSIGNED,
product_id BIGINT UNSIGNED,
purchase_id BIGINT UNSIGNED,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (purchase_id) REFERENCES purchases(id)
);

-- Creación de tabla sales
CREATE TABLE IF NOT EXISTS sales (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
subtotal DECIMAL,
products_quantity INT UNSIGNED,
created_at DATE DEFAULT (CURRENT_DATE),
employee_id BIGINT UNSIGNED,
client_id BIGINT UNSIGNED,
FOREIGN KEY (employee_id) REFERENCES employees(id),
FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- Creación de tabla sales_details
CREATE TABLE IF NOT EXISTS sales_details (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
total DECIMAL,
quantity INT UNSIGNED,
product_id BIGINT UNSIGNED,
sale_id BIGINT UNSIGNED,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (sale_id) REFERENCES sales(id)
);