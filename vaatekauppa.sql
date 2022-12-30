drop database if exists vaatekauppa;

create database vaatekauppa;

use vaatekauppa;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    zip_code CHAR(5) NOT NULL,
    phone VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name VARCHAR(200) NOT NULL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description VARCHAR(200) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INTEGER NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, email, password, address, city, zip_code, phone)
VALUES
    (1, 'Asiakas Yksi', 'asiakasyksi@gmail.com', 'password1', 'Katu 1', 'Oulu', '90100', '045-2422-132'),
    (2, 'Matti Pekka', 'mattipekka@gmail.com', 'password2', 'Tie 4', 'Tampere', '90550', '045-1231-534'),
    (3, 'Kolmas Asiakas', 'kolmasasiakas@gmail.com', 'password3', 'Kuja 7', 'Helsinki', '90530', '000-1111-222');

INSERT INTO products (product_id, product_name, description, price, stock, category_id)
VALUES
    (1, 'Jacket', 'Brown winter jacket', 80.00, 5, 1),
    (2, 'Jeans', 'Blue jeans', 50.00, 22, 1),
    (3, 'Boots', 'Brown low-top sneakers', 75.00, 12, 2);

INSERT INTO categories (category_id, category_name)
VALUES
    (1, 'Clothing'),
    (2, 'Shoes');

INSERT INTO orders (order_id, customer_id, order_date)
VALUES
    (1, 1, '2022-03-03'),
    (2, 2, '2022-02-02'),
    (3, 3, '2022-01-01');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
    (1, 1, 1, 14),
    (2, 1, 2, 13),
    (3, 2, 3, 12),
    (4, 3, 1, 10);