-- See the README.txt file for Table Creation and data insertion.
-- used MySQL for this assignment

-- Q5. Find the minimum and maximum age of viewers who watched the most commented on video on Taylor Swift’s channel. Display the video title, minimum age and the maximum age.

-- This query provides the minimum and maximum age of viewers who watched the most commented on video on Taylor Swift’s channel.
-- First we find the video with the most comments on Taylor Swift's channel. For this we check all the videos uploaded by username "Taylor Swift" and find the video with the most comments after joining the user_name with channel_owner_name and then video_id to comment_video_id.
-- Using the VideoViews table we can find the the viewers of the video with the most comments.
-- We then join the VideoViews table with the User table to get the age of the viewers.
-- Then we find the minimum and maximum age of viewers who have watched that video.

-- Tables Used : VideoViews, Video, User, Comments, Channel



SELECT Video.Title, MIN(User.Age), MAX(User.Age) 
FROM VideoViews 
JOIN Video ON Video.id = VideoViews.video_id 
JOIN User ON User.id = VideoViews.user_id 
GROUP BY (video_id) 
HAVING video_id IN (
    SELECT Video.id 
    FROM (
		SELECT Video.id, COUNT(*) AS commentCount 
        FROM Video 
		JOIN Comments ON Comments.video_id = Video.id 
        WHERE Video.channel_id IN (
            SELECT Channel.id 
            FROM Channel 
			JOIN User ON Channel.owner_id = User.id 
            WHERE User.Name = 'Taylor Swift'
		) 
        GROUP BY (Video.id)
	) AS CommentInfo 
	JOIN Video ON Video.id = CommentInfo.id 
    WHERE CommentInfo.commentCount = (
        SELECT Max(commentCount) 
        FROM (
            SELECT Video.id, COUNT(*) AS commentCount 
            FROM Video JOIN Comments ON Comments.video_id = Video.id 
            WHERE 
			Video.Channel_id IN (
                SELECT Channel.id 
                FROM Channel 
				JOIN User ON Channel.owner_id = User.id 
                WHERE User.name = 'Taylor Swift'
			) 
			GROUP BY (Video.id)
		) AS CommentInfo
	)
);
