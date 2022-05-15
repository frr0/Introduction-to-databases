DROP TABLE IMP;
DROP TABLE SUMMARY;

CREATE TABLE IMP
(EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(10),
SAL NUMBER(7,2),
PRIMARY KEY(EMPNO));


CREATE TABLE SUMMARY
(JOB VARCHAR2(10),
NUM NUMBER,
PRIMARY KEY(JOB));


INSERT INTO IMP(EMPNO, ENAME, JOB, SAL) 
VALUES(1, 'VERDI', 'SECRETARY', 800);

INSERT INTO IMP(EMPNO, ENAME, JOB, SAL) 
VALUES(2, 'ROSSI', 'BANKER', 900);

INSERT INTO IMP(EMPNO, ENAME, JOB, SAL) 
VALUES(3, 'BIANCHI', 'BANKER', 1100);


INSERT INTO SUMMARY(JOB,NUM)
VALUES('SECRETARY',1);

INSERT INTO SUMMARY(JOB,NUM)
VALUES('BANKER',2);