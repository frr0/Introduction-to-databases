-- 1.A

SELECT JUDGE.SSN, JUDGE.NAME, JUDGE.SURNAME, LOWSUIT.CODLOWSUIT FROM JUDGE J, LAWSUIT L
WHERE STARTDATE >= TO_DATE ( ' 01/01/2020 ' , ' DD / MM / YYYY ') 
AND ENDDATE < TO_DATE ( ' 01/01/2021 ' , ' DD / MM / YYYY ') 
AND J.SSN NOT IN (
  SELECT L.SSN FROM LAWSUIT L
  WHERE LAWSUITTYPE='DEFAMATION';
);

---------------------------------------------------
-- 1.B

SELECT LAWSUIT.CODLAWSUIT, COURT-HEARING.DATE FROM COURT-HEARING CH, LAWSUIT L
WHERE L.CODLAWSIUT = COURT-HEARING.CODLAWSIUT IN (
  SELECT L.CODCOURT FROM L
  GROUP BY L.CODLAWSUIT
  HAVING COUNT (DISTINCT L.CODLAWSUIT) > 3;
);

---------------------------------------------------
-- 1.C

SELECT JUDGE.NAME, JUDGE.SURNAME, JUDGE.BIRTHDATE FROM JUDGE J
WHERE J.SSN = LAWSUIT.SSN IN (
  SELECT LAWSUIT.CODCOURT FROM LAWSUIT L
  WHERE L.LAWSUITTYPE='DIVORCE'
  GROUP BY L.CODLAWSUIT
  HAVING COUNT (DISTINCT L.CODLAWSUIT) > 50;
);

-- =============================================================================================== --

---------------------------------------------------
-- 2.A
SELECT GYM.NAME, COUNT (DISTINCT TRAINER.SSN) AS N_TR FROM TRAINER T  
WHERE G.CITY = 'TURIN' G.CODG AND SSN IN (
  SELECT SSN
  FROM LESSON, SPECIALITY
  WHERE LESSON.CODS=SPECIALITY.CODS AND SPECIALITY.NAMES<>'YOGA'
)
GROUP BY SSN
HAVING COUNT(DISTINCT SPECIALITY.NAMES='JUDO') >= 5 

/* WHERE SSN IN (
  SELECT SSN FROM GROUP_LESSON GL, GYM G
  GROUP BY SSN
  HAVING COUNT(DISTINCT G.CODG) >= 3
);      */


/* SELECT GYM.NAME, COUNT (DISTINCT TRAINER.SSN) AS N_TR 
FROM TRAINER T  
WHERE SSN IN (
  SELECT SSN FROM GROUP_LESSON GL, GYM G
  WHERE GL.CODG = G.CODG AND G.CITY = 'TURIN'
  GROUP BY SSN
  HAVING COUNT(DISTINCT G.CODG) >= 5
);      */

---------------------------------------------------
-- 2.B
SELECT TRAINER.NAMET, TRAINER.SURNAME, GYM.CITY FROM GYM G, LESSON L
-- HERE IS FOR THE SPECIALITY: ONLY YOGA
WHERE G.CODG AND SSN NOT IN (
  SELECT SSN
  FROM LESSON L1, SPECIALITY
  WHERE LESSON.CODS=SPECIALITY.CODS AND NAMES<>'YOGA'
)
-- HERE IS TO COUNT THE HIGHEST NUMBER OF LESSONS
GROUP BY G.CODG, SSN
HAVING COUNT(*)=(
  SELECT MAX(*) FROM (
    SELECT SSN, COUNT(*) AS NUMLESS FROM LESSONS
    GROUP BY SSN
  )
)

/* SELECT DELIVERERID FROM PENALTIES
GROUP BY DELIVERERID
HAVING COUNT (*) = ( 
  SELECT MAX ( NumPenalties ) FROM ( 
    SELECT DELIVERERID , COUNT (*) AS NumPenalties FROM PENALTIES
    GROUP BY DELIVERERID 
  ) TOTMULTEDELIVERERS 
); */

/* GROUP BY g.CODg, ssn
HAVING COUNT(*)=(
  SELECT MAX(*) FROM (
    SELECT COUNT(*) FROM LEZIONE L3
    WHERE L3.CODFISCALE-L.CODFISCALE AND L3CODP3L.CODP
  )
) */
---------------------------------------------------
-- 2.C

SELECT T.NAMET, T.NURNAME, COUNT (DISTINCT L.CODS) AS N_LESS
FROM TRAINER T, LESSON L
-- TRAINER CITY
WHERE T.SSN = L.SSN AND L.COD IN (
  SELECT GYM.CODG FROM GYM
  WHERE GYM.CITY = T.CITY;
)
-- COUNT ALL GYM IN WHICH T HAS GIVEN LESSONS
GROUP BY T.SSN, T.NAMET, T.LASTNAME
HAVING COUNT (DISTINCT L.CODG) = (
  SELECT COUNT(*) FROM GYM
  WHERE GYM.CITY = T.CITY;
)
