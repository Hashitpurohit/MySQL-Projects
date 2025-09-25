# World_Life_Expectancy Project  
**Created by:** Hashit Purohit  
**Date:** 25th September 2025  
**Tool Used:** MySQL  

---

## Project Description  
The **World Life Expectancy Project** is a SQL-based analysis aimed at cleaning and exploring global life expectancy data. The project is divided into two main phases:  

1. **Data Cleaning** – Identifying and correcting inconsistencies, handling duplicates, and filling missing values.  
2. **Exploratory Data Analysis (EDA)** – Performing statistical and relational queries to gain insights into how life expectancy is influenced by factors like GDP, BMI, country status, and adult mortality.  

This project provides a strong foundation for further visualization and advanced analytics, making the dataset ready for data-driven decision-making.  

---

## Approach  

### 1. Data Cleaning  
The raw dataset contained missing values, duplicates, and inconsistencies. The following steps were carried out:  

- **View Dataset**: Inspected all rows and columns.  
- **Remove Duplicates**:  
  - Checked for duplicates based on `Country` and `Year`.  
  - Used `ROW_NUMBER()` to flag duplicates.  
  - Deleted unnecessary duplicate records.  
- **Handle Missing Status (Developed/Developing)**:  
  - Identified blank values.  
  - Used information from other rows of the same country to fill missing values with either `Developed` or `Developing`.  
- **Handle Missing Life Expectancy**:  
  - Identified rows where `Life Expectancy` was missing.  
  - Replaced missing values using the **average of the previous and next year** for the same country.  

**Result:** A clean and consistent dataset ready for analysis.  

---

### 2. Exploratory Data Analysis (EDA)  
After cleaning, queries were run to uncover insights:  

- **Life Expectancy Growth**: Calculated the increase in life expectancy for each country over 15 years.  
- **Average Life Expectancy by Year**: Found the global trend of life expectancy per year.  
- **Life Expectancy vs GDP**:  
  - Measured the correlation between a country’s GDP and its life expectancy.  
  - Compared high-GDP vs low-GDP nations.  
- **Life Expectancy by Country Status**: Compared averages for `Developed` vs `Developing` countries.  
- **Life Expectancy vs BMI**: Explored how average BMI correlates with life expectancy.  
- **Adult Mortality Trend**: Used rolling totals to track adult mortality over time, focusing on countries with “UNITED” in their names.  

**Result:** Key insights into global health, economic impact, and demographic patterns.  

---

## 📂 Files Included  

1. **`World_Life_Expectancy (Data Cleaning).sql`**  
   - Queries for removing duplicates, fixing missing values, and preparing the dataset.  

2. **`World_Life_Expectancy Project (Exploratory Data Analysis).sql`**  
   - Queries for analyzing life expectancy trends, GDP correlations, and demographic insights.  

---

## Query Breakdown  

Each query has been documented with a **title** and a **"Show me" explanation** for easy understanding.  

### 🔹 Data Cleaning Queries  
1. Show me the complete dataset.  
2. Show me duplicate records based on country and year.  
3. Show me duplicate rows flagged with row numbers.  
4. Show me how duplicate records are removed.  
5. Show me rows where the status field is missing.  
6. Show me distinct status values.  
7. Show me the list of countries labeled as Developing.  
8. Show me how missing status values are updated to Developing.  
9. Show me how missing status values are updated to Developed.  
10. Show me rows where life expectancy values are missing.  
11. Show me the calculated average life expectancy from neighbouring years for missing values.  
12. Show me how missing life expectancy values are filled using averages.  

### Exploratory Data Analysis Queries  
1. Show me the complete dataset.  
2. Show me how much life expectancy increased in each country over 15 years.  
3. Show me the average global life expectancy per year.  
4. Show me the relationship between average life expectancy and GDP.  
5. Show me how life expectancy differs between high-GDP and low-GDP countries.  
6. Show me the average life expectancy for developed vs developing countries.  
7. Show me the relationship between life expectancy and BMI.  
8. Show me the rolling adult mortality trend in countries with 'UNITED' in their name.  

---

## Key Learnings  
- Data cleaning is crucial for ensuring accurate results.  
- Life expectancy is strongly influenced by **GDP** and **BMI**.  
- Developed countries show a higher average life expectancy compared to developing ones.  
- Adult mortality trends reveal valuable historical patterns.   

---

## Conclusion  
This project demonstrates the end-to-end process of **cleaning and analyzing a real-world dataset using MySQL**. It highlights how proper data preparation directly impacts the quality of insights derived during analysis.  

---
