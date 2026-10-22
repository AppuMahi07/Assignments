use music_streaming_app;

/*Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration. 
Insert at least 5 records representing songs from your favorite Spotify playlist, 
then write a SELECT statement to retrieve all columns for all songs.*/

create table MusicPlaylist (
	id int unique not null,
    song_name varchar(20),
    artist varchar(20),
    genre varchar(20),
    duration varchar(10)
);


insert into MusicPlaylist
values (1,'Yeh Fitoor Mera','Arijit Singh','Romantic','4:44'),
	   (2,'Ok Jaanu','A. R. Rahman','Romantic','03:26'),
       (3,'Gone, Gone, Gone','Phillip Phillips','Folk Rock','03:29'),
       (4,'Jobaniyu','Aditya Gadhvi','Gujarati Folk','03:04'),
       (5,'Yellow','Coldplay','Alternative Rock','04:29');
       
select * from MusicPlaylist;
       
/*Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, 
showing just the first 3 records using the LIMIT keyword.*/
select 
	song_name,
    artist
from MusicPlaylist
limit 3;


/*Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. 
Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.*/
	   
create table FoodOrders(
id int unique not null,
restaurant varchar(20),
food_item varchar(20),
order_date date
);
       
select 
	distinct restaurant,
    id,
    food_item,
    order_date
from FoodOrders;

/*Write a SQL query on the FoodOrders table to select food_item as 'Dish' and 
order_date as 'Date Ordered', displaying only these two columns with the column aliases in the output.
*/

select
	food_item as Dish,
    order_date as Date_Ordered
from FoodOrders;


