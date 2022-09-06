--Join all 3 tables into a single table..
SELECT * FROM Hotel_Project..['2018$']
UNION
SELECT * FROM Hotel_Project..['2019$']
UNION
SELECT * FROM Hotel_Project..['2020$']


--Create a temp table to calculate the revenue the hotel makes weekly
with hotels as (
SELECT * FROM Hotel_Project..['2018$']
UNION
SELECT * FROM Hotel_Project..['2019$']
UNION
SELECT * FROM Hotel_Project..['2020$']
)
--We want to see if revenue is increasing by year 
SELECT arrival_date_year, Round(SUM((stays_in_weekend_nights+stays_in_week_nights)*adr),2) as Revenue
 FROM hotels
 GROUP BY arrival_date_year
 ORDER BY arrival_date_year


 --We want to see if it is increasing by year and which Hotel type's revenue is growing or not year-on-year
with hotels as (
SELECT * FROM Hotel_Project..['2018$']
UNION
SELECT * FROM Hotel_Project..['2019$']
UNION
SELECT * FROM Hotel_Project..['2020$']
)
SELECT hotel,arrival_date_year, ROUND(SUM((stays_in_weekend_nights+stays_in_week_nights)*adr),2) as Revenue
 FROM hotels
 GROUP BY hotel,arrival_date_year
 ORDER BY hotel,arrival_date_year


 --Join the tables using Market Segment to add discounts and meals to the main table
with hotels as (
SELECT * FROM Hotel_Project..['2018$']
UNION
SELECT * FROM Hotel_Project..['2019$']
UNION
SELECT * FROM Hotel_Project..['2020$']
)
SELECT * FROM hotels
LEFT JOIN Hotel_Project..market_segment$
ON hotels.market_segment = Hotel_Project..market_segment$.market_segment
LEFT JOIN Hotel_Project..meal_cost$
ON hotels.meal = Hotel_Project..meal_cost$.meal


