# CSCI-585---Database-Management-Systems

## HW1: EER Diagram
In this assignment, you need to create a conceptual (Extended) Entity-Relational [ie. (E)ER] diagram, to model the scenario described below; note that your design is not going to be at an implementation level, ie. you don't have to worry about representing your design using relational tables (including bridges) - you will only need to come up with entities and relationships, and possibly also use the (E)ER notation for supertypes/subtypes.

## HW2: SQL
In this HW, you are going to be creating relational tables (with your own rows of data), and writing queries that will make use of the data.

The HW is an 'extension' of HW1, in a way - you can reuse the entities you created in HW1, OR, you can use a different set of entities if you like [there is no req'mt that you MUST use your HW1's tables].

ALL the SQL knowledge/commands you need to answer the questions have been covered in class! You do NOT need to learn more commands or techniques (eg. use of 'triggers') etc. on your own in order to do this HW set.

To run SQL code, you can use one of the three ways mentioned in the lecture notes [a locally installed DB, or a remote server-based DB via an online shell running in a browser page, or a cloud DB] to do the problems - including using https://livesql.oracle.com/, https://bit.io, SQLite Browser, Oracle XE, sqlfiddle, etc.

There are 6 questions below, each is worth 1 point.
Description [created by our own Vinutha, who created HW1 as well :)]
Q1. Find the sponsor who has sponsored the highest amount in YouTube. Display the sponsor’s name, phone number and the total amount sponsored.
Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users having the word “Marvel Entertainment” in them. Display the Video Title, channel name and the ratio in the ascending order of the title.
Q3. Find unique user/s with the total number of paid subscribers greater than 100 for their channel/s created on 01.01.2023. Display the username, email, channel name and the subscriber count.
Q4. Find the average sentiment score for each keyword category. Display the keyword name along with average score such that the highest score is displayed first.
Q5. Find the minimum and maximum age of viewers who watched the most commented on video on Taylor Swift’s channel. Display the video title, minimum age and the maximum age.
Q6. Find all the content creators living in the US who have consistently posted at least 1 video each week of the last month. Display their username, channel/s they own and their total subscriber count.

## HW3: Geospatial data handling
In this homework, you are going to work with spatial data - you will collect/create (generate/sample) your own spatial data, visualize it, do queries on it, and visualize the query results.. Hope you have fun with this! Geospatial data handling is a valuable skill!

To be submitted: 
1) .kml file from step 5 above - with the placemarks, convex hull and nearest-neighbor line segments
2) text file (.txt or .sql) with your two queries from step 5 - table creation commands (if you use Postgres and directly specify points in your queries, you won't have table creation commands, in which case you wouldn't need to worry about this part), and the queries themselves
3) .html file (with the OpenLayers code) from step 6, or a CodePen/jsfiddle link
4)  Spirograph point generation code, the resulting .kml file ("spiro.kml"), shapefile (this needs to be a .zip) and a screenshot

## HW4: NoSQL
1) Write a (simple!) query to output locations (documents) with a popularity of >=50. Take a screenshot of the query and results.
2) Visualize your 12 locations (ie the HW3Data collection), take a screenshot. To visualize (create a chart), you'd pick a chart type, then drag and drop document columns (keys) on to the chart's slots
3) Write a query (in the chart area) where you would specify a bounding box (lower-left location, upper-right location) to display just the northern half of your 12 locations. Take a screenshot of the query and the result.
4) Bring your Spirograph data into a new map
5) Specify a triangle (three locations) to display just the Spiro coords inside your triangle. Take a screenshot of the query and result (this is a cool capability, to bound spatial search results by specifying an arbitrary polygon).
6) Bring in all the national parks into another map - cool! All 396 are visible, on a map of the entire US. Write a query to output just the western half locations (west of the Rockies). Create a bounding box to do this (like in Q3). Take a screenshot.

Have fun! Now you know how to insert JSON docs into MongoDB, query, visualize, do spatial queries. Neat :)

## HW5: ML
1) Weights.h5, and a screenshot from HDFView of the neural networks
2) 'good' cat and dog pics, and screenshot that shows proper classification
3) 'trick' cat and dog pics, and screenshot that shows misclassification
4) MobileNet-based detection. get your own Chihuahua CLOSEUP (crop what you download if you need to), and a muffin, put in each (one after another), load the page in your browser, get screenshots of the detection.