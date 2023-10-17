
----- Project Name --> Heart Attack Risk Prediction
----- Created By --> Sakshi Shiraskar
----- Tools Used --> MySQL, PowerBI

*/

Description
•	The dataset contains information of patients based on different health parameters.
•	We would write SQL queries to find out the risk factors triggering a heart attack.

NOTE :- In this SQL file we will write SQL queries to find insights

/*

-- Q.1) Total candidates surveyed
SELECT  COUNT(*) AS Total_Candidates
FROM    heart_attack_risk;


-- Q.2) Total people at risk of heart attack
SELECT   COUNT (*) AS Total_Candidates_At_Risk
FROM     heart_attack_risk
WHERE    heart_attack_risk = 1;


-- Q.3 Gender-wise people having the risk of heart attack
SELECT   sex,
         COUNT (sex) AS risk_according_to_sex
FROM     heart_attack_risk
WHERE    heart_attack_risk = 1 
GROUP BY sex;


-- Q.4) Count of cholesterol levels amongst the population
SELECT   Cholesterol_Level, 
         COUNT (1) AS People_at_risk
FROM     heart_attack_risk
GROUP BY Cholesterol_Level;


-- Q.5) Count of people at risk of heart attack as per their cholesterol levels
SELECT   Cholesterol_Level,
         COUNT (1) as People_at_risk
FROM     heart_attack_risk
WHERE    heart_attack_risk = 1 
GROUP BY Cholesterol_Level;


-- Q.6) Count of smokers
SELECT   smoking,
         COUNT (1)
FROM     heart_attack_risk
WHERE    heart_attack_risk = 1 
GROUP BY smoking;


-- Q.7) Percentage of people who are smokers and are at risk of heart attack
SELECT    smoking, 
          ROUND (COUNT (1)*100/
                 (SELECT COUNT (*)
                    FROM heart_attack_risk),2) AS percentage_of_people_at_risk
FROM      heart_attack_risk
WHERE     heart_attack_risk = 1 
GROUP BY  smoking;


-- Q.8) Continent-wise count of people who are at risk of having heart attacks
SELECT    continent, 
          COUNT (*) AS Continent_wise_people_at_risk_count
FROM      heart_attack_risk
WHERE     heart_attack_risk = 1 
GROUP BY  continent
ORDER BY  count(*) desc;


-- Q.9)  Top 3 countries from the Asia continent having a population at risk of a heart attack.
SELECT    continent, 
          country, 
          COUNT (*) AS people_at_risk_count
FROM      heart_attack_risk
WHERE     heart_attack_risk = 1  AND Continent = "Asia"
GROUP BY  continent, country
ORDER BY  count(*) desc
LIMIT     3;

-- Q.10) Count of people at risk of having heart attack per hemisphere.
SELECT    hemisphere, 
          COUNT (*) AS count_per_hemisphere
FROM      heart_attack_risk
WHERE     heart_attack_risk = 1
GROUP BY  hemisphere
ORDER BY  COUNT(*) desc;

