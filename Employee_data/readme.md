# About the Project
In this project we have data of an organization's employees like their recruitment data, their ratings, their exit details, some pwersonnel details like gender, nationality, training attended by them. I used SQL to analyse the attrition rate and other useful insights like cost of training employees, relation between their ratings and reason to exit. These are some business problems which are faced by organisations while deciding : whether and how much to spend on training of employees? Which department has highest attrition rate? etc.

## About the DataSet
### Table 1 : employee_data <br>
Employee ID: Unique identifier for each employee in the organization.<br>
First Name: The first name of the employee.<br>
Last Name: The last name of the employee.<br>
Start Date: The date when the employee started working for the organization.<br>
Exit Date: The date when the employee left or exited the organization (if applicable).<br>
Title: The job title or position of the employee within the organization.<br>
Supervisor: The name of the employee's immediate supervisor or manager.<br>
Email: The email address associated with the employee's communication within the organization.<br>
Business Unit: The specific business unit or department to which the employee belongs.<br>
Employee Status: The current employment status of the employee (e.g., Active, On Leave, Terminated).<br>
Employee Type: The type of employment the employee has (e.g., Full-time, Part-time, Contract).<br>
Pay Zone: The pay zone or salary band to which the employee's compensation falls.<br>
Employee Classification Type: The classification type of the employee (e.g., Exempt, Non-exempt).<br>
Termination Type: The type of termination if the employee has left the organization (e.g., Resignation, Layoff, Retirement).<br>
Termination Description: Additional details or reasons for the employee's termination (if applicable).<br>
Department Type: The broader category or type of department the employee's work is associated with.<br>
Division Description: The division or branch of the organization where the employee works.<br>
DOB (Date of Birth): The date of birth of the employee.<br>
State: The state or region where the employee is located.<br>
Job Function: A brief description of the employee's primary job function or role.<br>
Gender: A code representing the gender of the employee (e.g., M for Male, F for Female, N for Non-binary).<br>
Location: A code representing the physical location or office where the employee is based.<br>
Race (or) Ethnicity: A description of the employee's racial or ethnic background (if provided).<br>
Marital Status: The marital status of the employee (e.g., Single, Married, Divorced).<br>
Performance Score: A score indicating the employee's performance level (e.g., Excellent, Satisfactory, Needs Improvement).<br>
Current Employee Rating: The current rating or evaluation of the employee's overall performance.<br>

### Table 2: training_and_development_data<br>
Employee ID: A unique identifier for each employee who participated in the training program.<br>
Training Date: The date on which the training session took place.<br>
Training Program Name: The name or title of the training program attended by the employee.<br>
Training Type: The categorization of the training, indicating its purpose or focus (e.g., Technical, Soft Skills, Safety).<br>
Training Outcome: The observed outcome or result of the training for the employee (e.g., Completed, Partial Completion, Not Completed).<br>
Location: The physical or virtual location where the training session was conducted.<br>
Trainer: The name of the trainer or instructor who facilitated the training.<br>
Training Duration (Days): The duration of the training program in days.<br>
Training Cost: The cost associated with organizing and conducting the training program<br>

### Table 3: recruitment_data
Applicant ID: A unique identifier assigned to each applicant who has submitted their information for a job opportunity.<br>
Application Date: The date on which the applicant submitted their application for the job.<br>
First Name: The first name of the applicant.<br>
Last Name: The last name of the applicant.<br>
Gender: The gender of the applicant.<br>
Date of Birth: The birthdate of the applicant.<br>
Phone Number: The contact phone number of the applicant.<br>
Email: The email address of the applicant for communication purposes.<br>
Address: The street address where the applicant resides.<br>
City: The city where the applicant's address is located.<br>
State: The state or province where the applicant's address is situated.<br>
Zip Code: The postal or ZIP code associated with the applicant's address.<br>
Country: The country where the applicant's address is located.<br>
Education Level: The highest level of education attained by the applicant.<br>
Years of Experience: The number of years of professional experience the applicant has.<br>
Desired Salary: The salary the applicant wishes to receive for the job.<br>
Job Title: The title or designation of the job the applicant is applying for.<br>
Status: The status of the applicant's application (e.g., Submitted, Under Review, Rejected, Selected).<br>

### Table 4 : employee_engagement_survey_data
Employee ID: A unique identifier assigned to each employee who participated in the employee engagement survey.<br>
Survey Date: The date on which the engagement survey was administered to employees.<br>
Engagement Score: A calculated numerical score representing the level of employee engagement based on survey responses.<br>
Satisfaction Score: A numerical score indicating employee satisfaction with various aspects of their job and workplace.<br>
Work-Life Balance Score: A numerical score reflecting employee perceptions of the balance between work and personal life.<br>

## What I did in this project
Using SQL we have answered some important business question like :<br>
Which departments have the highest employee turnover(number of employee who have exited in a year)?<br>
Are there performance trends by employee type (e.g., Full-time vs Contract)?<br>
What are the common termination reasons by job function or department?<br>
What are employee rating trend by department?<br>
Do high-performing employees tend to stay longer in the company(average tenure and number of employee exited)?<br>
Which training programs are the most attended across departments ?<br>
What is the total cost of training programs per business unit?<br>
Does training frequency correlate with employee performance scores(what is score of employees who passed training )?<br>
How many employees have received training but not completed or passed categorized by department?<br>
What is the average desired salary by job title?<br>
Is there a relationship between applicant education level and selection rate(applicants who were 'Offered' job what is their education level)?<br>
Candidates selected and not selected on basis of country and gender<br>
What is the number of employee with each engagement score categorized by business unit?<br>
Which departments report the lowest work-life balance scores?<br>
How do satisfaction scores vary between genders?<br>
How do satisfaction scores vary between Performance Scores?<br>
What is the trend of engagement scores over time?<br>
Are low engagement scores linked to higher termination rates(engagement scores for people who had 'Involuntary' exit)?<br>
Do employees who participated in training report higher engagement scores?<br>
Are training costs justified by improvement in employee performance or retention (Training cost per Employee Rating and for each Termination reason)?<br>

Using these insights I have made a tableau dashboard :
https://public.tableau.com/app/profile/mansi.sharma3211/viz/HR_employee/Dashboard1
