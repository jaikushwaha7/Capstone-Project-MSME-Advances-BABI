# Capstone-Project-MSME-Advances-BABI
Capstone project for final submission at Great Lakes Institute of Management

** 1.1.	Project Approach **
The work that we have completed:
•	Collected more data that was available with the bank for the individuals
•	Merged data from other sources like, demographic information, account details etc. for further deep analysis 
•	Collected the CNS score from the data available for the users
•	All the collected data was further segregated the data into Customer Master Information, Loan Profile Information and Customer Loan Transactional Data. 
•	Feature engineered new and derived attributes for the data model
•	Data Quality and preparation activities were performed like missing value treatment, imputation, data type conversions for homogeneity in the data set.
•	Performed EDA on the data to understand the data and to determine any outlier and treatment for the same
•	Narrowed our choices to Random Forest and XG boost for modeling based our analysis criteria mentioned in detail in modeling section
•	Also used PCA and SMOTE techniques to understand if the model performance can be improved.
1.2.	Achievements
•	Deep dived into various aspects of loans given by the banks to MSME sectors and the important measures that are required while giving the loan.
•	Early detection of a default in case of these kind of loans helps bank reduce their NPA and overall reducing the impact on the Indian economy.
•	Early detection by detecting if the customer will go delinquent by identifying the respective customers and effectively reducing the NPA
•	Factors while giving the loan and information to be taken from the for effective performance of a loan.
•	Better scrutiny process for the predicted default.
•	Constantly monitoring the already given loans and its health for preventing it into going to NPA. 


**2.1.	The present study has been taken up with the following scopes **

•	To understand the performance of the bank in various regions and for individual branches. 
•	To make a study to understand magnitude of impact of different schemes and specific industry sectors. 
•	To examine the causes for incidence and trends of NPAs in MSME sector for the bank.
•	To create a machine learning model which will be able to predict delinquency and default based on account parameters.

**2.2.	Business Problem and suggestion for Business Implementation **

•	Objective to make suitable suggestions for any Financial Institution based on the performance of the bank as per the predictive model.
•	As we know Government is pushing banks to disburse as many MSME loans for reviving the economy. And Banks are constantly under pressure to deliver the targets with limited number of manpower available to PSU banks as many retirements are taking place and creating a resource bubble. However, this leads to increase number of advances and which in turn increases the of loan going delinquent or defunct and banks’ ability to reduce overall NPA.
•	So as to help the business our model will help detect customers which will be having high risk of defaulting at an early stage and based on simple data provided of customer and help business target these customers from going defaulting and also, with efficient usage of man power and come up an early resolution plans for these kinds of advances.
**2.3	Data Sources **

We had received earlier is the live data with some masked fields from a bank for which we are looking to create a predictive model to predict delinquency of the customers. The data is the primary data that bank collects for its various customers for bank’s internal records. The data set has been received from various departments and we have collated it as per our analytical problem statement. We also derived a few new columns from the current data for better learning of the model. 
At the time of writing this report, we have been successful in getting more data around the details of the customer, their details, payment schedules etc. which in term will help us in accurately creating a model for delinquency in loan default. The key data sets we received till now are:
1.	Loan Account Status
2.	KYC data (masked) like mobile number, type of documents submitted as a part of KYC, employment condition etc.
3.	Customer’s financial data (liabilities and credit scores)
4.	Loan Sanction Details like asset cost, disbursement amount.
Based on the earlier data available and more data that we received, we have created a consolidated data set which will be taken as the basis of model creation for prediction the loan default.
