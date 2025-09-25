# World_Life_Expectancy Project (Exploratory Data Analysis)

SELECT *
FROM world_life_expectancy
;

-- Show me how much life expectancy has increased in each country over 15 years.
SELECT country, 
MIN(`Life expectancy`),
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS life_increase_15_years
FROM world_life_expectancy
GROUP BY country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY life_increase_15_years ASC
;

-- Show me the average global life expectancy per year.
SELECT year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
AND `Life expectancy` <> 0
GROUP BY year
ORDER BY year
;

-- Show me the relationship between average life expectancy and GDP across countries.
SELECT country, ROUND(AVG(`Life expectancy`),1) AS life_exp, Round(avg(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY country
HAVING life_exp > 0
AND GDP > 0
ORDER BY GDP DESC
;

-- Show me how life expectancy differs between high GDP and low GDP countries.
SELECT 
SUM(CASE WHEN GDP >=1500 THEN 1 ELSE 0 END) as High_GDP_Count,
AVG(CASE WHEN GDP >=1500 THEN `Life expectancy` ELSE NULL END) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <=1500 THEN 1 ELSE 0 END) as Low_GDP_Count,
AVG(CASE WHEN GDP <=1500 THEN `Life expectancy` ELSE NULL END) Low_GDP_Life_Expectancy
FROM world_life_expectancy
;

-- Show me the average life expectancy for developed vs developing countries.
SELECT status, COUNT(DISTINCT country), ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY status
;

-- Show me the relationship between life expectancy and BMI across countries.
SELECT country, ROUND(AVG(`Life expectancy`),1) AS life_exp, Round(avg(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY country
HAVING life_exp > 0
AND BMI > 0
ORDER BY BMI ASC
;

-- Show me the rolling adult mortality trend over the years across countries.
SELECT country
year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY country ORDER BY year) AS Rolling_Total
FROM world_life_expectancy
WHERE country LIKE '%UNITED%'
;

