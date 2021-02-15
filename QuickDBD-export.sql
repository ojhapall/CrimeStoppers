-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "torono_temp_official" (
    "Date_" DATE   NOT NULL,
    "Month_" NUMERIC   NOT NULL,
    "Day_" NUMERIC   NOT NULL,
    "Mean_Temp" FLOAT   NOT NULL,
    "Total_Precip" FLOAT   NOT NULL,
    "Season" VARCHAR   NOT NULL,
    "Rain" VARCHAR   NOT NULL,
    "Snow" VARCHAR   NOT NULL,
    CONSTRAINT "pk_torono_temp_official" PRIMARY KEY (
        "Date_"
     )
);

CREATE TABLE "crime_data" (
    "Date" VARCHAR   NOT NULL,
    "reportedyear" INT   NOT NULL,
    "occurrencemonth" VARCHAR   NOT NULL,
    "occurrenceday" INT   NOT NULL,
    "occurrencedayofweek" VARCHAR   NOT NULL,
    "hour_num" INT   NOT NULL,
    "MCI" VARCHAR   NOT NULL,
    CONSTRAINT "pk_crime_data" PRIMARY KEY (
        "Date"
     )
);

ALTER TABLE "torono_temp_official" ADD CONSTRAINT "fk_torono_temp_official_Date_" FOREIGN KEY("Date_")
REFERENCES "crime_data" ("Date");

