Create Table Toronto_temp (
	Date date NOT NULL,
	Year_ Varchar Not NULL,
	Month_ Varchar Not NULL,
	Day_ Varchar Not NULL,
	Mean_temp int Not NULL,
	Total_Precip int Not NULL,
	Season Varchar Not NULL,
	Rain Varchar Not NULL,
	Snow Varchar Not NULL,
	Primary Key (Date),
	Unique (Date)
);
Create Table Crime_data(
	Date date Not NULL,
	Offence Varchar Not NULL,
	Occurrencemonth Varchar Not NULL,
	Occurrenceday int Not NULL,
	Occurrencedayofweek varchar Not NULL,
	hour_num int Not NULL,
	MCI Varchar Not NULL,
	Neighbourhood Varchar Not NULL,
	Lat int Not NULL,
	Long int Not NULL,
	ObjectId int Not NULL,
	FOREIGN KEY (Date) REFERENCES Toronto_temp (Date),
	FOREIGN KEY (Occurrencemonth) REFERENCES Toronto_temp (month_),
	Primary Key (Date)
);