


SELECT EditionName, APA.AuthorCode FROM Author_Presents_Article APA, Edition_Of_Conference EOC
WHERE Conference IN (
  SELECT Conference
  FROM Editions_Of_Conference EOC1
  GROUP BY Conference
  HAVING COUNT(*) >=10
)
AND EOC.Edition=APA.Edition AND E.Conference=APA.Conference
GROUP BY APA.AuthorCode, APA.Edition, APA.Conference, EOC.EditionName
HAVING COUNT(*)=(
  SELECT MAX(TotPa)
  FROM (
    SELECT AuthorCode, Edition, Conference,
    Count(*) AS TotPa
  )
  FROM Author_Presents_Article AA
  GROUP BY AuthorCode, Edition, Conference
) AS TFA
WHERE TFA.Edition=APA.Edition AND
TFA.Conference=APA.Conference


