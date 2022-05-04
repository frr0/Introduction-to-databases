-- Find the identification codes and the names of the deliverers who have received more than one fine on the same date.

select DELIVERERID NAME
from DELIVERERS
where DELIVERERID in (
  select DELIVERERID
  from PENALTIES
);
