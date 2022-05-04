-- Find the identification codes, the names and the initials (attribute INITIALS) of the deliverers that have never been fined.

select DELIVERERID NAME INITIALS
from DELIVERERS
where DELIVERERID not in (
  select DELIVERERID
  from PENALTIES
);
