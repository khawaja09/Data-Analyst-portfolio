/****** Script for SelectTopNRows command from SSMS  ******/


/*** SELECT THOSE WHO GET MORE THAN AVERAGE SALARY AND HAS MORE THAN 1 CHILD***/
SELECT FirstName, BirthDate, YearlyIncome, TotalChildren
FROM [AdventureWorksDW2019].[dbo].[DimCustomer]
where YearlyIncome > (select avg(YearlyIncome) from dbo.DimCustomer)
		AND TotalChildren > 1
order by YearlyIncome

--------------------------------

/*** avg salaries of male and females***/

select gender, Avg(YearlyIncome) as AvgSalary
FROM [AdventureWorksDW2019].[dbo].[DimCustomer]
group by Gender


--------------------------------------

/*** only those males who owner more than 2 cars, 2 children and 
	 yearly income in greater than average yearly income ***/

select FirstName, YearlyIncome, NumberCarsOwned
FROM [AdventureWorksDW2019].[dbo].[DimCustomer]
where YearlyIncome < (select avg(YearlyIncome) from dbo.DimCustomer)
and NumberCarsOwned > 2
and Gender = 'M'
and TotalChildren > 2

