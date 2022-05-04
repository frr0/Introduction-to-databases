-- Show the name and city of residence of the deliverers who received at least one fine.

SELECT name, town FROM deliverers FROM penalties
where deliverers.delivererid = penalties.delivererid 
