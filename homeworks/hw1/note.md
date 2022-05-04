---
title: Homework 1
author: Francesco Ranellucci s270874
date: 09-04-2022

header-includes:
---

# Exercise 1

Given the following relational schema (primary keys are underlined, optional attributes are denoted by *):

CUSTOMER (__SSN__, Name, Surname, BirthDay, ResidenceCity)  
HOLIDAY-HOME (__HID__, Name, Type, Address, City, WeekPrice)  
REVIEW (__SSN__, __HID__,__Date__, Text, Score)  

Express the following query in relational algebra:

- View the name and surname of customers who reviewed only holiday homes of "studio" type.

![Exercise 1](./image1.png){width=80%}

## Comment

The result is a list of names and surnames of the table Customers whose IDs are taken from the subtraction of IDs of those people who reviwed they studio holiday home (to assure that, REVIEW and HOLIDAY-HOME have been joined in both cases).

\newpage


# Exercise 2

Given the following relational schema (primary keys are underlined, optional attributes are denoted by *):

CUSTOMER (__UID__, Name, Surname, BirthDate)  
HOTEL (__HID__, Name, City, Region, #Stars)  
SOGGIORNO (__UID__, __HID__, __StartDate__, EndDate)  

Express the following query in relational algebra:

- View the name and city of hotels that have never hosted customers for stays of less than 3 days (difference between EndDate and StartDate).

![Exercise 2](./image2.png){width=80%}

## Comment

The result is a list of names and surnames of the table Customers whose IDs are taken from the subtraction of IDs of those people who have been in some hotels less than 3 days from everybody else.

\newpage

# Exercise 3

Given the following relational schema (primary keys are underlined, optional attributes are denoted by *):

PATIENT (__SSN__, Name, Surname, City)  
DOCTOR (__DID__, Name, Surname, Specialization)  
INTERVENTION (__SSN__, __Date__, __Typology__, Report, Priority, DID)  

Express the following query in relational algebra:

- Considering only the interventions carried out in the year 2021 on patients in the city of Turin, view
the name and surname of the doctors who have performed at least two different types of intervention,
both with low priority, to the same patient but on different dates.

![Exercise 3](./image3.png){width=80%}

## Comment

The result is a list of names and surnames of the table Doctors whose IDs are taken from the join of two join of one patient from Turin and their two interventions both with low priority in 2021.

\newpage

# Exercise 4

Given the following relational schema (primary keys are underlined, optional attributes are denoted by *):

STUDENT(__SID__, Name, Surname, Course)  
HOMEWORK_TO_SUBMIT (__CodHW__, Title, Argument, DueDate)  
SUBMITTED_HOMEWORK (__SID__, __CodHW__, SentDate)  

Express the following query in relational algebra:

- View the serial number and surname of the students who have delivered all the homework on the
topic "Relational Algebra" with a due date scheduled for April 2021.

![Exercise 4](./image4.png){width=80%}

## Comment

The result is a list of names and IDs from the table Student whose IDs are taken from the division between all the submitted homeworks in Relational Algebra with a due date scheduled for April 2021 and the join table of all the homeworks (submitted ones and to be submitted ones).

\newpage

# Exercise 5

Given the following relational schema (primary keys are underlined, optional attributes are denoted by *):

MATCH(__MID__, HomeTeam, VisitingTeam, Date, Competition)  
PLAYER(__PID__, Name, Surname, Role, Nation)  
GOAL(__MID__, __Minute__, PID)  

Express the following query in relational algebra:  

- View the surname and country of midfielders (a player’s role) who, in the year 2020, have
scored at least one goal in all competitions. Note: Consider competitions with at least one
match played in the year 2020.

![Exercise 5](./image5.png){width=80%}

## Comment

The result is a list of surnames and countries of the table Player whose IDs are taken from a join (join B): it joins a division between competition made from different matches that defines all competitions a join of Goal and Match in order to define a goal (at least a goal) in all competition in 2020. The result is previously filtered to obtaining only midfielders.

\newpage
