-- See the README.txt file for Table Creation and data insertion.
-- used MySQL for this assignment


-- Q1. Find the sponsor who has sponsored the highest amount in YouTube. Display the sponsor’s name, phone number and the total amount sponsored.

-- This query provides the name, contact, and total amount of sponsorship made by any sponsor.
-- For this we need to find the sponsor who has sponsored the highest amount in YouTube.
-- Amount of sponsorship is calculated by summing the amount of sponsorship for each video sponsorship from the Sponsorship Table using groupby sponsor_id.
-- The Maimum of all these sums is then checked with all other sum of sponsorship amounts to find ALL the sponsor who has sponsored the highest amount.
-- The sponsor's name and phone number are then retrieved by joining the subquery's output with the "Sponsor" table using the sponsor_id.
-- The query then refines the results to only show the sponsor with the greatest overall sponsorship amount. 
-- By grouping the "Sponsorship" data by sponsor ID and adding the amount of each sponsorship, a subquery that estimates the maximum amount of sponsorship is used to do this.
-- The names, contact information, and total amount of sponsorship made by the sponsor who contributed the most overall are finally returned.

-- Tables Used : Sponsorship, Sponsor

SELECT name,phone,AMOUNT
FROM(
	SELECT sponsor_id,sum(amount) AS AMOUNT
	FROM Sponsorship
	GROUP BY sponsor_id
) s
JOIN Sponsor ON s.sponsor_id=Sponsor.id
WHERE AMOUNT= (SELECT MAX(AMOUNT) 
FROM(
	SELECT Sponsor_id AS S_id,sum(amount) AS AMOUNT
	FROM SPONSORSHIP
    GROUP BY S_id
) AS FindMaxAmt
);