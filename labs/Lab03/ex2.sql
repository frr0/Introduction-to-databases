-- Find the identification codes of the deliverers who have only delivered (or collected) parcels to (from) firms in which deliverer no. 57 has delivered or collected parcels.

SELECT DISTINCT DELIVERERID
FROM COMPANYDEL
WHERE DELIVERERID <> 57
AND DELIVERERID NOT IN (
  SELECT DELIVERERID
  FROM COMPANYDEL
  WHERE COMPANYID NOT IN (
    SELECT COMPANYID
    FROM COMPANYDEL
    WHERE DELIVERERID = 57
  )
);
