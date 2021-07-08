-- display_all_data_in_the_table
select * from sql_inventory.products;
-- select database on which we will work
USE sql_inventory;
-- like is used to fetch the data that start or end with specific letter
select name from products where name like 'b%' order by name limit 1;
select unit_price * 1000 AS total_price from products ;
select distinct name  from products ;
select * from products where unit_price >= 4.5;
select * from products where unit_price between 2 and 5;
select * from products where quantity_in_stock in (38,90, 14 );
select * from products where name regexp '[st]e$';
select * from products where name is not null; 
select * from  products order by name;
select * from products limit 2,2;
select * from products p join sql_invoicing.clients c on c.client_id = p.product_id;
select * from products p left join sql_invoicing.clients c on c.client_id = p.product_id;
select * from products p right join sql_invoicing.clients c on c.client_id = p.product_id;
select * from products p inner join sql_invoicing.clients c on c.client_id = p.product_id;
select * from products p left join sql_invoicing.clients c on c.client_id = p.product_id where c.client_id is null;
select * from products p join sql_invoicing.clients c on c.client_id = p.product_id where p.product_id is null OR c.client_id is null;
use sql_store;
select * from customers;
select * from customers c 
join orders o 
using (customer_id)
join order_items oi
using (order_id);

create trigger change_status_order
before update
on orders
for each row 
set new.status = 3;
SET SQL_SAFE_UPDATES = 0;
update orders set 
comments = "okay"
where comments is NULL;
drop  FUNCTION if exists check_customer_order_id;

create function check_customer_order_id(customer_id_given int(20))
returns int(20) DETERMINISTIC
return (select  order_id from orders where customer_id=customer_id_given limit 1);

select customer_id , check_customer_order_id(customer_id) as order_no from customers where check_customer_order_id(customer_id)  is not null;

select  order_id from orders  inner join customers c on c.customer_id=6

select order_id from orders where customer_id=2;


