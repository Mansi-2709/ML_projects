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
