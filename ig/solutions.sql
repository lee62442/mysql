-- 1. Finding 5 oldest users

SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;

-- 2. Most Popular Registration Date

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- 3. Inactive Users (users with no photos)

SELECT username FROM users
LEFT JOIN photos ON photos.user_id = users.id
WHERE image_url IS NULL;

-- 4. Identify most popular photo (and user who created it)

SELECT username, image_url, COUNT(*) AS like_count FROM users
JOIN photos ON photos.user_id = users.id
JOIN likes ON likes.photo_id = photos.id
GROUP BY likes.photo_id
ORDER BY like_count DESC;

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

   
-- 5. Calculate average number of photos per user

SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 
                

SELECT 
    AVG(count)
FROM 
    (SELECT COUNT(photos.id) as count FROM photos
     RIGHT JOIN users ON users.id = photos.user_id
     GROUP BY users.id) as b
     
-- 6. Find the five most popular hashtags
SELECT tag_name, COUNT(tag_id) AS total FROM tags
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- 7.
SELECT 
    username,
    COUNT(*) AS num_likes
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING num_likes = (SELECT COUNT(*) FROM photos)






















