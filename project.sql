--creating table Totonto_temp
Create Table Toronto_temp (
	Date_ date NOT NULL,
	Year_ date Not NULL,
	Month_ date Not NULL,
	Day_ date Not NULL,
	Mean_temp int Not NULL,
	Total_Precip int Not NULL,
	Season Varchar Not NULL,
	Rain Varchar Not NULL,
	Snow Varchar Not NULL,
	Primary Key (Date_),
	Unique (Year_)
);

Create Table Crime_data(
	Index_ int Not NULL,
	Occurrence_date date Not NULL,
	Reported_date date Not NULL,
	Premise_type Varchar Not NULL,
	Ucr_code int Not NULL,
	Ucr_ext int Not NULL,
	Offence Varchar Not NULL,
	Occurrence_year date Not NULL,
	Occurrence_month date Not NULL,
	Occurrence_day date Not NULL,
	Occurrence_day_of_year date Not NULL,
	Occurrence_day_of_week date Not NULL,
	Occurrence_hour time Not NULL,
	MCI Varchar Not NULL,
	Neighbourhood Varchar Not NULL,
	Lat int Not NULL,
	Long int Not NULL,
	Object_Id int Not NULL,
	FOREIGN KEY (Occurrence_date) REFERENCES Toronto_temp (Date_),
	FOREIGN KEY (Occurrence_year) REFERENCES Toronto_temp (Year_),
	Primary Key (Occurrence_date)

);