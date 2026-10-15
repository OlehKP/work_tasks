USE
warehouse_management;

CREATE TABLE customers
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(100) NOT NULL,
    lastname  VARCHAR(100) NOT NULL,
    email     VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO customers (firstname, lastname, email)
VALUES
    ('Oleh', 'Kovalchuk', 'oleh@gmail.com'),
    ('Anna', 'Schmidt', 'anna@gmail.com'),
    ('Peter', 'Müller', 'peter@gmail.com'),
    ('Max', 'Mustermann', 'max@gmail.com'),
    ('Laura', 'Weber', 'laura@gmail.com'),
    ('Thomas', 'Fischer', 'thomas@gmail.com'),
    ('Julia', 'Schneider', 'julia@gmail.com'),
    ('Lukas', 'Becker', 'lukas@gmail.com'),
    ('Sophie', 'Hoffmann', 'sophie@gmail.com'),
    ('Paul', 'Wagner', 'paul@gmail.com'),
    ('Leon', 'Schneider', 'leon@gmail.com');

CREATE TABLE orders
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    customers_id INT NOT NULL,
    FOREIGN KEY (customers_id) REFERENCES customers (id),
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO orders (customers_id)
VALUES
    (11),
    (11),
    (12),
    (13),
    (13),
    (14),
    (15),
    (15),
    (16),
    (18),
    (18),
    (20),
    (21);

CREATE TABLE order_items
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    orders_id      INT            NOT NULL,
    FOREIGN KEY (orders_id) REFERENCES orders (id),
    articles_id    INT            NOT NULL,
    FOREIGN KEY (articles_id) REFERENCES articles (id),
    numberOfItems  INT            NOT NULL,
    price_per_item DECIMAL(10, 2) NOT NULL,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO order_items
(orders_id, articles_id, numberOfItems, price_per_item)
VALUES
    (4, 1, 3, 19.00),
    (5, 2, 2, 15.00),
    (6, 4, 1, 100.00),
    (7, 3, 5, 25.00),
    (8, 6, 2, 62.00),
    (9, 7, 4, 70.00),
    (10, 8, 3, 59.00),
    (11, 1, 6, 19.00),
    (12, 9, 2, 38.00),
    (25, 10, 1, 94.00),
    (26, 2, 8, 15.00),
    (27, 6, 3, 62.00),
    (28, 1, 3, 19.00),
    (28, 2, 2, 15.00),
    (28, 4, 1, 100.00),
    (28, 6, 2, 62.00),
    (28, 8, 4, 59.00),
    (29, 1, 2, 19.00),
    (29, 3, 4, 25.00),
    (29, 6, 1, 62.00),
    (29, 8, 3, 59.00);