-- For each deliverer whose office phone number (attribute PHONENO) is either different from 8467 or not available, show the deliverer name, sex, and identification code.

SELECT NAME, SEX, DELIVERERID FROM DELIVERERS
WHERE PHONENO <>8467 OR PHONENO IS NULL; 
