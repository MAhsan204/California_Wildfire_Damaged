SELECT TOP 3 event_location, MAX(estimated_financial_loss_million) AS Highest_Financial_Loss
FROM california_fire.dbo.[california_wildfire_damage]
GROUP BY event_location
ORDER BY Highest_Financial_Loss DESC;

SELECT cause, COUNT(*)
FROM california_fire.dbo.[california_wildfire_damage]
WHERE YEAR(date_event) >= YEAR(GETDATE()) - 10
GROUP BY cause
ORDER BY COUNT(*) DESC;

SELECT MONTH(date_event), COUNT(*)
FROM california_fire.dbo.[california_wildfire_damage]
GROUP BY MONTH(date_event)
ORDER BY COUNT(*) DESC;

SELECT cause, SUM(area_burned_acres) AS total_area_burned
FROM california_fire.dbo.[california_wildfire_damage]
GROUP BY cause
HAVING SUM(area_burned_acres) > 500000;

SELECT TOP 3 MONTH(date_event) AS Month, SUM(injuries) AS Total_Injuries
FROM california_fire.dbo.[california_wildfire_damage]
GROUP BY MONTH(date_event)
ORDER BY Total_Injuries DESC;
