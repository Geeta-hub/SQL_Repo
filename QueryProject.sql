USE Student

CREATE TABLE studies(
PNAME varchar(50),
INSTITUTE varchar(50),
COURSE varchar(10),
COURSEFEE money)
	
INSERT INTO studies VALUES
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000)

SELECT * FROM studies

CREATE TABLE software(
PNAME VARCHAR(50),
TITLE VARCHAR(50),
DEVELOPIN VARCHAR(50),
SCOST MONEY,
DCOST MONEY,
SOLD INT)

INSERT INTO software VALUES
('MARY','README','CPP',300,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEO TITLING','PASCAL',7500,16000,9),
('JULIANA','INVENTORY','COBOL',3000,3500,0),
('KAMALA','PAYROLL PKG.','DBASE',9000,20000,0),
('MARY','FINANCIAL ACCT','ORACLE',18000,85000,4),
('PATTRICK','README','CPP',300,1200,84),
('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
('RAMESH','HOTEL MGMT','DBASE',13000,35000,4),
('RAMESH', 'DEAD LEE','PASCAL',599.95,4500,73),
('REMITHA','PC UTITIES','C',725,5000,51),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500,6000,7),
('REVATHI','HOSPITAL MGMT','PASCAL',1100,75000,2),
('VIJAYA','TSR EDITOR','C',900,700,6)


CREATE TABLE programmer(
PNAME VARCHAR(50),
DOB DATE,
DOJ DATE,
GENDER CHAR(1),
PROF1 VARCHAR(25),
PROF2 VARCHAR(25),
SALARY MONEY)

INSERT INTO programmer VALUES
('ANAND','12-APR-66','21-APR-92','M','PASCAL','BASIC',3200),
('ALTAF','02-JUN-64','13-NOV-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-JAN-60','21-APR-90','F','COBOL','DBASE',3000),
('KAMALA','30-OCT-68','02-JAN-92','F','C','DBASE',2900),
('MARY','24-JUN-70','01-FEB-91','F','CPP','ORACLE',4500),
('NELSON','11-SEP-85','11-OCT-89','M','COBOL','DBASE',2500),
('PATTRICK','10-NOV-65','21-APR-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-AUG-65','21-APR-91','M','ASSEMBLY','C',3000),
('RAMESH','03-MAY-67','28-FEB-91','M','PASCAL','DBASE',3200),
('REBECCA','01-JAN-67','01-DEC-90','F','BASIC','COBOL',2500),
('REMITHA','19-APR-70','20-APR-93','F','C','ASSEMBLY',3600),
('REVATHI','02-DEC-69','02-JAN-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-DEC-65','02-MAY-92','F','FOXPRO','C',3500)



--1.	Find out the selling cost AVG for packages developed in Pascal.
SELECT AVG(SCOST) 
FROM software
WHERE DEVELOPIN IN ('PASCAL','pascal')

--2.	Display Names, Ages of all Programmers.
SELECT PNAME, YEAR(GETDATE()) - YEAR(DOB) AS AGE
FROM programmer

--3.	Display the Names of those who have done the DAP Course.
SELECT PNAME, COURSE
FROM studies
WHERE COURSE IN ('DAP', 'dap')

--4.	Display the Names and Date of Births of all Programmers Born in January.
SELECT PNAME, DOB
FROM programmer
WHERE MONTH(DOB) = 1

--5.	What is the Highest Number of copies sold by a Package.
SELECT MAX(SOLD) AS HIGHEST_COPIES 
FROM software

--6.	Display lowest course Fee.
SELECT MIN(COURSEFEE) 
FROM studies

--7.	How many programmers done the PGDCA Course?
SELECT COUNT(PNAME)
FROM studies
WHERE COURSE IN ('PGDCA','pgdca')

--8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SCOST*SOLD) AS REVENUE
FROM software
WHERE DEVELOPIN IN ('C','c')

--9.  Display the Details of the Software Developed by Ramesh.
SELECT PNAME, TITLE, DEVELOPIN
FROM software
WHERE PNAME IN ('RAMESH','ramesh')

--10. How many Programmers Studied at Sabhari.
SELECT COUNT(PNAME)
FROM studies
WHERE INSTITUTE IN ('SABHARI','sabhari')

--11. Display details of Packages whose sales crossed the 2000 Mark.
SELECT *
FROM software
WHERE (SCOST*SOLD) >2000

--12. Display the Details of Packages for which Development Cost have been recovered.
SELECT *
FROM software
WHERE SCOST*SOLD > DCOST

--13. What is the cost of the costliest software development in Basic
SELECT MAX(DCOST)
FROM software
WHERE DEVELOPIN IN ('BASIC','basic')

--14.	How many Packages Developed in DBASE.
SELECT COUNT(TITLE)
FROM software
WHERE DEVELOPIN IN ('DBASE','dbase')

--15.	How many programmers studied in Pragathi.
SELECT COUNT(PNAME)
FROM studies
WHERE INSTITUTE IN ('PRAGATHI','pragathi')

--16.	How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT(PNAME)
FROM studies
WHERE COURSEFEE BETWEEN 5000 AND 10000

--17.	What is AVG Course Fee?
SELECT AVG(COURSEFEE)
FROM studies

--18.	Display the details of the Programmers Knowing C.
SELECT *
FROM programmer
WHERE PROF1 IN ('C','c') OR
PROF2 IN ('C','c')

--19.	How many Programmers know either COBOL or PASCAL.
SELECT COUNT(*)
FROM programmer
WHERE PROF1 IN ('COBOL','cobol','PASCAL','pascal') OR
PROF2 IN ('COBOL','cobol','PASCAL','pascal')

--20.	How many Programmers Don’t know PASCAL and C
SELECT COUNT(*)
FROM programmer
WHERE PROF1 NOT IN ('PASCAL','pascal','C','c') AND
PROF2 NOT IN ('PASCAL','pascal','C','c')

--21.	How old is the Oldest Male Programmer.
SELECT MAX(DATEDIFF(YY,DOB,GETDATE())) AS AGE
FROM programmer
WHERE GENDER IN ('M','m')

--22.	What is the AVG age of Female Programmers.
SELECT AVG(DATEDIFF(YY,DOB,GETDATE()))
FROM programmer
WHERE GENDER IN ('F','f')

--23.	Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
SELECT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS EXPERIENCE
FROM programmer
ORDER BY EXPERIENCE DESC

--24.	Who are the Programmers who celebrate their Birthday’s During the Current Month.
SELECT PNAME, DOB
FROM programmer
WHERE MONTH(DOB) = MONTH(GETDATE())

--25.	How many Female Programmers Are There.
SELECT COUNT(PNAME)
FROM programmer
WHERE GENDER IN ('F','f')

--26.	What are the Languages studied by Male Programmers.
SELECT DISTINCT PROF2 AS LANGUAGES
FROM programmer
WHERE GENDER IN ('M','m')
UNION
SELECT DISTINCT PROF2
FROM programmer
WHERE GENDER IN ('M','m')

--27.	What is the AVG Salary.
SELECT ROUND(AVG(SALARY),2) AS AVG_SAL
FROM programmer

--28.	How many people draw salary 2000 to 4000.
SELECT COUNT(*)
FROM programmer
WHERE SALARY BETWEEN 2000 AND 4000

--29.	Display the details of those who don’t know Clipper, COBOL or PASCAL.
SELECT *
FROM programmer
WHERE PROF1 NOT IN('CLIPPER','clipper','COBOL','cobol','PASCAL','pascal') AND
PROF2 NOT IN('CLIPPER','clipper','COBOL','cobol','PASCAL','pascal')

--30.	Display the Cost of Package Developed By each Programmer.
SELECT PNAME, DCOST, SCOST
FROM software

--31.	Display the sales values of the Packages Developed by the each Programmer.
SELECT PNAME, TITLE, SCOST
FROM software

--32.	Display the Number of Packages sold by Each Programmer.
SELECT PNAME,COUNT(SOLD) AS NO_PACKAGES
FROM software
GROUP BY PNAME

--33.	Display the sales cost of the packages Developed by each Programmer Language wise.
SELECT PNAME, DEVELOPIN, SUM(SCOST) AS COST_PACKAGES
FROM software
GROUP BY PNAME, DEVELOPIN

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price Per Copy
SELECT DEVELOPIN AS LANGUAGE, AVG(DCOST) AS AVG_DCOST, AVG(SCOST) AS AVG_SCOST, AVG(SOLD) AS AVG_PRICE_COPY
FROM software
GROUP BY DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
SELECT PNAME, MAX(DCOST) AS COSTLIEST_PCK, MIN(DCOST) AS CHEAPEST_PCK
FROM software
GROUP BY PNAME

--36.	Display each institute name with number of Courses, Average Cost Per Course.
SELECT INSTITUTE, COUNT(COURSE) AS COURSES, AVG(COURSEFEE) AVG_PER_COURSE
FROM studies
GROUP BY INSTITUTE

--37.	Display each institute Name with Number of Students.
SELECT INSTITUTE, COUNT(PNAME) AS NO_STUDENTS
FROM studies
GROUP BY INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also.
SELECT PNAME, GENDER 
FROM programmer

--39. Display the Name of Programmers and Their Packages
SELECT PNAME, SALARY*12 AS SAL_PACKAGE
FROM programmer

--40. Display the Number of Packages in Each Language Except C and C++.
SELECT DEVELOPIN, COUNT(TITLE) AS NO_PKG
FROM software
GROUP BY DEVELOPIN
HAVING DEVELOPIN NOT IN ('C','c','C++','c++')


--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT DEVELOPIN, COUNT(TITLE) AS NO_PKG
FROM software
WHERE DCOST < 1000
GROUP BY DEVELOPIN

--42. Display AVG Difference between SCOST, DCOST for Each Package
SELECT TITLE, ABS(AVG(SCOST) - AVG(DCOST)) AS DIFF_SCOST_DCOST
FROM software
GROUP BY TITLE

--43. Display the total SCOST, DCOST and amount to be recovered for each Programmer for 
--Those Whose Cost has not yet been Recovered.
SELECT SUM(SCOST) TOTAL_SCOST, SUM(DCOST) AS TOTAL_DCOST, ABS(SUM(SCOST)-SUM(DCOST)) AS AMT_TOBE_RECOVERED
FROM software
GROUP BY PNAME

--44.	Display Highest, Lowest and Average Salaries for those earning more than 2000.
SELECT MAX(SALARY) AS HIGHEST_SAL, MIN(SALARY) AS LOWEST_SAL, AVG(SALARY) AS AVG_SAL
FROM programmer
WHERE SALARY >2000

--45.	Who is the Highest Paid C Programmers.
SELECT PNAME, SALARY
FROM programmer
WHERE SALARY IN(
SELECT MAX(SALARY)
FROM programmer
WHERE (PROF1 IN ('C','c') OR
PROF2 IN ('C','c'))) 

--46.	Who is the Highest Paid Female COBOL Programmer.
SELECT *
FROM programmer
WHERE GENDER IN ('F','f') AND
SALARY IN(
SELECT MAX(SALARY) FROM programmer
WHERE (PROF1 IN ('COBOL','cobol') OR
PROF2 IN ('COBOL','cobol')) AND
GENDER IN ('F','f'))

--47.	Display the names of the highest paid programmers for each Language.
SELECT PROF1,MAX(SALARY)
FROM programmer
GROUP BY PROF1
UNION
SELECT PROF2, MAX(SALARY)
FROM programmer
GROUP BY PROF2


--48.	Who is the least experienced Programmer.
SELECT PNAME, DOJ
FROM programmer
WHERE DOJ IN (SELECT MAX(DOJ) FROM programmer)

-- 49.	Who is the most experienced male programmer knowing PASCAL.

SELECT TOP(1) PNAME,MIN(DATEDIFF(YY,DOJ,GETDATE())) AS EXPERIENCE, DOJ
FROM programmer 
WHERE GENDER = 'M' AND
(PROF1 IN ('PASCAL','pascal') or PROF2 IN ('PASCAL','pascal') )
GROUP BY  PNAME, DOJ


--50.	Which Language is known by only one Programmer.

SELECT PROF1, COUNT(PROF1) AS NO_PEOPLE
FROM programmer
WHERE PROF1 NOT IN (SELECT PROF2 FROM programmer)
GROUP BY PROF1
HAVING COUNT(PROF1) = 1
UNION
SELECT PROF2, COUNT(PROF2) AS NO_PEOPLE
FROM programmer
WHERE PROF2 NOT IN (SELECT PROF1 FROM programmer)
GROUP BY PROF2
HAVING COUNT(PROF2) = 1

--51. Who is the Above Programmer Referred in 50

SELECT PNAME FROM PROGRAMMER
WHERE PROF1 IN((SELECT PROF1 FROM programmer
		GROUP BY PROF1 HAVING COUNT(PROF1) <= 1
EXCEPT
	SELECT PROF2 FROM programmer 
	GROUP BY PROF2 HAVING COUNT(PROF2) <=1)
EXCEPT
	SELECT PROF2 FROM programmer)
UNION
SELECT PNAME FROM PROGRAMMER
WHERE PROF2 IN((SELECT PROF2 FROM programmer
		GROUP BY PROF2 HAVING COUNT(PROF2) <= 1
EXCEPT
	SELECT PROF1 FROM programmer 
	GROUP BY PROF1 HAVING COUNT(PROF1) <=1)
EXCEPT
	SELECT PROF1 FROM programmer)

--52.	Who is the Youngest Programmer knowing DBASE.
SELECT PNAME , DOB
FROM programmer
WHERE (PROF1 IN ('DBASE','dbase') OR
PROF2 IN ('DBASE','dbase')) AND
DOB IN (SELECT MAX(DOB) FROM programmer)

--53.	Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE.
SELECT PNAME, PROF1, PROF2, SALARY
FROM programmer
WHERE GENDER IN ('F','f') AND
(PROF1 IN ('C','C++','ORACLE','DBASE') OR
PROF1 IN ('C','C++','ORACLE','DBASE')) AND
SALARY > 3000

--54. Which Institute has most number of Students.
SELECT TOP 1 INSTITUTE, COUNT(PNAME) AS NO_STU
FROM studies
GROUP BY INSTITUTE
ORDER BY NO_STU DESC

--55.	What is the Costliest course.
SELECT COURSE, COURSEFEE
FROM studies
WHERE COURSEFEE = 
(SELECT MAX(COURSEFEE) FROM studies)

--56.  Which course has been done by the most of the Students.
SELECT TOP 2 COUNT(PNAME) AS NO_STUDENTS, COURSE
FROM studies
GROUP BY COURSE
ORDER BY NO_STUDENTS DESC

--57.	Which Institute conducts costliest course.
SELECT INSTITUTE, COURSEFEE
FROM studies
WHERE COURSEFEE = 
(SELECT MAX(COURSEFEE) FROM studies)

--58.	Display the name of the Institute and Course, which has below AVG course fee.
SELECT INSTITUTE, COURSE, COURSEFEE
FROM studies
WHERE COURSEFEE < 
(SELECT AVG(COURSEFEE) FROM studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee.
SELECT COURSE
FROM studies
GROUP BY COURSE
HAVING AVG(COURSEFEE) < 1000 OR
AVG(COURSEFEE) >1000

--60.	Which package has the Highest Development cost.
SELECT TITLE
FROM software
WHERE DCOST =
(SELECT MAX(DCOST) FROM software)

--61.  Which course has below AVG number of Students.

SELECT COURSE,COUNT(Course) AS STUDENTS_COUNT
FROM STUDIES 
GROUP BY COURSE 
HAVING COUNT(COURSE) < =
(SELECT SUM(C)/COUNT(C) FROM
(SELECT COUNT(COURSE) AS C from studies GROUP BY COURSE) AS MYTABLE)

--62.	Which Package has the lowest selling cost.
SELECT DISTINCT TITLE
FROM software
WHERE SCOST =
(SELECT MIN(SCOST) FROM software)

--63. Who Developed the Package that has sold the least number of copies.
SELECT PNAME, TITLE
FROM software
WHERE SOLD = 
(SELECT MIN(SOLD) FROM software)

--64.	Which language has used to develop the package, which has the highest sales amount.
SELECT DISTINCT DEVELOPIN, TITLE, SOLD
FROM software
WHERE SOLD =
(SELECT MAX(SOLD) FROM software)

--65.How many copies of package that has the least difference between development and selling cost where sold.
SELECT TITLE, SOLD
FROM software
WHERE ABS(DCOST-SCOST) =
(SELECT MIN(ABS(DCOST-SCOST)) FROM software)

--66.	Which is the costliest package developed in PASCAL.
SELECT TITLE, DEVELOPIN
FROM software
WHERE  
DCOST = (SELECT MAX(DCOST) FROM software WHERE DEVELOPIN IN ('PASCAL','pascal'))

--67. Which language was used to develop the most number of Packages.
SELECT DISTINCT DEVELOPIN
FROM software
WHERE SOLD = (SELECT MAX(SOLD) FROM software)

--68.	Which programmer has developed the highest number of Packages.
SELECT TOP 1 PNAME
FROM software
WHERE SOLD =
(SELECT MAX(SOLD) FROM software)

--69.	Who is the Author of the Costliest Package.
SELECT PNAME
FROM software
WHERE SCOST = 
(SELECT MAX(SCOST) FROM software)

--70.	Display the names of the packages, which have sold less than the AVG number of copies.
SELECT TITLE, SOLD
FROM software
WHERE SOLD < 
(SELECT AVG(SOLD) FROM software)

--71.Who are the authors of the Packages, which have recovered more than double the Development cost.
SELECT PNAME, TITLE, DCOST
FROM software
WHERE ((DCOST-SCOST)*SOLD) > 2*DCOST

--72. Display the programmer Name and the cheapest packages developed by them in each language.
SELECT PNAME,DEVELOPIN, MIN(DCOST)
FROM software
GROUP BY PNAME,DEVELOPIN

--73.	Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT PNAME, DEVELOPIN, MAX(SCOST) AS MAX_SCOST, MIN(SCOST) AS MIN_SCOST
FROM software
GROUP BY PNAME,DEVELOPIN

--74.	Who is the youngest male Programmer born in 1965.
SELECT TOP 1 PNAME, DOB
FROM programmer
WHERE GENDER IN ('M','m') AND
YEAR(DOB) = 1965
ORDER BY YEAR(DOB)

--75.	Who is the oldest Female Programmer who joined in 1992.
SELECT TOP 1 PNAME, DOJ,YEAR(DOB) AS DOB
FROM programmer
WHERE GENDER IN ('F','f') AND
YEAR(DOJ) = 1992 
ORDER BY DOB DESC

--76.	In which year was the most number of Programmers born.
SELECT TOP 1 YEAR(DOB), COUNT(*) AS MAX_COUNT
FROM programmer
GROUP BY YEAR(DOB)
ORDER BY MAX_COUNT DESC

--77.	In which month did most number of programmers join.
SELECT TOP 1 DATENAME(MONTH,DOJ), COUNT(*) AS MOST_JOIN
FROM programmer
GROUP BY DATENAME(MONTH,DOJ)
ORDER BY MOST_JOIN DESC


--78.	In which language are most of the programmers proficient.
SELECT DISTINCT PROF1 FROM programmer WHERE PROF1 = (SELECT MAX(PROF1) FROM programmer)
UNION
SELECT DISTINCT PROF2 FROM programmer WHERE PROF2 = (SELECT MAX(PROF2) FROM programmer)

--79.	Who are the male programmers earning below the AVG salary of Female Programmers.
SELECT PNAME, SALARY
FROM programmer
WHERE GENDER IN ('M','m') AND SALARY <
(SELECT AVG(SALARY) FROM programmer WHERE GENDER IN ('F','f'))

--80.	Who are the Female Programmers earning more than the Highest Paid.
SELECT *
FROM programmer
WHERE GENDER IN ('F','f') AND SALARY >
(SELECT MAX(SALARY) FROM programmer)

--81.	Which language has been stated as the prof by most of the Programmers.

WITH RESULT AS(
SELECT PROF1 AS LANGUAGE, COUNT(PNAME) AS COUNT_PROGRAMMERS
FROM programmer
GROUP BY PROF1
UNION
SELECT PROF2 , COUNT(PNAME)
FROM programmer
GROUP BY PROF2)
SELECT LANGUAGE, MAX(COUNT_PROGRAMMERS) AS COUNT_PROGRAMMERS
FROM RESULT
WHERE COUNT_PROGRAMMERS = (SELECT MAX(COUNT_PROGRAMMERS) FROM RESULT)
GROUP BY LANGUAGE
ORDER BY COUNT_PROGRAMMERS DESC

--82.	Display the details of those who are drawing the same salary.
SELECT P1.*
FROM programmer P1
INNER JOIN programmer P2
ON P1.SALARY = P2.SALARY

--83.	Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
SELECT P.PNAME, S.TITLE, S.DEVELOPIN, P.SALARY
FROM programmer P
INNER JOIN software S
ON P.PNAME = S.PNAME
WHERE P.GENDER IN ('M','m') AND
P.SALARY > 3000

--84.	Display the details of the packages developed in Pascal by the Female Programmers
SELECT S.*
FROM software S
INNER JOIN programmer P
ON S.PNAME = P.PNAME
WHERE P.GENDER IN ('F','f') AND
S.DEVELOPIN IN ('PASCAL','pascal')

--85. Display the details of the Programmers who joined before 1990.
SELECT * FROM programmer
WHERE YEAR(DOJ) < 1990

--86.	Display the details of the Software Developed in C By female programmers of Pragathi.
SELECT S.*
FROM software S
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
INNER JOIN programmer P
ON S.PNAME = P.PNAME
WHERE S.DEVELOPIN = 'C' AND P.GENDER = 'F' AND
ST.INSTITUTE = 'PRAGATHI'

--87.	Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
SELECT ST.INSTITUTE ,COUNT(TITLE) AS TOT_PACKG, SUM(SOLD) AS TOT_SOLD, SUM(SCOST) as TOT_SAL_VAL
FROM software S
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
GROUP BY ST.INSTITUTE

--88.	Display the details of the software developed in DBASE by Male Programmers, 
--who belong to the institute in which most number of Programmers studied.
SELECT S.*, ST.INSTITUTE
FROM software S
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
INNER JOIN programmer P
ON S.PNAME = P.PNAME
WHERE S.DEVELOPIN IN ('DBASE','dbase') AND
P.GENDER IN ('M','m') AND
ST.INSTITUTE IN (SELECT TOP 1 INSTITUTE FROM studies
GROUP BY INSTITUTE
ORDER BY COUNT(PNAME) DESC)

--89.	Display the details of the software Developed by the male programmers Born before 1965 
--and female programmers born after 1975.

SELECT S.*
FROM software S
INNER JOIN programmer P
ON S.PNAME = P.PNAME
WHERE (P.GENDER = 'M' AND YEAR(P.DOB) < 1965) OR
(P.GENDER = 'F' AND YEAR(P.DOB) > 1975)

--90.	Display the details of the software that has developed in the language which is neither the first 
--nor the second proficiency of the programmers.
SELECT S.*
FROM software S
INNER JOIN programmer P
ON S.PNAME = P.PNAME
WHERE S.DEVELOPIN != P.PROF1 AND
S.DEVELOPIN != P.PROF2

--91.	Display the details of the software developed by the male students of sabhari.
SELECT S.*
FROM software S
INNER JOIN programmer P
ON S.PNAME = P.PNAME
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
WHERE P.GENDER = 'M' AND
ST.INSTITUTE = 'SABHARI'

--92.	Display the names of the programmers who have not developed any packages.
SELECT * FROM 
programmer 
WHERE PNAME NOT IN (SELECT PNAME FROM software)

--93.	What is the total cost of the Software developed by the programmers of Apple.
SELECT SUM(DCOST) AS TOTAL_DEV_COST
FROM software S
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
WHERE ST.INSTITUTE  = 'APPLE'

--94.	Who are the programmers who joined on the same day.
SELECT P1.PNAME, P1.DOJ
FROM programmer P1
INNER JOIN programmer P2
ON P1.DOJ = P2.DOJ
WHERE P1.PNAME != P2.PNAME

--95.	Who are the programmers who have the same Prof2.
SELECT P1.PNAME, P1.PROF2
FROM programmer P1
INNER JOIN programmer P2
ON P1.PROF2 = P2.PROF2
WHERE P1.PNAME != P2.PNAME

--96.	Display the total sales value of the software, institute wise.
SELECT ST.INSTITUTE, SUM(S.SCOST)
FROM software S
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
GROUP BY ST.INSTITUTE

--97. In which institute does the person who developed the costliest package studied.
SELECT ST.INSTITUTE, ST.PNAME
FROM studies ST
INNER JOIN software S
ON ST.PNAME = S.PNAME
WHERE S.DCOST IN (SELECT MAX(DCOST) FROM software)

----98.	Which language listed in prof1,prof2 has not been used to develop any package.
SELECT PROF1 AS LANGUAGE
FROM programmer
WHERE PROF1 NOT IN (SELECT DEVELOPIN FROM software)

UNION

SELECT PROF2 
FROM programmer
WHERE PROF2 NOT IN (SELECT DEVELOPIN FROM software)

--99.How much does the person who developed the highest selling package earn and what course did 
SELECT P.PNAME, P.SALARY, T.COURSE
FROM programmer P
INNER JOIN software S
ON P.PNAME = S.PNAME
INNER JOIN studies T
ON P.PNAME = T.PNAME
WHERE S.SCOST IN (SELECT MAX(SCOST) FROM software)

--100.How many months will it take for each programmer to recover the cost of the Course underwent

SELECT P.PNAME, P.SALARY, S.COURSEFEE, CEILING(S.COURSEFEE/P.SALARY) AS MONTHS_TO_RECOVER
FROM programmer P
INNER JOIN STUDIES S
ON P.PNAME = S.PNAME

--101.  Which is the costliest package by a person with under 3 year’s experience.
SELECT P.PNAME, S.TITLE, S.SCOST, S.SOLD
FROM programmer P
INNER JOIN software S
ON P.PNAME = S.PNAME
WHERE (YEAR(GETDATE()) - YEAR(P.DOJ)) <= 3

--102.	What is the AVG salary for those Whose software sales is more than 50,000/-.

SELECT AVG(P.SALARY)
FROM programmer P
INNER JOIN software S
ON P.PNAME = S.PNAME
WHERE S.SCOST*S.SOLD > 50000

--103 How many packages were developed by students, who studied in institute that charge the lowest course fee.
SELECT S.PNAME, S.TITLE, S.DEVELOPIN, ST.INSTITUTE, ST.COURSEFEE
FROM software S
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
WHERE ST.INSTITUTE IN (SELECT DISTINCT INSTITUTE FROM studies WHERE COURSEFEE IN
(SELECT MIN(COURSEFEE) FROM studies))


--104 How many packages were developed by the person who developed the cheapest package, where did HE/SHE studied

SELECT S.PNAME,S.SOLD, ST.INSTITUTE
FROM software S
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
WHERE S.DCOST = (SELECT MIN(DCOST) FROM software)
 
--105 How many packages were developed by the female programmers earning more then the highest paid male programmer.

SELECT S.*
FROM SOFTWARE S
INNER JOIN programmer P
ON S.PNAME = P.PNAME
WHERE (P.GENDER = 'F') AND P.SALARY >
(SELECT MAX(SALARY) FROM programmer WHERE GENDER = 'M')

--106 How many packages are developed by the most experienced programmer form BDPS.

SELECT TOP 1 S.*
FROM software S
INNER JOIN programmer P
ON S.PNAME = P.PNAME
INNER JOIN studies ST
ON S.PNAME = ST.PNAME
WHERE 
ST.INSTITUTE = 'BDPS'
ORDER BY P.DOJ 

---107.	List the programmers (form the software table) and the institutes they studied.

SELECT DISTINCT F.PNAME, S.INSTITUTE
FROM software F
INNER JOIN studies S
ON F.PNAME = S.PNAME

--108 List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF

SELECT P.PROF1 AS PROFICIENCY, COUNT(P.PNAME) AS NO_PROGRAMMER, COUNT(S.TITLE) AS NO_PACKAGES
FROM programmer P
INNER JOIN software S
ON P.PNAME = S.PNAME
GROUP BY P.PROF1
UNION ALL
SELECT P.PROF2, COUNT(P.PNAME) AS NO_PROGRAMMER, COUNT(S.TITLE) AS NO_PACKAGES
FROM programmer P
INNER JOIN software S
ON P.PNAME = S.PNAME
GROUP BY P.PROF2

---109.	List the programmer names (from the programmer table) and No. Of Packages each has developed.

SELECT P.PNAME, SUM(S.SOLD) AS SUM_PKGS
FROM programmer P
INNER JOIN software S
ON P.PNAME = S.PNAME
GROUP BY P.PNAME
ORDER BY SUM_PKGS DESC













