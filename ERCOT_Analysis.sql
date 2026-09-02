-- 1st Query: Filters down to show the temperature and wind speed for the month of August in 2025 
/*
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
*/
-- Houston's station id is 722430

-- 2nd Query: Filering to show specific days that show possible extreme conditions 
/*
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
*/

-- 3rd Query: Summarizing data to show the diff in peak temperatures vs the average temperature for each month
/*
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
*/






