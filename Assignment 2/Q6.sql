-- See the README.txt file for Table Creation and data insertion.
-- used MySQL for this assignment

-- Q6. Find all the content creators living in the US who have consistently posted at least 1 video each week of the last month. Display their username, channel/s they own and their total subscriber count.

-- This query provides all the content creators living in the US who have consistently posted at least 1 video each week of the last month.
-- First we find all the content creators living in the US by joining the User table with the Channel table to get the name of the owner and the number of subscribers.
-- Then we check if the content creator has posted at least 1 video each week of the last month by checking if the content creator has posted at least 1 video in each of the 5 weeks in the month of January.
-- We do this by checking if the content creator has posted at least 1 video in each of the given dates.
-- We now have the content creators who have posted at least 1 video each week of the last month.

-- Tables Used : User, Channel, Video

SELECT User.Name, Channel.Name, Channel.number_of_subscribers
FROM User JOIN Channel ON Channel.owner_id = User.id
WHERE User.id IN
(
	SELECT Usr.ID 
    FROM User AS Usr 
    WHERE Usr.country='United States' 
    AND EXISTS(
		SELECT Video.id 
        FROM Video 
        JOIN Channel ON Video.channel_id = Channel.id 
        JOIN User ON User.id = channel.owner_id 
        WHERE User.id=Usr.id 
        AND Video.uploadDate BETWEEN ('2023-01-01') AND ('2023-01-07')
        ) 
	AND EXISTS(
		SELECT Video.id FROM Video JOIN Channel ON Video.channel_id = Channel.id 
		JOIN User ON User.id = Channel.owner_id 
        WHERE User.id=Usr.id 
        AND Video.uploadDate BETWEEN ('2023-01-08') AND ('2023-01-14')
	) 
	AND EXISTS(
		SELECT Video.id 
		FROM Video 
		JOIN Channel ON Video.channel_id = channel.id 
		JOIN User ON User.id = Channel.owner_id 
		WHERE User.id=Usr.id 
		AND Video.uploadDate BETWEEN ('2023-01-15') AND ('2023-01-21')
	) 
	AND EXISTS(
		SELECT video.id 
		FROM Video 
		JOIN Channel ON video.channel_id = Channel.id 
		JOIN User ON User.id = Channel.owner_id 
		WHERE User.id=Usr.id 
		AND Video.uploadDate BETWEEN ('2023-01-22') AND ('2023-01-28')
	) 
	AND EXISTS(
		SELECT Video.id 
		FROM Video 
		JOIN Channel ON Video.channel_id = Channel.id 
		JOIN User ON User.id = Channel.owner_id 
		WHERE User.id=Usr.id 
		AND Video.uploadDate BETWEEN ('2023-01-29') AND ('2023-01-31')
	)
);

