-- Find the identification codes of the deliverers who have delivered (or collected) parcels
-- to (from) all of the firms in which deliverer no. 57 has delivered or collected parcels, and
-- only to (from) such firms (i.e., to/from no other firms than those visited by deliverer no.57).

SELECT DELIVERERID
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
)
GROUP BY DELIVERERID
HAVING COUNT (*) = (
  SELECT COUNT (*)
  FROM COMPANYDEL
  WHERE DELIVERERID = 57
);
