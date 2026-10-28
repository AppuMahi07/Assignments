use music_streaming_app;

/*Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). 
Insert at least 3 restaurants and 2-3 dishes for each restaurant.*/

create table restaurants_1(
	id int unique not null,
    name varchar(20),
    city varchar(20)
    );
    
create table dishes(
	id int unique not null,
    restaurant_id int not null,
    dish_name varchar(20),
    price DECIMAL(10,2)
    );
    
INSERT INTO restaurants_1 
VALUES
	(1, 'La Pinoz', 'Ahmedabad'),
	(2, 'Honest', 'Surat'),
	(3, 'Dominos', 'Mumbai');


INSERT INTO dishes 
VALUES
	(1, 1, 'Farmhouse Pizza', 299.00),
	(2, 1, 'Cheese Burst Pizza', 399.00),
	(3, 1, 'Garlic Bread', 149.00),
	(4, 2, 'Pav Bhaji', 120.00),
	(5, 2, 'Veg Burger', 90.00),
	(6, 2, 'Pulav', 150.00),
	(7, 3, 'Margherita Pizza', 199.00),
	(8, 3, 'Peppy Paneer', 349.00),
	(9, 3, 'Choco Lava Cake', 109.00);
    
    
/*Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, 
similar to how Zomato shows dish details with the restaurant info.*/

select 
	d.dish_name,
    r.name as resataurant_name,
    r.city
from dishes d
inner join restaurants_1 r on r.id = d.restaurant_id;

/*Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they 
currently have no dishes on the menu.*/

select
	r.*,
	d.dish_name 
from restaurants_1 r 
left join dishes d on d.restaurant_id = r.id;

	

/*Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, 
including any dishes that might not be linked to a restaurant*/

select
	d.*,
	r.name as restaurant_name
from restaurants_1 r 
right join dishes d on d.restaurant_id = r.id;


/*Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. 
Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.*/


create table playlist(
	id int unique not null,
    playlist_Name varchar(20)
    );
    
create table songs(
	id int unique not null,
    playlist_id int not null,
    song_name varchar(20),
    artist_name varchar(20)
    );
    
INSERT INTO playlist 
VALUES
	(1, 'Romantic Hits'),
	(2, 'Bollywood Hits'),
	(3, 'English Hits'),
	(4, 'Party Songs');
    
INSERT INTO playlist 
VALUES
	(5, 'Long Drive');
    
INSERT INTO songs (id, playlist_id, song_name, artist_name)
VALUES
	(1, 1, 'Tum Hi Ho', 'Arijit Singh'),
	(2, 1, 'Kesariya', 'Arijit Singh'),
	(3, 1, 'Raabta', 'Arijit Singh'),
	(4, 2, 'Apna Bana Le', 'Arijit Singh'),
	(5, 2, 'Jai Ho', 'A R Rahman'),
	(6, 2, 'Ghungroo', 'Arijit Singh'),
	(7, 3, 'Perfect', 'Ed Sheeran'),
	(8, 3, 'Yellow', 'Coldplay'),
	(9, 3, 'Memories', 'Maroon 5'),
	(10, 4, 'Kala Chashma', 'Badshah'),
	(11, 4, 'Kar Gayi Chull', 'Badshah'),
	(12, 4, 'London Thumakda', 'Labh Janjua');
    
    
    select
		playlist_name,
        song_name
	from playlist p
    left join songs s on p.id = s.playlist_id;
    
    
    # so I would not use inner join for empty playlists as it will not show it .