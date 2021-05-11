-- find the 5 oldest users

SELECT * FROM users 
ORDER BY created_at 
LIMIT 5;


-- Day with the highest registration number

SELECT 
DAYNAME(created_at) AS day,
COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- user with no photos

SELECT username
FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- Photo with the highest number of likes 

SELECT 
username,
photos.id,
photos.image_url, 
COUNT(*) AS total
FROM photos
INNER JOIN likes
ON likes.photo_id = photos.id
INNER JOIN users
ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

--  average number of photos per user 

SELECT (SELECT Count(*) 
FROM   photos) / (SELECT Count(*) 
FROM   users) AS avg; 

-- 5 most popular hashtags

SELECT tags.tag_name, 
Count(*) AS total 
FROM   photo_tags 
JOIN tags 
ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 