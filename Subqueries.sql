use music_streaming_app;




/*Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table 
whose average rating is higher than the average rating of all restaurants in the city.*/

CREATE TABLE Restaurants_2 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    cuisine VARCHAR(30),
    rating DECIMAL(2,1),
    city VARCHAR(30)
);

INSERT INTO Restaurants_2
VALUES
(1, 'Spice Garden', 'Indian', 4.5, 'Ahmedabad'),
(2, 'Food Junction', 'Chinese', 3.5, 'Ahmedabad'),
(3, 'Urban Bites', 'Italian', 4.0, 'Ahmedabad'),
(4, 'Tasty Treat', 'Indian', 4.2, 'Surat'),
(5, 'Pizza Corner', 'Italian', 3.8, 'Surat'),
(6, 'Royal Dine', 'Indian', 4.6, 'Mumbai'),
(7, 'Cafe Delight', 'Cafe', 4.0, 'Mumbai'),
(8, 'Burger Hub', 'Fast Food', 3.5, 'Surat');

select * from restaurants_2;




select * from restaurants_2 R1
where rating > (select avg(rating) from restaurants_2 R2 where R1.city = R2.city);

/*Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table
 along with the total number of orders they have placed from an 'Orders' table, like a summary you might see in a Zomato user profile.*/

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Users (user_id, name)
VALUES
(1, 'Arjun'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Neha'),
(5, 'Karan');

CREATE TABLE Orders_1 (
    order_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Orders_1 (order_id, user_id, amount)
VALUES
(101, 1, 500.00),
(102, 1, 750.00),
(103, 2, 300.00),
(104, 3, 1200.00),
(105, 2, 450.00),
(106, 1, 250.00),
(107, 4, 600.00),
(108, 3, 800.00),
(109, 5, 400.00),
(110, 4, 350.00);

select
	u.name,
	(select count(order_id) from orders_1 o where o.user_id = u.user_id) as no_of_orders
from Users u;

/*Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have at least one
 review with a rating of 5 stars, as seen in BookMyShow's top-rated section.*/

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT
);

INSERT INTO Movies (movie_id, title, genre, release_year)
VALUES
(1, 'Jawan', 'Action', 2023),
(2, '3 Idiots', 'Comedy', 2009),
(3, 'Dangal', 'Drama', 2016),
(4, 'Pathaan', 'Action', 2023),
(5, '12th Fail', 'Drama', 2023);


CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    rating INT,
    review_text VARCHAR(200),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO Reviews (review_id, movie_id, rating, review_text)
VALUES
(101, 1, 5, 'Excellent movie'),
(102, 1, 4, 'Great action'),
(103, 2, 5, 'Very entertaining'),
(104, 3, 4, 'Good acting'),
(105, 3, 5, 'Outstanding performance'),
(106, 4, 3, 'Average experience'),
(107, 5, 5, 'Inspiring story'),
(108, 5, 4, 'Very good movie');

select * from Movies
where movie_id IN (select movie_id from Reviews where rating = 5);


/*Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform 
who have sold products in every category listed in a 'Categories' table.
<br><br><em><strong>Hint:</strong> Use nested subqueries to compare seller's categories with the complete list of categories.</em>*/

CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(50)
);

INSERT INTO Sellers (seller_id, seller_name)
VALUES
(1, 'Amit Traders'),
(2, 'Smart Deals'),
(3, 'Tech World'),
(4, 'Daily Needs');

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO Categories (category_id, category_name)
VALUES
(101, 'Electronics'),
(102, 'Clothing'),
(103, 'Home Appliances'),
(104, 'Books');

CREATE TABLE SellerProducts (
    seller_product_id INT PRIMARY KEY,
    seller_id INT,
    category_id INT,
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO SellerProducts (seller_product_id, seller_id, category_id)
VALUES
(1, 1, 101),
(2, 1, 102),
(3, 1, 103),
(4, 1, 104),
(5, 2, 101),
(6, 2, 102),
(7, 2, 103),
(8, 3, 101),
(9, 3, 103),
(10, 4, 101),
(11, 4, 102),
(12, 4, 103),
(13, 4, 104);


SELECT seller_name
FROM Sellers S
WHERE NOT EXISTS (
    SELECT category_id
    FROM Categories C
    WHERE NOT EXISTS (
        SELECT *
        FROM SellerProducts SP
        WHERE SP.seller_id = S.seller_id
        AND SP.category_id = C.category_id
    )
);