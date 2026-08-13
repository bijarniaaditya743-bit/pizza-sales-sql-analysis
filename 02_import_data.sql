-- Import orders data

LOAD DATA LOCAL INFILE 'orders.csv'
INTO TABLE pizzahut.orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, date, time);

-- verify imported rows
select count(*) from pizzahut.orders;


-- Import order_details data

LOAD DATA LOCAL INFILE 'order_details.csv'
INTO TABLE pizzahut.order_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_details_id, order_id, pizza_id, quantity);

-- verify imported rows
select count(*) from pizzahut.order_details;
