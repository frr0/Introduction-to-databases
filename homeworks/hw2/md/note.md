---
title: Homework 2
author:  Francesco Ranellucci
date: 15-05-22

header-includes:
---

# Exercise 1

JUDGE (**SSN**, Name, Surname, BirthDate)  
COURT (**CodCourt**, CourtName, City)  
COURTROOM (**CodCourt**, **CodRoom**, RoomName)  
LAWSUIT (**CodLawsuit**, LawsuitType, StartDate, EndDate, SSN)  
COURT-HEARING (**CodCourt**, **CodRoom**, **Date**, StartTime, EndTime, CodLawsuit)

## 1.a
\bigskip
\hrule

For each judge who has never presided over any defamation lawsuit (LawsuitType = 'Defamation’) in the year 2020, show SSN, surname and number of different types of lawsuits he has presided over.
\smallskip
\hrule
\bigskip

```sql
SELECT JUDGE.SSN, JUDGE.NAME, JUDGE.SURNAME, LOWSUIT.CODLOWSUIT FROM JUDGE J, LAWSUIT L
WHERE STARTDATE >= TO_DATE ( ' 01/01/2020 ' , ' DD / MM / YYYY ') 
AND ENDDATE < TO_DATE ( ' 01/01/2021 ' , ' DD / MM / YYYY ') 
AND J.SSN NOT IN (
  SELECT L.SSN FROM LAWSUIT L
  WHERE LAWSUITTYPE='DEFAMATION';
);
```


## 1.b
\bigskip
\hrule

Considering the lawsuits still pending and presided over by a judge who, overall over the course of
his career, has presided over court hearings in at least three different courts, show the code of each
lawsuit and the date of the last court hearing held for the cause.
\smallskip
\hrule
\bigskip

```sql
SELECT LAWSUIT.CODLAWSUIT, COURT-HEARING.DATE FROM COURT-HEARING CH, LAWSUIT L
WHERE L.CODLAWSIUT = COURT-HEARING.CODLAWSIUT IN (
  SELECT L.CODCOURT FROM L
  GROUP BY L.CODLAWSUIT
  HAVING COUNT (DISTINCT L.CODLAWSUIT) > 3;
);
```

## 1.c
\bigskip
\hrule

Show name, surname and birthdate of each judge who has presided over court hearings in every
court, in which (i.e. in each of which) at least 50 divorce lawsuits (LawsuitType = ‘Divorce’).
have been discussed.
\smallskip
\hrule
\bigskip

```sql
SELECT JUDGE.NAME, JUDGE.SURNAME, JUDGE.BIRTHDATE FROM JUDGE J
WHERE J.SSN = LAWSUIT.SSN IN (
  SELECT LAWSUIT.CODCOURT FROM LAWSUIT L
  WHERE L.LAWSUITTYPE='DIVORCE'
  GROUP BY L.CODLAWSUIT
  HAVING COUNT (DISTINCT L.CODLAWSUIT) > 50;
);
```

# Exercise 2

TRAINER (**SSN**, NameT, Surname, City)  
GYM (**CodG**, NameG, Address, City)  
SPECIALTY (**CodS**, NameS, Description)  
LESSON (**SSN**, **CodG**, **Date**, CodS, ParticipantsNumber)

## 2.a
\bigskip
\hrule

For each gym in Turin in which Judo lessons (NameS="Judo") have been given by at least 5
different trainers, but no yoga lessons have ever been given (NameS="Yoga"), show the name of the
gym and the number of different trainers who have given lessons (considering each specialty, not
judo only) there.
\smallskip
\hrule
\bigskip

```sql
SELECT GYM.NAME, COUNT (DISTINCT TRAINER.SSN) AS N_TR FROM TRAINER T  
WHERE G.CITY = 'TURIN' G.CODG AND SSN IN (
  SELECT SSN
  FROM LESSON, SPECIALITY
  WHERE LESSON.CODS=SPECIALITY.CODS AND SPECIALITY.NAMES<>'YOGA'
)
GROUP BY SSN
HAVING COUNT(DISTINCT SPECIALITY.NAMES='JUDO') >= 5 
```

## 2.b
\bigskip
\hrule

For each trainer who has given only Yoga lessons, show the name, the surname, and the city of the
gym where he has given the highest number of lessons.
\smallskip
\hrule
\bigskip

```sql
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
```

## 2.c
\bigskip
\hrule

For each trainer who has trained in every gym in his city of residence, show name, surname, and
number of specialties for which he has given lessons.
\smallskip
\hrule
\bigskip

```sql
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
```
