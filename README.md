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

## Dashboard Storyboard

https://docs.google.com/presentation/d/1FjpHXtvSTRh-uv7jScuLLWrMpOjGrnL5sB1zoBllqWE/edit?usp=sharing

## Presentation

https://docs.google.com/presentation/d/1zLzvrDiQx6aZgdC_BsC0Moup6iyBiugirlrQXmXXr2M/edit?usp=sharing

# Preprocessing: 
The preliminary data preprocessing for our model consisted of many steps to ensure that unnecessary columns and data had been removed, data types were properly formatted, and categorical variables had been encoded. 
1.	Using python, we imported and cleaned the crime rate and temperature data before submitting it to the AWS server and SQL database. We approached the crime data first, in doing so we identified the columns required for our analysis and dropped the columns that were insignificant. Next, the remaining columns were converted to their appropriate data types and the start and end date were specified I accordance to our analysis. The same process was repeated for the temperature dataset. 
2.	After the data had been preprocessed the data frames were exported as CSV’s to be uploaded into the SQL database. In SQL, a left join was performed to merge the two data frames on the date column. Using “sqlalchemy” a connection string and engine were created to connect the database and the merged table to our code. 
3.	Subsequently, the merged table was converted to a data frame and was checked for missing and/or repeated values. To further prepare the data for the machine learning model we employed label encoding to convert the categorical data to numerical data. 
4.	After the data had been cleaned, the “merged” data frame columns “MCI”, “occurencedayofweek”, and “occurencemonth” were custom encoded to numerical data using a “lambda” function. The original categorical columns were then dropped so the data could be used for machine learning. Additionally, the “snow” and “rain” columns were dummy encoded using “pd.get_dummies()” to provide the same result. 

# Feature Engineering and Preliminary Feature Selection:
Once the final data frame had been completed, we verified the relationships between our independent and dependent values using plotly to visualize and the Pearson’s Correlation Coefficient to determine the strength of the correlation. After doing so, we selected our feature variables; Month, Day of Week, Hour, and Temperature in relation to the dependent variable (crime rate). We are employing our selected independent variables to predict the crime rate for the future in accordance to past data trends.  

# Training and Testing Sets: 
In our to properly validate our model it is necessary to split the feature and target sets into their respective training and testing sets, so we are able to analyze predictions. This will also aid us in determining the relationship between the two sets and test the validity of the linear regression model. Our training and testing sets are relatively small as of now and will need to be optimized further using regularization so that it is not overfitting the data. 

# Model & Decision Making: 
We have chosen to employ a supervised learning model as we are analysing labelled data. Initially, we used a linear regression model as we are predicting continuous variables. The regression model’s algorithm would attempt to learn patterns that exist among mean temperature, day of the week, month, and hour of the day and crime rate. When presented with future data we would use this model to predict the crime rate when presented with these specifications based on previously learned patterns from the dataset. After completing a series of trial and error attempts with other supervised machine learning models such as the Random Forest Classifier, which after several attempts to optimize returned a low accuracy score; we chose to apply multiple linear regression models within our analysis. The current models have shown strong positive correlations however the accuracy needed to be improved upon further and the data became prone to overfitting. The linear regression model originally was extremely advantageous for our analysis as it clearly indicated the correlations between the variables, but the model failed to perform to its expected standard. 
After conducting further research on other potential machine learning models, we pivoted our analysis to predict the future crime rate in Toronto from 2019-2023 using our historical crime data. The Facebook Prophet model is exceptionally useful for our analysis as it is a univariate model that allows the user to input a future date and receive the forecasted crime rate for the exact day; the dashboard user will also be able to see these predictions more generally in the form of graphs that illustrate the predicted trends over the day of the week, the month, and year. 

# Model Process: 
1.	Once the prophet data frame was constructed using the historical dates and crime rate data, the data frame was then fit with the prophet model. For the Facebook Prophet Model, it is necessary for the left column “ds” to be a datetime format and the right column “y” to be the variable we are predicting, which is crime rate. 
2.	After the historical data frame is fit, the command “make_future_dataframe (periods=720)” is employed. This command tells prophet to predict the crime rate of the future 720 days after our historical data stops (2018). 
3.	We then create a new data frame and using the predict method we assign each row its predicted value labeled “yhat”. In addition to the predicted value column, two columns are assigned to indicate the uncertainty levels “yhat_lower” and “yhat_upper” in order to assess the accuracy of the predictions against the past data. 
  a.	The “yhat_lower” indicates the lower bound of the forecast/prediction; and the “yhat_upper” illustrates the upper bound of the forecasted data. 
4.	In order to visualize the trends over the historical and future crime rate we used various plots to illustrate the forecasted data.
  a.	Figure 1. Exemplifies the relationship between the actual and predicted crime rate beginning in 2014 and ending in 2023. 
  b.	Figure 2. Shows three different linear plots. The first illustrates the predicted trend of the crime rate; the model predicts a significant increase in the     trend of crime rate over the next five years. The second plot reinforces the historical trend that the future predicted crime rate will increase significantly       from Friday to Sunday during the week. The last plot in figure 2 shows the relationship between the forecasted crime rate and month- similar to the historical       data trends the months that will experience the highest crime rates vary from May to November. 
  c.	The graph generated using plotly, plots the predicted versus the actual historical data. From the graph we are able to determine that the crime rate will       continue to steadily increase from 2018 to 2023. 


