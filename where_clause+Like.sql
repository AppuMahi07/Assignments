/*Create a table called Restaurants with columns: id, name, cuisine, rating, and city. 
Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato.*/

create table Restaurants(
id int unique not null,
name varchar(20),
cuisine varchar(20),
rating int,
city varchar(20));


INSERT INTO Restaurants 
VALUES
(1, 'Dominos', 'Pizza', 4, 'Ahmedabad'),
(2, 'Honest', 'Gujarati', 5, 'Ahmedabad'),
(3, 'McDonalds', 'Fast Food', 4, 'Mumbai'),
(4, 'Subway', 'Sandwich', 3, 'Surat'),
(5, 'Havmor', 'Ice Cream', 5, 'Vadodara');

/*Write a SQL query to find all restaurants in the Restaurants table that have a rating greater than 4.0 
and are located in either 'Ahmedabad' or 'Surat'.*/

select * from Restaurants
where rating >= 4 and (city = 'Ahmedabad' or city = 'Surat');

/*Using the LIKE operator, write a query to select all restaurants whose names start with 'Swa' 
(for example, 'Swagat', 'Swadisht') from the Restaurants table.*/

select * from Restaurants
where name Like 'H%';

/*Write a SQL query using the BETWEEN keyword to find all restaurants in the Restaurants 
table with a rating between 3.5 and 4.5 (inclusive).*/

select * from Restaurants
where rating between 3 and 4;

/*Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', 
or 'South Indian' using the IN operator.*/

select * from Restaurants 
where cuisine in ('Pizza','Fast Food');