# CrimeStoppers
## Team
- Kristen Maskery
- Pallavi Ojha
- Pardis Babaie

## Topic
Understanding types of crime in Toronto its frequency and trend in relation to weather conditions. 

## Reason for picking topic
To help reduce the crime rates by predicting the hot spot neighbourhoods where crime will be commited based on the forecasted weather for each day. 

Opportunity for the police force to be effectively placed in neighbourhoods based on where the model predicts crime is more likely to occur.

## Data Source
Our data source is a combination of kaggle data on historic toronto climate as well as data from Toronto police on crimes committed between 2014 to 2019. The crime data includes the type of crime, date committed, day of the week crime was committed and the neighbourhood it was committed in.

- https://www.kaggle.com/rainbowgirl/climate-data-toronto-19372018?select=Toronto_temp.csv
- https://data.torontopolice.on.ca/datasets/mci-2014-to-2019?geometry=-80.370%2C43.545%2C-78.392%2C43.893&selectedAttribute=occurrencemonth


## Questions we would like to answer
- Are there more crimes committed when the weather is warmer?
- Are there specific neighbourhoods that there is a higher crime rate depending on the weather being warmer?
- Is there a day of the week that there are more crimes committed?
- Is there a day of the week when crime severity is greater?
- Do specific weather conditions result in more severe crimes?
- Is there a specific season that more crimes are commited?
- Do the type of crimes differ depending on the weather and season?

## Communication Protocol
We created a slack group with all 4 members as well as a google docs group to track our progress. We determined all roles and provided timelines of when each role should be done with their tasks so the remaining members can complete their tasks for the week.

## Initial Model Overview
We are using a supervised learning model as we are analysing labelled data. For this model we will be using a linear regression model as we are predicting continuous variables. The regression model’s algorithm would attempt to learn patterns that exist among mean temperature, day of the week, hour of the day, season  and crime rate. We would use this model to predict the crime rate when presented with a temperature based on previously learned patterns from the dataset. 

## Description of preliminary data preprocessing 
The preliminary data preprocessing for our model consisted of numerous steps in order to ensure that unnecessary columns and data had been removed, data types were correctly assigned, and categorical variables had been encoded. 
1.	After loading the CSV into a data frame, the first approach we took to cleaning the crime dataset was identifying the columns we required for our analysis and dropping the columns that were insignificant. We then reviewed the remaining column’s data types and converted them to the appropriate data type. The dataset was then checked for NaN values, but all values were present. 
2.	In order to merge our temperature and crime dataset into a single data frame we were required to strip the date column in the crime data frame and convert it to a date time data type to inner join it on the date column. Additionally, we specified a start and end date for both datasets so that our analysis was focused upon the years we were analyzing.  
3.	Once we completed the preprocessing on the crime dataset, we then read in the temperature CSV and converted it into a data frame as well. After completing an initial analysis on the data, we resumed the same preprocessing steps we had carried out on the first dataset to prepare for the merge. 
4.	After completing these preliminary steps, we merged the two datasets together in order to better analyze the relationship between the temperature and crime rate. 
5.	Label encoding was an essential element in preparing the categorical data for the machine learning model, as it was necessary for all data to be numerical; especially when employing Scikit-Learn’s machine learning algorithm. After the data had been cleaned, the “merged” data frame columns “MCI”, “occurencedayofweek”, and “occurencemonth” were custom encoded to numerical data using a “lambda” function. The original categorical columns were then dropped so the data could be used for machine learning. Additionally, the “snow” and “rain” columns were dummy encoded using “pd.get_dummies()” to provide the same result. 

## Description of preliminary feature engineering and preliminary feature selection, including their decision-making process 
We have employed the Pearson’s Correlation Coefficient to the feature variables to test the strength of the correlation between the independent and dependent variables. After doing so, we selected our feature variables; Month, Day of Week, Hour, and Temperature in relation to the dependent variable (crime rate). We are employing our selected independent variables to predict the crime rate for the future in accordance to past data trends.  

## Description of how data was split into training and testing sets 
In our to properly validate our model it is necessary to split the feature and target sets into their respective training and testing sets, so we are able to analyze predictions. This will also aid us in determining the relationship between the two sets and test the validity of the linear regression model. Our training and testing sets are relatively small as of now and will need to be optimized further using regularization so that it is not overfitting the data. 

## Explanation of model choice, including limitations and benefits
We have chosen to use a supervised learning model as we are analysing labelled data. For this model we will be using a linear regression model as we are predicting continuous variables. The regression model’s algorithm would attempt to learn patterns that exist among mean temperature, day of the week, month, and hour of the day and crime rate. When presented with future data we would use this model to predict the crime rate when presented with these specifications based on previously learned patterns from the dataset. After completing a series of trial and error attempts with other supervised machine learning models such as the Random Forest Classifier, which after several attempts to optimize returned a low accuracy score; we chose to apply multiple linear regression models within our analysis. The current models have shown strong positive correlations however the accuracy needs to be improved upon further. A linear regression model is advantageous for our analysis as it is clearly indicates/shows the correlation between the dependent and independent variable. However, it does pose some disadvantages as to determining the correlation between a multitude of independent variables. 


