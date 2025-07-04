USE Flight_Data;

Select * From Flight_Data..flights_data

---------------querry for finding data type of each column in the sql table -----------------
SELECT 

    COLUMN_NAME,

    DATA_TYPE

FROM 

    INFORMATION_SCHEMA.COLUMNS

WHERE 

    TABLE_NAME = 'flights_data';
----------------- Change data type flight_date,dep_time,arr_time columns ---------------------------
ALTER TABLE flights_data
ALTER COLUMN [flight date] date;

ALTER TABLE flights_data
ALTER COLUMN dep_time time;

ALTER TABLE flights_data
ALTER COLUMN arr_time time;
-------------------find the costliest flight in economy class and business class in the entire dataset --------------------------------------------------------
SELECT * from flights_data where price in (SELECT MAX(price) as costliest_flight FROM flights_data WHERE class = 'economy');

SELECT * from flights_data where price in (SELECT MAX(price) as costliest_flight FROM flights_data WHERE class = 'business');

-- Here first we find the airline that has most flown in given dataset then in that airline from which city it has flown the most

 WITH most_flight AS (
Select airline, [from], COUNT(*) OVER(PARTITION BY airline) as flight_count FROM flights_data ---------here we count the number of flight per airline
),
airline_rank as(
Select * , RANK() OVER(ORDER BY flight_count desc) as flight_rank from most_flight ------------here we give rank according to number of flights per airline 
)
Select TOP 1 [from], airline, flight_count, COUNT(*) OVER(PARTITION BY [from])as freq_city FROM airline_rank 
where flight_rank = 1
order by freq_city desc;  -----------------------Here we select the flight with most flights using rank 1 and then find the city from which the airline has flown the most which we count under freq_city

---------------------find the path most travelled //// we find from and to which cities there are most flights ----------------

Alter Table flights_data Add air_path nvarchar(255);
Update flights_data set air_path = [from] + ' ' + [to];

Select top 1 air_path, count(*) as freq_path from flights_data group by air_path order by freq_path desc;

------most travelled path of each airline -------------
With most_path as (Select airline, air_path, count(*) over(partition by airline, air_path) as freq_path from flights_data), ------here we count the number of times a path has been taken partitioned airline and airpath so there is different count for each airline as well as each air_path
airline_path as (Select *,rank() over(partition by airline order by freq_path desc) as path_rank from most_path)-------now we rank frequency of each air_path in each airline 
Select Distinct airline, air_path, freq_path, path_rank from airline_path where path_rank=1;---------Here we select the most frequent path for each airline using the rank 

-----------------costliest flight airline wise in economy class -----------------------
WITH costly_flight as (SELECT *, MAX(price) OVER(PARTITION BY airline) as costliest_flight FROM flights_data WHERE class = 'economy')
SELECT * from costly_flight where price=costliest_flight;

------------------------costliest flight airline wise in bussiness class ----------------
WITH costly_flight as (SELECT *, MAX(price) OVER(PARTITION BY airline) as costliest_flight FROM flights_data WHERE class = 'business')
SELECT * from costly_flight where price=costliest_flight;