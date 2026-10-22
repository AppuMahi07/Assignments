/* Create a table called Orders with columns: order_id, user_name, total_amount, and order_date.
insert 5 sample rows with different users and order amounts,
 including at least one NULL value for total_amount.*/

create table Orders(
order_id int unique not null,
user_name varchar(20),
total_amount int,
order_date date
);

insert into Orders
values (1,'Appu',700,'2000-07-24'),
	   (2,'Dipu',800,'2000-07-25'),
       (3,'Mitu',900,'2000-07-26'),
       (4,'Bholu',1010,'2000-07-27'),
       (5,'Neel',null,'2000-07-28');
       
/*Write a SQL query to count how many orders were placed by each user in the Orders table, 
displaying user_name and the number of orders as order_count.*/

select
	user_name,
    count(user_name) as order_count
from Orders
group by user_name;

/*Write a SQL query to calculate the average total_amount of all orders in the Orders table,
 making sure to ignore any NULL values.*/
 
 select 
	avg(total_amount)
from Orders
where total_amount is not null;
 
/*Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest
 and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a 
 single result row.*/
 
 select
	min(total_amount) as MIN,
    max(total_amount) as MAX
from Orders;
 
/*Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, 
but only include orders where total_amount is not NULL.*/

select
	sum(total_amount) as total_sales
from Orders 
where total_amount is not null;