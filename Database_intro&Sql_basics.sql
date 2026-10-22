/*Install MySQL or PostgreSQL on your system and create a new database named 
'music_streaming_app' using the command line or GUI tool of your choice. */
Create database music_streaming_app;

use music_streaming_app;

/*Inside the 'music_streaming_app' database, create a table called 'playlists'
 with columns: playlist_id (integer, primary key), name (varchar), and created_by (varchar).*/
 
create table playlists(
	playlist_id int unique not null,
    name varchar(20),
    created_by varchar(20)
);

/*Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 
'Chill Vibes', and 'Workout Mix', each created by a different user.*/

insert into playlists
values (1,'Bollywood Hits','Mitali'),
	   (2,'Chill Vibes','Appu'),
       (3,'Workout Mix','Bholu');
       
/*Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' table.*/
select * from playlists 
where created_by = 'Mitali';



#chatgpt explaination


/*Difference Between Table, Row, and Column in SQL
In SQL, a table, a row, and a column are the basic components used to store and organize data in a database. 
To understand these concepts, let us take the example of a food delivery application like Zomato.
1. Table
A table is a collection of related data organized into rows and columns. In a food delivery application, 
a table can be used to store information about customers, restaurants, food items, or orders.
For example, a Customers table stores information about the customers registered on the application.
2. Row
A row represents a single record in a table. It contains all the information related to one particular entry.
For example, in the Customers table, the details of a customer named Rahul, including their customer ID, name, and city, form one row.
3. Column
A column represents a specific attribute or type of information stored in a table. Each column has a name, such as CustomerID, Name, or City.
For example, the Name column in the Customers table contains the names of all registered customers.
Example: Customers Table in Zomato
CustomerID	Name	City
101	Rahul	Ahmedabad
102	Priya	Surat
103	Amit	Mumbai
In this example:
- Table: The entire Customers table containing all customer information.
- Row: The complete record of Rahul (101, Rahul, Ahmedabad).
- Column: The Name column, which contains Rahul, Priya, and Amit.
SQL Query Example
The following SQL query retrieves all the data from the Customers table:
SELECT * FROM Customers;


To retrieve only the names of customers, we can use:
SELECT Name FROM Customers;


Conclusion
A table is the complete structure that stores related data, 
a row represents one complete record,
 and a column represents a particular attribute of that record. 
 In a food delivery application like Zomato, tables organize customer information,
 rows store individual customer records, and columns store specific details such as customer ID, name, and city.


