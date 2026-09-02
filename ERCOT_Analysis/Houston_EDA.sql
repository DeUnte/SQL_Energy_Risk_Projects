-- Data Source: https://google.com
-- Target Table: bigquery-publi-data.noaa_gsod.gsod2025

-- 1st Query: Exploratory Data Analysis (EDA) of Houston ERCOT hub weather tracking stations for the month of August in 2025 

SELECT
  stn as Station_ID, 
  mo as Month, 
  da as Day, 
  year as Year, 
  temp as Average_Temperature, 
  wdsp as Wind_Speed
FROM bigquery-public-data.noaa_gsod.gsod2025
WHERE stn = '722430' AND mo = '08'
LIMIT 30

-- Houston's station id is 722430

-- 2nd Query: Risk filtering of high impact & low probability thermal events 

SELECT 
  stn as Station_ID, 
  mo as Month, 
  da as Day, 
  year as Year, 
  min as Minimum_Temperature,
  temp as Average_Temperature
FROM bigquery-public-data.noaa_gsod.gsod2025
WHERE stn = '722430' AND min <= 40
ORDER BY min ASC
LIMIT 100

-- 3rd Query: A time series aggregation to show seasonal market trends vs the average temperature for each month

SELECT  
  mo as Month, 
  COUNT(da) as Days_Tracked, 
  ROUND(AVG(temp),1) as Monthly_Average_Temperature,
  ROUND(MAX(max),1) as Monthly_Peak_Temperature
FROM bigquery-public-data.noaa_gsod.gsod2025
WHERE stn = '722430'
GROUP BY 
  mo
ORDER BY 
  Month ASC
