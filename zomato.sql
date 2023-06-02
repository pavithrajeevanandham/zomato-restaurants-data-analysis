SELECT * FROM zomato;

SELECT distinct restaurant_name FROM zomato;

--CHECKING FOR DUPLICATE
SELECT restaurant_id,COUNT(restaurant_id) FROM 
zomato
GROUP BY restaurant_id
ORDER BY 2 DESC;

SELECT * FROM country_code;

--CLEAN CITY COLUMN IF ANY MISS-SPELLED WORDS PRESENT
SELECT DISTINCT city FROM zomato 
WHERE city LIKE '%?%';	

UPDATE zomato SET city = 'Sao Paulo' WHERE city = 'S?o Paulo';

UPDATE zomato SET city = REPLACE(city, '?', '') WHERE city ILIKE '%?%';

--UNIQUE CITIES
SELECT DISTINCT city FROM zomato;

--AVERAGE RATING OF Restaurants 
SELECT restaurant_name, ROUND(AVG(aggregate_rating), 1) as AverageRating FROM zomato GROUP BY restaurant_name;

--Number of Restaurants present in each city
SELECT city, count(restaurant_name) FROM zomato GROUP BY city;

--Top 10 cities with the highest number of restaurants
SELECT city FROM zomato GROUP BY city ORDER BY COUNT(restaurant_name) DESC LIMIT 10;

--The average cost for two people across all restaurants
SELECT ROUND(AVG(average_cost_for_two)) as AverageCostForTwo FROM zomato;

--The average cost for two people vary across different cities
SELECT city, ROUND(AVG(average_cost_for_two)) as AverageCostForTwo FROM zomato GROUP BY city;

--No of Restaurants offer online table booking
SELECT count(*) FROM zomato WHERE has_table_booking = 'Yes';

--Maximum Voted Restaurant
SELECT restaurant_name FROM zomato WHERE votes = (SELECT MAX(votes) FROM zomato);

--Top 3 countries with the highest number of restaurants
SELECT country FROM zomato JOIN country_code on zomato.country_code = country_code.country_code 
GROUP BY country ORDER BY COUNT(country) DESC LIMIT 3;

--Top 10 restaurants in a Chennai city based on average ratings
SELECT restaurant_name, ROUND(AVG(aggregate_rating), 1) as AverageRating FROM zomato 
WHERE city = 'Chennai'
GROUP BY restaurant_name ORDER BY ROUND(AVG(aggregate_rating), 1) DESC LIMIT 10;

