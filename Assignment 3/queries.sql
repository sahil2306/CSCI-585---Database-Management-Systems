CREATE TABLE places (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  location GEOGRAPHY(Point, 4326)
);

insert into places values
(1,'Dept_Journalism',ST_SetSRID(ST_MakePoint(-118.2864185,34.0220838), 4326)),
(2,'Dept_Comm', ST_SetSRID(ST_MakePoint(-118.28593048839082,34.02200380896999), 4326)),
(3,'Music Complex', ST_SetSRID(ST_MakePoint(-118.28593772761207,34.0229088129425), 4326)),
(4,'Ramo Hall Music', ST_SetSRID(ST_MakePoint(-118.28522298242859,34.02272078005779), 4326)),
(5,'Dept_Production', ST_SetSRID(ST_MakePoint(-118.2862929, 34.0235143), 4326)),
(6,'Dept_IMGD', ST_SetSRID(ST_MakePoint(-118.2864906, 34.0235476), 4326)),
(7,'Dept_Aerospace', ST_SetSRID(ST_MakePoint(-118.2886076, 34.0206282), 4326)),
(8,'Dept_CompSci', ST_SetSRID(ST_MakePoint(-118.2892182, 34.0194928), 4326)),
(9,'Design Studio', ST_SetSRID(ST_MakePoint(-118.2875228, 34.0190509), 4326)),
(10,'Dept_Arch', ST_SetSRID(ST_MakePoint(-118.28805549114747, 34.01928087130881), 4326)),
(11,'Dept_DSO', ST_SetSRID(ST_MakePoint(-118.2857544, 34.0187756), 4326)),
(12,'Dept_Marketing', ST_SetSRID(ST_MakePoint(-118.2852662, 34.018718), 4326)),
(13,'Home',ST_SetSRID(ST_MakePoint(-118.28837566,34.02965886),4326));


SELECT id, name, ST_AsText(location) AS location_wkt
FROM places;


--Convex Hull
SELECT ST_AsText(
    ST_ConvexHull(
        ST_Collect(ST_AsText(location))
    )
) AS ConvexHull FROM places;

--Nearest Nieghbours
SELECT v.name, v2.name, ST_Distance(v.location, v2.location)
    FROM places v, 
        lateral(SELECT * 
                FROM places v2
                WHERE v2.name <> v.name
                ORDER BY v.geom <-> v2.geom LIMIT 4) v2
WHERE v.name = 'Home';