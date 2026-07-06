USE northwind;
SHOW TABLES;

SET FOREIGN_KEY_CHECKS = 0;
SET UNIQUE_CHECKS = 0;
SET SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';
DROP DATABASE IF EXISTS northwind;

CREATE DATABASE northwind
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE northwind;
CREATE TABLE customers (
  id INT NOT NULL AUTO_INCREMENT,
  company VARCHAR(100),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email_address VARCHAR(100),
  phone VARCHAR(25),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE employees (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  job_title VARCHAR(50),
  email_address VARCHAR(100),
  phone VARCHAR(25),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE suppliers (
  id INT NOT NULL AUTO_INCREMENT,
  company VARCHAR(100),
  contact_name VARCHAR(100),
  email_address VARCHAR(100),
  phone VARCHAR(25),
  city VARCHAR(50),
  country VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE shippers (
  id INT NOT NULL AUTO_INCREMENT,
  company VARCHAR(100),
  phone VARCHAR(25),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100),
  supplier_id INT,
  list_price DECIMAL(10,2),
  discontinued BOOLEAN DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE orders_status (
  id TINYINT NOT NULL,
  status_name VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE orders_tax_status (
  id TINYINT NOT NULL,
  tax_status_name VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE inventory_transaction_types (
  id TINYINT NOT NULL,
  type_name VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE order_details_status (
  id INT NOT NULL,
  status_name VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE orders (
  id INT NOT NULL AUTO_INCREMENT,
  customer_id INT,
  employee_id INT,
  order_date DATETIME,
  shipped_date DATETIME,
  shipper_id INT,
  status_id TINYINT,
  tax_status_id TINYINT,
  shipping_fee DECIMAL(10,2) DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (shipper_id) REFERENCES shippers(id),
  FOREIGN KEY (status_id) REFERENCES orders_status(id),
  FOREIGN KEY (tax_status_id) REFERENCES orders_tax_status(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE order_details (
  id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  PRIMARY KEY (id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE inventory_transactions (
  id INT NOT NULL AUTO_INCREMENT,
  product_id INT,
  quantity INT,
  transaction_type TINYINT,
  transaction_date DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (transaction_type) REFERENCES inventory_transaction_types(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE privileges (
  id INT NOT NULL AUTO_INCREMENT,
  privilege_name VARCHAR(100),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE employee_privileges (
  employee_id INT,
  privilege_id INT,
  PRIMARY KEY (employee_id, privilege_id),
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (privilege_id) REFERENCES privileges(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE purchase_orders (
  id INT NOT NULL AUTO_INCREMENT,
  supplier_id INT,
  employee_id INT,
  status_id INT,
  order_date DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
  FOREIGN KEY (employee_id) REFERENCES employees(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE purchase_order_details (
  id INT NOT NULL AUTO_INCREMENT,
  purchase_order_id INT,
  product_id INT,
  quantity INT,
  unit_cost DECIMAL(10,2),
  PRIMARY KEY (id),
  FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
SET FOREIGN_KEY_CHECKS = 1;
SET UNIQUE_CHECKS = 1;