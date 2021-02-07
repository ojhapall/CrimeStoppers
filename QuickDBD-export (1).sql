-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Temperature_Data" (
    "Date_" date   NOT NULL,
    "Month_" Int   NOT NULL,
    "Day_" Int   NOT NULL,
    "Mean_Temp" Numeric   NOT NULL,
    "Total_Precip" Numeric   NOT NULL,
    "Season" varchar   NOT NULL,
    "Rain" varchar   NOT NULL,
    "Snow" varchar   NOT NULL,
    CONSTRAINT "pk_Temperature_Data" PRIMARY KEY (
        "Date_"
     )
);

CREATE TABLE "Crime_Data" (
    "Date" date   NOT NULL,
    "offence" varchar   NOT NULL,
    "reportedyear" Int   NOT NULL,
    "occurrencemonth" varchar   NOT NULL,
    "occurrenceday" Int   NOT NULL,
    "occurrencedayofweek" varchar   NOT NULL,
    "hour_num" Int   NOT NULL,
    "MCI" varchar   NOT NULL,
    "Neighbourhood" varchar   NOT NULL,
    "Lat" Numeric   NOT NULL,
    "Long" Numeric   NOT NULL,
    "ObjectId" Int   NOT NULL,
    CONSTRAINT "pk_Crime_Data" PRIMARY KEY (
        "Date"
     )
);

ALTER TABLE "Crime_Data" ADD CONSTRAINT "fk_Crime_Data_Date_occurrenceday" FOREIGN KEY("Date", "occurrenceday")
REFERENCES "Temperature_Data" ("Date_", "Day_");

