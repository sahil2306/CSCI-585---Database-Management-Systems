-- See the README.txt file for Table Creation and data insertion.
-- used MySQL for this assignment

-- Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users having the word “Marvel Entertainment” in them. Display the Video Title, channel name and the ratio in the ascending order of the title.

-- This query provides title,name and ratio of likes to views for all videos submitted by users who have name like "Marvel Entertainment".
-- The query begins with a subquery that uses the CASE statement to address divide by zero errors to get the like-to-view ratio for each video depending on the number of likes and views from the Statisctics Table.
-- This query is different from Q2.sql as this does not use join to get the results instead uses and filteration to get the results.

SELECT v.title, c.name, CASE WHEN s.views>0.0 THEN s.likes/s.views ELSE 0 END AS RATIO
FROM Video v, Channel c, Statistics s, User u
WHERE v.channel_id = c.id AND v.id = s.video_id AND c.owner_id = u.id AND u.name LIKE '%Marvel Entertainment%'
ORDER BY v.title ASC
