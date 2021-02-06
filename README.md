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

### ERD

<img width="456" alt="Screen Shot 2021-02-06 at 12 39 25 PM" src="https://user-images.githubusercontent.com/69806770/107126355-61721800-687d-11eb-8509-49712a71450c.png">

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
