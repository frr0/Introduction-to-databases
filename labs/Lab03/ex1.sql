-- Find the identification code of the deliverer who has received the highest number of fines

SELECT DELIVERERID
FROM PENALTIES
GROUP BY DELIVERERID
HAVING COUNT (*) = ( 
  SELECT MAX ( NumPenalties )
  FROM (
    SELECT DELIVERERID,
    COUNT (*) AS NumPenalties
    FROM PENALTIES
    GROUP BY DELIVERERID
  ) TOTMULTEDELIVERERS
);
