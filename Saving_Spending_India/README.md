# 📊 Spending Habits & Savings Dashboard

## 🔍 Project Overview

This project analyzes individual income, expenses, and savings patterns using a detailed dataset. The goal is to identify spending behavior, savings gaps, and potential areas of cost optimization across different demographics such as age, occupation, dependents, and city tiers.

The dashboard was built using Power BI and leverages **DAX measures** for deeper insights into financial efficiency and savings opportunities.

## 📂 Dataset

The dataset includes:

### Income & Demographics:

Income: Monthly income in currency units.<br>
Age: Age of the individual.<br>
Dependents: Number of dependents supported by the individual.<br>
Occupation: Type of employment or job role.<br>
City_Tier: A categorical variable representing the living area tier (e.g., Tier 1, Tier 2).<br>

### Monthly Expenses:
Categories like Rent, Loan_Repayment, Insurance, Groceries, Transport, Eating_Out, Entertainment, Utilities, Healthcare, Education, and Miscellaneous record various monthly expenses.<br>

### Financial Goals & Savings:
Desired_Savings_Percentage and Desired_Savings: Targets for monthly savings.<br>
Disposable_Income: Income remaining after all expenses are accounted for.<br>
### Potential Savings:
Includes estimates of potential savings across different spending areas such as Groceries, Transport, Eating_Out, Entertainment, Utilities, Healthcare, Education, and Miscellaneous.<br>

## 🖥️ Dashboard Features

- There is a bar chart depicting the total expenses based on age group. Using the **DAX query** added the expenses like Rent, Loan_Repayment, Insurance, Groceries, Transport, Eating_Out, Entertainment, Utilities, Healthcare, Education, and Miscellaneous and then find out the total of all expenses for each age groups.
- There is a bar chart depicting the total potential saving based on the age group. Using the **DAX query** added the potential savings in all areas i.e. Groceries, Transport, Eating_Out, Entertainment, Utilities, Healthcare, Education, and Miscellaneous and then added all the potential savings based on all age groups.
- There is a line chart showing the difference between the desired savings and the actual disposable income that different age groups have.
- There is a pie chart showing total income and the division of income into different expenses like Rent, Loan_Repayment, Insurance, Groceries, Transport, Eating_Out, Entertainment, Utilities, Healthcare, Education, and Miscellaneous.
- There are filters like city tier, occupation, number of dependants which can be used to filter the visuals.

## 🧮 Key DAX Measures

Some of the measures created:

Total Expense = Sum of all categories of expenditure<br>
Total Potential Savings = Sum of all potential savings in all categories

## 📸 Dashboard Preview

<img width="1335" height="692" alt="image" src="https://github.com/user-attachments/assets/83501c0f-e6f9-425b-9595-d150ad3ff278" />

## 🚀 How to Use

Download the .pbix file from this repo: SpendingHabit.pbix

Open it in Power BI Desktop.

Explore visuals and interact with filters for custom analysis.

## 📈 Insights Derived

- Highest expense is in the rent category for every tier of city, occupation.
- Students have lower income but high education-related expenses.
- Savings Gap highlights mismatch between desired and actual disposable savings.
- Certain households can save 15–25% more by optimizing groceries, utilities, and transport.

## 🛠️ Tools & Technologies

Power BI Desktop (Visualization & DAX)

Excel Dataset (Data Source)
