# World_Life_Expectancy (Data Cleaning)


SELECT * FROM world_life_expectancy; 

# Removing Duplicates


-- Show me duplicate records in the dataset based on Country and Year.
SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year))
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT(Country, Year) 
HAVING COUNT(CONCAT(Country, Year)) > 1
;

-- Show me the duplicate rows flagged with row numbers.
SELECT *
FROM (
	SELECT Row_ID,
	CONCAT(Country, Year),
	ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
	FROM world_life_expectancy
    ) 
    AS row_table
WHERE row_num > 1
;

-- Show me how duplicate records are removed from the dataset.
DELETE FROM world_life_expectancy
WHERE 
  Row_ID IN (
    SELECT Row_ID
FROM (
	SELECT Row_ID,
	CONCAT(Country, Year),
	ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
	FROM world_life_expectancy
	) 
	AS row_table
WHERE row_num > 1
)
;

-- Show me rows where the status field is missing.
SELECT * 
FROM world_life_expectancy
WHERE status = ''
;

-- Show me the distinct available status values in the dataset.
SELECT DISTINCT(status)
FROM world_life_expectancy
WHERE status <> ''
;

-- Show me the list of countries labeled as "Developing".
SELECT DISTINCT(country)
FROM world_life_expectancy
WHERE status = 'Developing'
;

-- Show me how missing status values are updated to "Developing".
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
SET t1.status = 'Developing'
WHERE t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developing'
;

-- Show me how missing status values are updated to "Developed".
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
SET t1.status = 'Developed'
WHERE t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developed'
;


SELECT * 
FROM world_life_expectancy
;

-- Show me rows where life expectancy values are missing.
SELECT country,year,`Life expectancy`
FROM world_life_expectancy
WHERE `Life expectancy` = ''
;

-- Show me the calculated average life expectancy from neighboring years for missing values.
SELECT t1.country, t1.year, t1.`Life expectancy`,
t2.country, t2.year, t2.`Life expectancy`,
t3.country, t3.year, t3.`Life expectancy`,
ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
    AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
	ON t1.country = t3.country
    AND t1.year = t3.year + 1
WHERE t1.`Life expectancy` = ''
;

-- Show me how missing life expectancy values are filled using the average of the previous and next year.
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.country = t2.country
    AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
	ON t1.country = t3.country
    AND t1.year = t3.year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy` = ''
;

