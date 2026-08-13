-- PIZZA SALES PROJECT
-- DATABASE & TABLE SETUP


-- 1. Create Database
CREATE DATABASE IF NOT EXISTS pizzahut;

-- Select Database
USE pizzahut;



-- 2. CREATE TABLE: pizza_types

CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    ingredients TEXT NOT NULL
);


-- 3. CREATE TABLE: pizzas

CREATE TABLE pizzas (
    pizza_id VARCHAR(50) PRIMARY KEY,
    pizza_type_id VARCHAR(50) NOT NULL,
    size VARCHAR(10) NOT NULL CHECK(size IN('S','M','L','XL','XXL')),
    price DECIMAL(5,2) NOT NULL CHECK (price > 0),

    CONSTRAINT fk_pizza_type
        FOREIGN KEY (pizza_type_id)
        REFERENCES pizza_types(pizza_type_id)
);


-- 4. CREATE TABLE: orders

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL
);


-- 5. CREATE TABLE: order_details

CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    pizza_id VARCHAR(50) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),

    CONSTRAINT fk_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_order_pizza
        FOREIGN KEY (pizza_id)
        REFERENCES pizzas(pizza_id)
);


-- =========================================
-- DATABASE STRUCTURE COMPLETED
-- =========================================