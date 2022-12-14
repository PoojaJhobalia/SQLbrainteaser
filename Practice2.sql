/* What are the performance ratings and salaries of all sales managers. Show lastname, performance, and salary for these employees.*/
SELECT LName, Perf, salary
FROM mid_Emp
INNER JOIN mid_Pos ON mid_Emp.PosID = mid_Pos.PosID
WHERE mid_Pos.Title = 'Sales Manager';

/* Return a list of all male employees whose first name begins with “J” or “B”, who were hired on or after December 9, 2000, and who earn more than $35,000. Show firstname, lastname, hiredate, positiontitle, and salary for these employees. */
SELECT FName, LName, HDate, mid_Pos.Title, Salary, Bonus, Gender
FROM mid_Emp
INNER JOIN mid_Pos ON mid_Emp.PosID = mid_Pos.PosID
WHERE Gender ='M'
    AND (Fname LIKE 'J%' OR Fname LIKE 'B%')
    AND HDate >= '2000-12-09'
    AND (Salary>35000 OR Salary+Bonus > 35000.00);
    
/* Return a list of employees who work in California, Florida, or Washington who received a performance rating other than “Fair.”  Show lastname, city and performance for these employees. */
SELECT Lname, city, perf
FROM mid_Emp
INNER JOIN mid_Loc ON mid_Emp.LocID = mid_Loc.LocID
WHERE state IN ('CA', 'FL','WA')
    AND perf != 'Fair';
    
/* Return a list of employees whose social security numbers start with 7 and who have either a fair or a good performance rating.  In addition, the results should show all employees who work in the Boston office (regardless of SSN or performance rating). Show SSN, city, and performance for these employees. Sort the results by SSN descending.*/
SELECT SSN, City, Perf
FROM mid_Emp
INNER JOIN mid_Loc ON mid_Emp.LocID = mid_Loc.LocID
WHERE SSN LIKE '7%' 
    AND Perf IN ('Fair','Good')
OR City='Boston'
ORDER BY SSN DESC;

/* Calculate the difference between the maximum possible salary (for the position) and the current actual salary for each employee who is a Sales Manager and save the answer in a new column called Difference.  Show city, maxsalary, salary, and Difference.*/
SELECT City, MaxSal, Salary, MaxSal-Salary AS Difference 
FROM mid_Pos
INNER JOIN mid_Emp ON mid_Pos.PosID = mid_Emp.PosID
INNER JOIN mid_Loc ON mid_Emp.LocID = mid_Loc.LocID
WHERE Title = 'Sales Manager'
ORDER BY City;

/* Return a list of trainees who were hired after 1999 and that earn more than $18,000 but no more than $25,000. Also show any employees who were hired before 1995 regardless of their salary.  Show lastname, hiredate, salary, and positiontitle for these employees.*/
SELECT LName, HDate, Salary, Title
FROM mid_Emp
INNER JOIN mid_Pos ON mid_Emp.PosID = mid_Pos.PosID
WHERE Title = 'Trainee' 
    AND Hdate >= '2000'
    AND Salary BETWEEN 18000 AND 25000
OR HDate< '1995';


SELECT State, SUM(Salary) AS TotalSalary
FROM mid_Emp
INNER JOIN mid_Loc ON mid_Emp.LocID = mid_Loc.LocID
GROUP BY State;


SELECT Title, State , perf, Gender
FROM mid_Pos
INNER JOIN mid_Emp ON mid_Pos.PosID = mid_Emp.PosID
INNER JOIN mid_Loc ON mid_Emp.LocID = mid_Loc.LocID
WHERE Bonus is NULL;
