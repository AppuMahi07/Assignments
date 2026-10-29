
/*Create a table named Playlists with columns: id, user_id, playlist_name, and total_likes. 
Insert at least 8 sample rows with different users and playlists, making sure some playlists have the same user_id.*/

CREATE TABLE Playlists_1 (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);

INSERT INTO Playlists_1
VALUES
(1, 101, 'Bollywood Hits', 250),
(2, 101, 'Romantic Songs', 180),
(3, 102, 'Workout Mix', 320),
(4, 103, 'Chill Vibes', 150),
(5, 102, 'Party Anthems', 400),
(6, 104, 'Sad Songs', 210),
(7, 103, '90s Classics', 175),
(8, 101, 'Travel Playlist', 290);

SELECT * FROM Playlists;



/*Write a SQL query using ROW_NUMBER() and the OVER() clause to assign a unique row number to each playlist, ordered by total_likes in descending order.*/

SELECT
    id,
    ROW_NUMBER() OVER (ORDER BY total_likes DESC) AS row_num,
    user_id,
    playlist_name,
    total_likes
FROM Playlists_1;

/*Use the RANK() function with the OVER() clause to rank all playlists by total_likes, and display the playlist_name, user_id, total_likes, and their rank.*/

SELECT
    playlist_name,
    user_id,
    total_likes,
    RANK() OVER (ORDER BY total_likes DESC) AS playlist_rank
FROM Playlists_1;

/*Write a SQL query using DENSE_RANK() and PARTITION BY user_id to rank each user's playlists by total_likes, showing playlist_name, user_id, 
total_likes, and dense rank.<br><br><em><strong>Hint:</strong> This will show how popular each playlist is within each user's account, 
similar to how Spotify might rank your top playlists.</em>*/

SELECT
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER (
        PARTITION BY user_id
        ORDER BY total_likes DESC
    ) AS denserank
FROM Playlists_1;

/*Imagine you want to show the top 2 playlists per user based on total_likes, like Spotify's 'Your Top Playlists' feature. 
Write a query using a window function to select only the top 2 playlists for each user.*/

WITH RankedPlaylists AS (
    SELECT
        playlist_name,
        user_id,
        total_likes,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY total_likes DESC
        ) AS row_num
    FROM Playlists_1
)
SELECT
    playlist_name,
    user_id,
    total_likes
FROM RankedPlaylists
WHERE row_num <= 2;