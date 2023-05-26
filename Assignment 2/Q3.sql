-- See the README.txt file for Table Creation and data insertion.
-- used MySQL for this assignment

-- Q3. Find unique user/s with the total number of paid subscribers greater than 100 for their channel/s created on 01.01.2023. Display the username, email, channel name and the subscriber count.

-- This query provides all the content creators having more than 100 paid subscribers for their channel created on 01.01.2023.
-- First we find all the channels created on 01.01.2023 and having more than 100 paid subscribers by grouping them by channel id and counting the number of paid subscribers.
-- Then we join the Channel table with the User table to get the name and email of the user.
-- Finally we join the User table to get the name of the owner along with the number of paid subscribers.

-- Tables Used : User, Channel, Subscription

SELECT User.Name, User.email, Channel.Name, Sub.TotalSubscribers
FROM 
(
	SELECT Channel.ID, COUNT(*) AS TotalSubscribers
	FROM Channel 
    JOIN Subscription ON Channel.id = Subscription.subscribed_to_id
	WHERE Channel.creationDate = '2023-01-01' AND Subscription.subscription_type = 'PAID'
	GROUP BY (Channel.id) 
    HAVING TotalSubscribers > 100
) AS Sub
JOIN Channel ON Sub.ID = Channel.id
JOIN User ON User.id = Channel.owner_id;
