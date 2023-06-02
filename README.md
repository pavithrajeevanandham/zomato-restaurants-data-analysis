## Restaurants Analysis using SQL

## 1 - How many restaurants are present in each city?
Answer: Below query display number of restaurants present in each city

SQL Query:
```sql 
SELECT city, count(restaurant_name) 
FROM zomato 
GROUP BY city;
```

## 2 - Which are the top 10 cities with the highest number of restaurants?
Answer: Below query display top 10 cities with the highest number of restaurants

SQL Query:
```sql 
SELECT city 
FROM zomato 
GROUP BY city 
ORDER BY COUNT(restaurant_name) DESC 
LIMIT 10;
```

## 3 - How does the average cost for two people vary across different cities?
Answer: Below query display the average cost for two people vary across different cities

SQL Query:
```sql 
SELECT city, ROUND(AVG(average_cost_for_two)) as AverageCostForTwo 
FROM zomato 
GROUP BY city;
```

## 4 - What are the top 10 restaurants in a specific city based on average ratings?
Answer: Below query display the top 10 restaurants in a chennai city based on average ratings

SQL Query:
```sql 
SELECT restaurant_name, ROUND(AVG(aggregate_rating), 1) as AverageRating 
FROM zomato 
WHERE city = 'Chennai'
GROUP BY restaurant_name 
ORDER BY ROUND(AVG(aggregate_rating), 1) DESC 
LIMIT 10;
```

## 5 - What are the top 3 countries with the highest number of restaurants?
Answer: Below query display the top 3 countries with the highest number of restaurants

SQL Query:
```sql 
SELECT country FROM zomato 
JOIN country_code on zomato.country_code = country_code.country_code 
GROUP BY country 
ORDER BY COUNT(country) DESC 
LIMIT 3;
```