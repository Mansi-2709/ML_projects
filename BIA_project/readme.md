# About this project 

In this specific dataset the fraudulent behavior of the agents aims to profit by taking control of customers accounts and try to empty the funds by transferring to another account and then cashing out of the system.  We need to find these fraudulent behaviour and stop it. This fraud detection system has following usage : <br>  
Protecting Consumers : <br>
	Preventing Unauthorized transaction<br>
	Detecting account takeovers<br>

Protecting Financial Institutions:<br>
	Reducing financial losses <br>
	Improving customer experience <br>

Protecting Businesses : <br>
	Reducing chargebacks <br>
	Protecting brand reputation <br>
	Enhancing customer loyalty <br>

## About Dataset

This data has following columns : <br>
step - maps a unit of time in the real world. In this case 1 step is 1 hour of time.<br>


type - CASH-IN, CASH-OUT, DEBIT, PAYMENT and TRANSFER.<br>

amount - amount of the transaction in local currency.<br>

nameOrig - customer who started the transaction<br>

oldbalanceOrg - initial balance before the transaction<br>

newbalanceOrig - new balance after the transaction.<br>

nameDest - customer who is the recipient of the transaction<br>

oldbalanceDest - initial balance recipient before the transaction. Note that there is not information for customers that start with M (Merchants).<br>

newbalanceDest - new balance recipient after the transaction. Note that there is not information for customers that start with M (Merchants).<br>

isFraud - This is the transactions made by the fraudulent agents inside the simulation. In this specific dataset the fraudulent behavior of the agents aims to profit by taking control or customers accounts and try to empty the funds by transferring to another account and then cashing out of the system.<br>

## What I did in this project:

Exploratory Data Analysis :
- We visualize different parameters given in our data like newbalanceOrig,  oldbalanceOrg, newbalanceDest, oldbalanceDest and find that all are right skewed .All these parameters need to be normally distributed especially if we are using Logistic Regression Algorithm.
- We do not see any missing or NULL values in any of the given parameters.
- We also found that the target variable isFraud  is  very imbalanced, this information will be useful while selecting and implementing ML models.
- We make a correlation heatmap where we can see that ‘step’ and ‘amount’ and highly correlated to target variable.

Feature Engineering : 
- amount, oldbalanceOrg, newbalanceOrig, oldbalanceDest, newbalanceDest are not normally distributed so we convert these variable into normally distributed data using a concept called boxcox and square root methods.
- We also know that our target variable is highly imbalanced so in order to treat imbalanced data for Logistic Regression we use SMOTETomek method.
- Similarily for Decision tree there is a parameter class_weight in the algorithm and for XGBoost there is a parameter scale_pos_weight in the algorithm to deal with imbalanced dataset.
- There is a categorical variable ‘type’ in the dataset, we use LabelEncoder to encode this categorical data .

Model Implementation and Evaluation :
- We use GridSearchCV  to implement different models and compare based on accuracy score and confusion matrix.
- In this problem statement we want that False negative should be low or Recall must be high which means that fraudulent transactions(1) should not be classified as non fraudulent transactions(0).
- I will recommend that XGBoost Classifier should be used in this problem as it will reduce false negatives and will predict most of the fraudulent behaviour.
