-- Show the identification codes of all the companies for which deliverers either delivered or collected goods.

SELECT COMPANYID FROM COMPANYDEL 
WHERE NUMDELIVERIES>'0' OR NUMCOLLECTIONS>'0' 
