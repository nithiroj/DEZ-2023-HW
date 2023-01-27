-- Q3
SELECT COUNT(1)
FROM yellow_taxi_2019
WHERE (tpep_pickup_datetime >= '2019-01-15' AND tpep_pickup_datetime < '2019-01-16')
AND (tpep_dropoff_datetime >= '2019-01-15' AND tpep_dropoff_datetime < '2019-01-16');

-- Q4
SELECT tpep_pickup_datetime, trip_distance
FROM yellow_taxi_2019
ORDER BY trip_distance DESC
LIMIT 1;

--Q5
-- 2 passengers

SELECT COUNT(1)
FROM yellow_taxi_2019
WHERE (tpep_pickup_datetime >= '2019-01-01' AND tpep_pickup_datetime < '2019-01-02')
AND (passenger_count = 2);

--3 passengers
SELECT COUNT(1)
FROM yellow_taxi_2019
WHERE (tpep_pickup_datetime >= '2019-01-01' AND tpep_pickup_datetime < '2019-01-02')
AND (passenger_count = 3);

-- Q6
SELECT d.pu_zone, d.do_zone, d.tip_amount
FROM (SELECT "PULocationID", z1."Zone" pu_zone, "DOLocationID", z2."Zone" do_zone, tip_amount
		FROM yellow_taxi_2019 y
		JOIN zones z1 ON y."PULocationID" = z1."LocationID"
		JOIN zones z2 ON y."DOLocationID" = z2."LocationID") AS d
WHERE d.pu_zone = 'Astoria'
ORDER BY d.tip_amount DESC
LIMIT 1;