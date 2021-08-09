DROP TABLE public."Address";
DROP TABLE public."County";
DROP TABLE public."County_Population_by_Year";
DROP TABLE public."Household_Income_by_Race";
DROP TABLE public."Infrastructure";
DROP TABLE public."Lat_Lng";
DROP TABLE public."NY_Accidents";
DROP TABLE public."Race";
DROP TABLE public."Time";
DROP TABLE public."Weather";

------------------------------------------

CREATE TABLE "Address" (
    "Accident_ID" VARCHAR  NOT NULL ,
    "Number" INTEGER,
    "Street" VARCHAR  NOT NULL ,
    "City" VARCHAR,
	"Zipcode" VARCHAR,
    "County_ID" INTEGER  NOT NULL
);

CREATE TABLE "County" (
    "County_ID" INTEGER  NOT NULL ,
    "County_Name" VARCHAR  NOT NULL
);

CREATE TABLE "County_Population_by_Year" (
    "County_ID" INTEGER  NOT NULL ,
    "Population" INTEGER  NOT NULL ,
	"Year" SMALLINT  NOT NULL
);

CREATE TABLE "Household_Income_by_Race" (
    "Year" INTEGER  NOT NULL ,
    "Race_ID" INTEGER  NOT NULL ,
    "County_ID" INTEGER  NOT NULL ,
    "Household_Income" INTEGER  NOT NULL ,
    "Household_Income_MOE" INTEGER
);

CREATE TABLE "Infrastructure" (
    "Accident_ID" VARCHAR  NOT NULL ,
    "Bump" SMALLINT,
    "Crossing" SMALLINT,
    "Give_Way" SMALLINT,
    "Junction" SMALLINT,
    "No_Exit" SMALLINT,
    "Railway" SMALLINT,
    "Roundabout" SMALLINT,
    "Station" SMALLINT,
    "Stop" SMALLINT,
    "Traffic_Calming" SMALLINT,
    "Traffic_Signal" SMALLINT,
    "Turning_Loop" SMALLINT
);

CREATE TABLE "Lat_Lng" (
    "Accident_ID" VARCHAR  NOT NULL ,
    "Start_Lat" DOUBLE PRECISION  NOT NULL ,
    "Start_Lng" DOUBLE PRECISION  NOT NULL ,
    "End_Lat" DOUBLE PRECISION ,
    "End_Lng" DOUBLE PRECISION
);

CREATE TABLE "NY_Accidents" (
    "Accident_ID" VARCHAR  NOT NULL ,
    "Severity" INTEGER  NOT NULL ,
    "Distance" DECIMAL  NOT NULL ,
    "Description" VARCHAR  NOT NULL
);

CREATE TABLE "Race" (
    "Race_ID" INTEGER  NOT NULL ,
    "Race" VARCHAR  NOT NULL
);

CREATE TABLE "Time" (
    "Accident_ID" VARCHAR  NOT NULL ,
    "Start_Time" TIMESTAMP  NOT NULL ,
    "End_Time" TIMESTAMP  NOT NULL ,
    "Sunrise_Sunset" VARCHAR(5)
);

CREATE TABLE "Weather" (
    "Accident_ID" VARCHAR  NOT NULL ,
    "Weather_Timestamp" TIMESTAMP ,
    "Temperature" DECIMAL ,
    "Wind_Chill" DECIMAL ,
    "Humidity" DECIMAL  ,
    "Pressure" DECIMAL  ,
    "Visibility" DECIMAL  ,
    "Wind_Direction" VARCHAR  ,
    "Wind_Speed" DECIMAL  ,
    "Precipitation" DECIMAL  ,
    "Weather_Condition" VARCHAR
);

------------------------------------------

ALTER TABLE "Address" ADD PRIMARY KEY ("Accident_ID");

ALTER TABLE "County" ADD PRIMARY KEY ("County_ID");

ALTER TABLE "County_Population_by_Year" ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE "Household_Income_by_Race" ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE "Infrastructure" ADD PRIMARY KEY ("Accident_ID");

ALTER TABLE "Lat_Lng" ADD PRIMARY KEY ("Accident_ID");

ALTER TABLE "NY_Accidents" ADD PRIMARY KEY ("Accident_ID");

ALTER TABLE "Race" ADD PRIMARY KEY ("Race_ID");

ALTER TABLE "Time" ADD PRIMARY KEY ("Accident_ID");

ALTER TABLE "Weather" ADD PRIMARY KEY ("Accident_ID");

------------------------------------------

ALTER TABLE "Address" ADD FOREIGN KEY ("Accident_ID") REFERENCES "NY_Accidents"("Accident_ID");
ALTER TABLE "Address" ADD FOREIGN KEY ("County_ID") REFERENCES "County"("County_ID");

ALTER TABLE "County_Population_by_Year" ADD FOREIGN KEY ("County_ID") REFERENCES "County"("County_ID");

ALTER TABLE "Household_Income_by_Race" ADD FOREIGN KEY ("Race_ID") REFERENCES "Race"("Race_ID");
ALTER TABLE "Household_Income_by_Race" ADD FOREIGN KEY ("County_ID") REFERENCES "County"("County_ID");

ALTER TABLE "Infrastructure" ADD FOREIGN KEY ("Accident_ID") REFERENCES "NY_Accidents"("Accident_ID");

ALTER TABLE "Lat_Lng" ADD FOREIGN KEY ("Accident_ID") REFERENCES "NY_Accidents"("Accident_ID");

ALTER TABLE "Time" ADD FOREIGN KEY ("Accident_ID") REFERENCES "NY_Accidents"("Accident_ID");

ALTER TABLE "Weather" ADD FOREIGN KEY ("Accident_ID") REFERENCES "NY_Accidents"("Accident_ID");