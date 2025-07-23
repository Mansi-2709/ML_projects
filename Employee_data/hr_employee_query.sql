USE employees;

Select * from employees..employee_data

SELECT 
	COLUMN_NAME,

    DATA_TYPE

FROM 

    INFORMATION_SCHEMA.COLUMNS

WHERE 

    TABLE_NAME = 'employee_data';

ALTER TABLE employee_data ALTER COLUMN StartDate date;
ALTER TABLE employee_data ALTER COLUMN ExitDate date;

-----Which departments have the highest employee turnover(number of employee who have exited in a year)? -----
SELECT DepartmentType, YEAR(ExitDate) AS exit_year, count(*) as employee_turnover
FROM employee_data WHERE ExitDate is not null group by DepartmentType, Year(ExitDate) order by employee_turnover desc;

--------- Are there performance trends by employee type (e.g., Full-time vs Contract)? ------------
Select EmployeeType, count(*) as employee_exit from employee_data where ExitDate is not null group by EmployeeType;---Number of employees exited by employee type

Select EmployeeType, [Current Employee Rating], count(*) as rate_count from employee_data where ExitDate is not null group by EmployeeType, [Current Employee Rating]
order by [Current Employee Rating] desc, rate_count desc;-------number of employee having different Employee ratings by employee type 

-------**What are the common termination reasons by job function or department?**------------
Select DepartmentType, TerminationType, count(*) as exit_number from employee_data where TerminationType <> 'Unk' group by DepartmentType, TerminationType order by exit_number desc;---number of employee for each Termination reason by department

Select JobFunctionDescription, TerminationType, count(*) as exit_number from employee_data where TerminationType <> 'Unk' group by JobFunctionDescription, TerminationType order by exit_number desc;----number of employee for each Termination reason by job description

---------------**What are employee rating trend by department?**-----
Select [Current Employee Rating], DepartmentType, count(*) as num_rating from employee_data group by DepartmentType, [Current Employee Rating] order by num_rating;

-------------**Do high-performing employees tend to stay longer in the company(average tenure and number of employee exited)?**--------------
with high_avg as (Select [Current Employee Rating], FirstName, LastName, datediff(day, StartDate, ExitDate) as tenure from employee_data where [Current Employee Rating] in(5,4) and ExitDate is not NULL),
low_avg as (Select [Current Employee Rating], FirstName, LastName, datediff(day, StartDate, ExitDate) as tenure from employee_data where [Current Employee Rating] in(3,2,1) and ExitDate is not NULL)
(Select [Current Employee Rating], AVG(tenure) as avg_tenure from high_avg group by [Current Employee Rating]) UNION (Select [Current Employee Rating], AVG(tenure) as avg_tenure from low_avg group by [Current Employee Rating]);

with employee_tenure as (Select [Current Employee Rating], FirstName, LastName, datediff(day, StartDate, ExitDate) as tenure from employee_data where ExitDate is not NULL)
(Select [Current Employee Rating], AVG(tenure) as avg_tenure, COUNT(*) as exited_employee from employee_tenure group by [Current Employee Rating]);

-----------------**Which training programs are the most attended across departments ?**------------------------
SELECT training_and_development_data.[Training Program Name], employee_data.DepartmentType, COUNT(*) as num_attended
FROM employee_data
JOIN training_and_development_data ON employee_data.EmpID=training_and_development_data.[Employee ID] group by employee_data.DepartmentType, training_and_development_data.[Training Program Name] order by num_attended desc;

---------------- **What is the total cost of training programs per business unit?**---------

with business_training_cost as (SELECT training_and_development_data.[Training Cost], employee_data.BusinessUnit FROM employee_data
JOIN training_and_development_data ON employee_data.EmpID=training_and_development_data.[Employee ID])
Select BusinessUnit, Sum([Training Cost]) as total_cost from business_training_cost group by BusinessUnit order by total_cost desc;

------- Does training frequency correlate with employee performance scores(what is score of employees who passed training )? ------
with trainings as (SELECT training_and_development_data.[Training Outcome], employee_data.[Current Employee Rating] FROM employee_data
JOIN training_and_development_data ON employee_data.EmpID=training_and_development_data.[Employee ID] Where training_and_development_data.[Training Outcome] = 'Passed')
Select *,count(*) as number_of_rating from trainings group by [Current Employee Rating], [Training Outcome];

--------**How many employees have received training but not completed or passed categorized by department?**-------------------
SELECT training_and_development_data.[Training Outcome], employee_data.DepartmentType, count(*) as trained FROM employee_data
JOIN training_and_development_data ON employee_data.EmpID=training_and_development_data.[Employee ID] Where training_and_development_data.[Training Outcome] in ('Failed', 'Incomplete') group by DepartmentType, [Training Outcome] order by trained desc;


--------------**What is the average desired salary by job title?**-----------------
Select [Job Title], cast(avg([Desired Salary]) as decimal(10,2)) as avg_desired_salary from recruitment_data group by [Job Title] order by avg_desired_salary desc;

----------**Is there a relationship between applicant education level and selection rate(applicants who were 'Offered' job what is their education level)?**---------
Select [Education Level], count([Status]) as selected from recruitment_data where [Status]='Offered' group by [Education Level];

--------------Candidates selected and not selected on basis of country and gender --------------------------------------
Select Country, Gender, COUNT(*) as selected from recruitment_data where [Status]='Offered' group by Country,Gender;

Select Country, Gender, COUNT(*) as not_selected from recruitment_data where [Status]='Rejected' group by Country,Gender;

-------**What is the number of employee with each engagement score categorized by business unit?**-------

Select S.[Engagement Score], E.[BusinessUnit], count(S.[Engagement Score]) as number_scoring from employee_data E Right join employee_engagement_survey_data S
ON E.EmpID=S.[Employee ID] group by E.BusinessUnit, S.[Engagement Score] order by E.BusinessUnit, number_scoring desc;

------**Which departments report the lowest work-life balance scores?**-----------
Select S.[Work-Life Balance Score], E.[DepartmentType], count(*) as num_lowest_score from employee_data E right join employee_engagement_survey_data S
ON E.EmpID=S.[Employee ID] where S.[Work-Life Balance Score] in (1,2) group by E.DepartmentType, S.[Work-Life Balance Score] order by num_lowest_score desc;

------------**How do satisfaction scores vary between genders?**---------------
Select S.[Satisfaction Score], E.GenderCode, count(*) as score_count from employee_data E right join employee_engagement_survey_data S
ON E.EmpID=S.[Employee ID] group by E.GenderCode, S.[Satisfaction Score] order by S.[Satisfaction Score];

------------**How do satisfaction scores vary between Performance Scores?**---------------

Select S.[Satisfaction Score], E.[Current Employee Rating], count(*) as score_count from employee_data E right join employee_engagement_survey_data S
ON E.EmpID=S.[Employee ID] group by E.[Current Employee Rating], S.[Satisfaction Score] order by E.[Current Employee Rating], S.[Satisfaction Score];

----------------**What is the trend of engagement scores over time?**---------
Select year([Survey Date])as year_survey, [Engagement Score], count(*) as num_scores from employee_engagement_survey_data group by [Engagement Score], year([Survey Date]) order by year_survey, [Engagement Score];

-----------------**Are low engagement scores linked to higher termination rates(engagement scores for people who had 'Involuntary' exit)?**---------------
Select S.[Engagement Score], count(E.ExitDate) as employee_exited from employee_data E right join employee_engagement_survey_data S
ON E.EmpID=S.[Employee ID] where E.ExitDate is not null and E.TerminationType = 'Involuntary' group by S.[Engagement Score] order by S.[Engagement Score];

-------**Do employees who participated in training report higher engagement scores?**--------

Select E.[Engagement Score], count(T.[Training Outcome]) as num_of_score from employee_engagement_survey_data E join training_and_development_data T
ON E.[Employee ID]=T.[Employee ID] group by E.[Engagement Score] order by num_of_score desc;

Select T.[Training Outcome], E.[Engagement Score], count(*) as num_of_score from employee_engagement_survey_data E join training_and_development_data T
ON E.[Employee ID]=T.[Employee ID] group by T.[Training Outcome], E.[Engagement Score] order by num_of_score desc;

----------**Are training costs justified by improvement in employee performance or retention (Training cost per Employee Rating and for each Termination reason)?**-----

Select E.[Current Employee Rating], sum(T.[Training Cost]) as train_cost from employee_data E join training_and_development_data T
ON E.[EmpID]=T.[Employee ID] group by E.[Current Employee Rating] order by train_cost;

Select E.[TerminationType], round(sum(T.[Training Cost]), 2) as cost_department from employee_data E join training_and_development_data T
ON E.[EmpID]=T.[Employee ID] group by E.[TerminationType] order by cost_department;