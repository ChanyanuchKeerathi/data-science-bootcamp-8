CREATE TABLE IF NOT EXISTS customer (
  id int unique,
  name text,
  country text,
  gender text
);

INSERT INTO customer VALUES
(1, 'Nuch', 'BKK', 'Female'),
(2, 'Morgan', 'USA', 'Male'),
(3, 'Rose', 'Korea', 'Female'),
(4, 'Rika', 'Japan', 'Female');

--menus
CREATE TABLE IF NOT EXISTS menu (
  menu_id int unique,
  name text,
  price text
);

INSERT INTO menu VALUES
  (1,'ramyon',150),
  (2,'sushi',200),
  (3,'chickensoup',120),
  (4,'noodle',200),
  (5,'water',50);

--order
CREATE TABLE IF NOT EXISTS orders (
  dates text,
  order_id int,
  menu_id int,
  customer_id int
);

INSERT INTO orders VALUES 
  ('2023-01-13',1,1,3),
  ('2023-01-14',2,3,3),
  ('2023-01-14',3,2,1),
  ('2023-01-14',4,5,2),
  ('2023-01-15',5,4,4),
  ('2023-01-15',6,1,4);

SELECT * FROM customer;
SELECT * FROM menu;
SELECT * FROM orders;

Select 
	orders.dates,
    customer.name As customer_name,
    menus.name as menus_name,
    menus.price as menus_price
from customer
JOIN orders
on customer.id = orders.customer_id
JOIN menus
on orders.menu_id = menus.menu_id;

Select 
	orders.dates,
    customer.name As customer_name,
    menus.name as menus_name,
    menus.price as menus_price
from customer
JOIN orders
on customer.id = orders.customer_id
JOIN menus
on orders.menu_id = menus.menu_id;

WITH sub1 AS (
  		SELECT * from customer
  		WHERE country = 'BKK'
), 
	 sub2 AS (
		SELECT * from orders
  		WHERE STRFTIME('%Y', dates) = '2023' 
)
SELECT 
	sub2.dates,
	sub1.name   
FROM sub1
JOIN sub2
on sub1.id = sub2.customer_id ;

Select 
	menu.name,
	COUNT(*) 
from customer
JOIN orders
on customer.id = orders.customer_id
JOIN menu
on orders.menu_id = menu.menu_id
GROUP by 1 
order BY 2 DESC;
