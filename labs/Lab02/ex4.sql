-- Find the identification codes of the deliverers that have serviced requests from all of the firms in table COMPANIES (N.B. A deliverer has serviced a request from a firm if he/she has delivered/collected parcels to/from the firm at least once).

SELECT DELIVERERID
FROM COMPANYDEL
GROUP BY DELIVERERID
HAVING COUNT (*) = ( SELECT COUNT (*) FROM COMPANIES );
