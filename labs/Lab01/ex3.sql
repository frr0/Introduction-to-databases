-- For each deliverer whose last name (attribute NAME) starts with the letter âBâ, show the deliverer name and the identification code.

SELECT NAME, DELIVERERID FROM DELIVERERS
WHERE NAME LIKE'B%';
