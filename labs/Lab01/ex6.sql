-- For each company reference person who has received at least one fine after 31/12/19801 , show the last name and the first name initials (attribute INITIALS). Sort the result in increasing alphabetical order with respect to the last name.

SELECT DISTINCT NAME, INITIALS FROM DELIVERERS D, PENALTIES P, COMPANIES C
WHERE D.DELIVEREEID = P.DELIVEREEID AND C.DELIVEREEID = P.DELIVEREEID AND TO_DATE('31/12/1980', 'DD/MM/YYYY') ORDERD BY NAME;
