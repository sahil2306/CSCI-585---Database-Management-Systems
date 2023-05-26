-- See the README.txt file for Table Creation and data insertion.
-- used MySQL for this assignment

-- Q4. Find the average sentiment score for each keyword category. Display the keyword name along with average score such that the highest score is displayed first.

-- This SQL query provides descending order of average sentiment score each keyword used in the comments of videos in the "Information" category.
-- We want all the keywords from Information table and join is used to match records in the "Video" table with records in the "Information" table based on the video_id.
-- The query begins with a subquery that obtains information and video data for all videos in the "Information" category.
-- Then to retrieve all comments for each video with a categroty, the subquery is next combined with the "Comments" table on the video_id and we get the sentiment score for each video.
-- The last query determines the average sentiment score for each keyword used in the comments by grouping the results by keyword.
-- When all of the results are returned, they include each term used in the comments of videos in the "Information" category along with its corresponding average sentiment score, ordered in descending order by average sentiment score.

-- Tables Used : Video, Information, Comments

SELECT keyword,AVG(sentiment)
FROM(
	SELECT keyword,sentiment
	FROM(
		SELECT * FROM Information
		JOIN Video ON Video.id=Information.video_id
		WHERE Video.category='Information'
	)vid
	JOIN Comments ON Comments.video_id=vid.video_id
)comm
GROUP BY keyword
ORDER BY AVG(sentiment) DESC;