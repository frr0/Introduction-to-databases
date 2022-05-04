-- Find the identification codes of all deliverers that have received at least one 25 Euro fine and at least one 30 Euro fine.

select DELIVERERID
from DELIVERERS
where DELIVERERID in (
  select DELIVERERID
  from PENALTIES
  where AMOUNT > 25 
  group by DELIVERERS.DELIVERERID, DATA, NAME
  having count(*)>1
);
