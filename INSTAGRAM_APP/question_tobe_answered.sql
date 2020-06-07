-- WE want to reward the longest users. Find the 5 oldest users

SELECT * FROM users ORDER BY created_at ASC LIMIT 5;


-- What day of the week do most users register on?

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- Find the most inactive users

SELECT username FROM users
    LEFT JOIN photos ON photos.user_id = users.id 
    WHERE image_url IS NULL;

-- What is the most liked photo

SELECT username, photos.id AS photo_id, COUNT(*) AS 'number of likes' FROM photos
    INNER JOIN likes ON photos.id = likes.photo_id
    INNER JOIN users ON users.id = photos.user_id
    GROUP BY photos.id ORDER BY 3 DESC LIMIT 20;

-- CALCULATE avg number of photos per user



SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) 
    AS 'Average number of posts per user ';

--  What are the top 5 most commonly used hashtags?

SELECT tag_name, tag_id, COUNT(*) FROM tags
    INNER JOIN photo_tags ON tags.id = photo_tags.tag_id
    GROUP BY tags.id ORDER BY 3 DESC LIMIT 10;

-- SELCT the users who likes all the photos


SELECT  username,
        COUNT(*) AS Num_of_likes
FROM likes 
    JOIN users ON users.id = likes.user_id
        GROUP BY likes.user_id
        HAVING Num_of_likes = (SELECT COUNT(*) FROM photos);


    



