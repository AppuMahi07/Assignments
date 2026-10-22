/*Create a table called Orders with columns: order_id, user_id, payment_method, and amount. 
Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).*/

CREATE TABLE Orders_Details (
    order_id INT UNIQUE NOT NULL,
    user_id INT NOT NULL,
    payment_method VARCHAR(20),
    amount DECIMAL(10,2)
);

INSERT INTO Orders_Details (order_id, user_id, payment_method, amount)
VALUES
(1, 101, 'UPI', 450.00),
(2, 102, 'Card', 799.50),
(3, 103, 'Wallet', 250.00),
(4, 104, 'COD', 350.00),
(5, 101, 'Card', 1200.00),
(6, 105, 'UPI', 599.00),
(7, 106, 'Wallet', 180.00),
(8, 102, 'COD', 650.00);


/*Write an SQL query to count how many orders were placed using each payment_method in the Orders table, 
similar to how Zomato shows payment breakdown in analytics.*/

select
	payment_method,
    count(payment_method)
from Orders_Details
group by payment_method;

/*Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.*/

select 
	user_id,
    sum(amount) as total_amount
from Orders_details
group by user_id;

/*Write an SQL query to show only those payment methods where the average order amount is greater than 300, 
using GROUP BY and HAVING.<br><br><em><strong>Hint:</strong> Use AVG(amount) in your HAVING clause.</em>*/

select
	payment_method,
    avg(amount) AS avg_amount
from Orders_Details
group by payment_method
Having avg_amount > 300;

/*Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. 
Your examples should show a scenario where WHERE and HAVING filter different things.*/

# where

select * from Orders_Details
where amount > 400;

# Having

select
	payment_method,
    avg(amount) AS avg_amount
from Orders_Details
group by payment_method
Having avg_amount > 300;
