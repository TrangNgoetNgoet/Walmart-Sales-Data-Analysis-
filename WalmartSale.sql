CREATE DATABASE Walmartsale;
-- input table to database by "CTRL + I" 
--I. Data Preparation and Cleaning Data
select * from Walmartsale;
ALTER TABLE Walmartsale
DROP COLUMN column1;
-- I. PART I:  Check missing values:

select * from Walmartsale;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'walmartsale'; --- CHECK DATA TYPE OF ALL COLUMNS IN TABLE WALMARTSALE
-- DATA TYPE IS BASICLY CORRECT! 
--- CHECK MISSING VALUES IN ALL COLUMNS
SELECT COUNT(CASE WHEN Store IS NULL THEN 1 END) AS STORENULLNUMBER,
        COUNT(CASE WHEN [Date] IS NULL OR [Date] = '' THEN 1 END) AS DateNULLNUMBER,
        COUNT(CASE WHEN Temperature IS NULL THEN 1 END) AS TemperatureNULLNUMBER,
        COUNT(CASE WHEN Fuel_Price IS NULL THEN 1 END) AS Fuel_PriceNULLNUMBER,
        COUNT(CASE WHEN MarkDown1 IS NULL THEN 1 END) AS MarkDown1NULLNUMBER,
        COUNT(CASE WHEN MarkDown2 IS NULL THEN 1 END) AS MarkDown2NULLNUMBER,
        COUNT(CASE WHEN MarkDown3 IS NULL THEN 1 END) AS MarkDown3NULLNUMBER,
        COUNT(CASE WHEN MarkDown4 IS NULL THEN 1 END) AS MarkDown4NULLNUMBER,
        COUNT(CASE WHEN MarkDown5 IS NULL THEN 1 END) AS MarkDown5NULLNUMBER,
        COUNT(CASE WHEN CPI IS NULL THEN 1 END) AS CPINULLNUMBER,
        COUNT(CASE WHEN Unemployment IS NULL THEN 1 END) AS UnemploymentNULLNUMBER,
        COUNT(CASE WHEN IsHoliday IS NULL THEN 1 END) AS IsHolidayNULLNUMBER,
        COUNT(CASE WHEN [Type] IS NULL THEN 1 END) AS TypeNULLNUMBER,
        COUNT(CASE WHEN [Size] IS NULL THEN 1 END) AS SizeNULLNUMBER,
        COUNT(CASE WHEN [Unemployment] IS NULL THEN 1 END) AS UnemploymentNULLNUMBER
FROM Walmartsale; 
--- NO MISSING VALUES


--II. CHECK OUTLIERS
--we need to check outliers for columns: weekly_sales, temperature, fuel_price, CPI and unemployment
-- with columns like TEMPERATURE,fuel_price, CPI, Unemployment, I will checl min, max, and avg to see any abnormality
select 
    min(CPI) as minCPI,
    max(CPI) as maxCPI,
    avg(CPI) as avgCPI,
    min(Unemployment) minUn,
    max(Unemployment) maxUn,
    avg(Unemployment) avgUn,
    min(TEMPERATURE) as minTEMPERATURE,
    max(TEMPERATURE) as maxTEMPERATURE,
    avg(TEMPERATURE) as avgTEMPERATURE,
    min(Fuel_Price) as minFu,
    max(Fuel_Price) as maxFu,
    avg(Fuel_Price) as avgFu
from WalmartSale
select count(*) from walmartsale
where temperature <5 or temperature > 60
-- The temperature Must be in F range
-- so there if no abnormality
-- check OUTLIER OF weekly_sales BY Zscore 
select * from WalmartSale;
ALTER TABLE WalmartSale
ADD [Year] AS (YEAR([Date])),
    [Month] AS (MONTH([Date])),
    [Season] AS (
      CASE
        WHEN MONTH([Date]) IN (12,1,2)  THEN 'Winter'
        WHEN MONTH([Date]) IN (3,4,5)  THEN 'Spring'
        WHEN MONTH([Date]) IN (6,7,8)  THEN 'Summer'
        WHEN MONTH([Date]) IN (9,10,11) THEN 'Autumn'
        ELSE 'Unknown'
      END
    );--- add time columns to data table
--- explore about outlier
select season,count(Season) from 
(select
Store, Season,[MONTH],
Weekly_Sales, 
ISholiday,
Markdown1,
Markdown2,
Markdown3,
Markdown4,
Markdown5,
(Weekly_Sales - AVG(weekly_sales) over())/STDEV(weekly_sales) OVER () as Zscore
from WalmartSale) as scoretable
where (Zscore > 5 or Zscore < -5) and (IsHoliday = 0) and(MarkDown1 = 0) and (MarkDown2 = 0) and (MarkDown3 =0)
and (MarkDown4 = 0) and (MarkDown5 = 0)
group by Season;
--- (The outliers are scattered throughout the seasons of the year, evenly 
--- distributed, not too unusual so we decided to leave the outliers as they )
--- are and go into the analysis.)
--III. CHECK DUPLICATES
--WalmartSale table
select * from Walmartsale;
select Store, [Date], isHoliday, Dept,Weekly_Sales,Temperature, Fuel_Price, 
Markdown1, Markdown2, Markdown3, Markdown4,Markdown5, CPI, Unemployment, [Type], [Size],COUNT(*)
from Walmartsale
GROUP BY Store, [Date], isHoliday, Dept,Weekly_Sales,Temperature, Fuel_Price, 
Markdown1, Markdown2, Markdown3, Markdown4,Markdown5, CPI, Unemployment, [Type], [Size]
HAVING COUNT(*) > 1; -- NO DUPLICATE

SELECT Store, Dept, Date, COUNT(*)
FROM WalmartSale
GROUP BY Store, Dept, Date
HAVING COUNT(*) > 1; -- NO DUPLICATE


---IV: Data Type: 
SELECT * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='WALMARTSALE'; --- ISHOLIDAY COLUMN SHOULDE BE BIT DATATYPE
--CONVERT ISHOLIDAY COLUMN DATATYPE TO BIT
ALTER TABLE WalmartSale
ALTER COLUMN isholiday BIT NOT NULL;

--PART II: Visualization by Power BI

SELECT * FROM Walmartsale;


