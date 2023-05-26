-- See the README.txt file for Table Creation and data insertion.
-- used MySQL for this assignment

-- Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users having the word “Marvel Entertainment” in them. Display the Video Title, channel name and the ratio in the ascending order of the title.

-- This query provides title,name and ratio of likes to views for all videos submitted by users who have name like "Marvel Entertainment".
-- The query begins with a subquery that uses the CASE statement to address divide by zero errors to get the like-to-view ratio for each video depending on the number of likes and views from the Statisctics Table.
-- The title of the video is then retrieved by joining the subquery with the "Video" table using the video_id.
-- The user_id of the video is then retrieved by joining the subquery with the "Video" table using the video_id to get the name of the User who submitted the video.
-- The user name is then matched with "Marvel Entertainment".
-- The channel_id and channel_name are then obtained by joining the subquery's output with the "Channel" table on the video ID.
-- The results are then sorted in ascending order by the video title.

-- Tables Used : Video, User, Channel, Statistics


SELECT title AS Title, name AS Name, RATIO
FROM 
(
	SELECT title,RATIO,channel_id,name AS usr_name
	FROM(
	SELECT video_id, RATIO, user_id, channel_id, title
	FROM
	(
		SELECT video_id,RATIO
		FROM(
			SELECT Statistics.video_id, CASE WHEN Statistics.views>0.0 THEN Statistics.likes/Statistics.views ELSE 0 END AS RATIO
			FROM Statistics
		) sta
	) stat
	JOIN VIDEO ON stat.video_id=Video.id
	) vid
	JOIN User On vid.user_id=User.id
	WHERE name LIKE '%Marvel Entertainment%'
) usr
JOIN Channel ON Channel.id=usr.channel_id
ORDER BY title ASC;