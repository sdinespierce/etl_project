﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Zeny7K
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "County" (
    "County_ID" INTEGER   NOT NULL,
    "county_name" VARCHAR   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "population" INTEGER   NOT NULL,
    CONSTRAINT "pk_County" PRIMARY KEY (
        "County_ID"
     )
);

CREATE TABLE "NY_accidents" (
    "Accident_ID" VARCHAR   NOT NULL,
    "Severity" INTEGER   NOT NULL,
    "Distance(mi)" INTEGER   NOT NULL,
    "Description" STRING   NOT NULL,
    CONSTRAINT "pk_NY_accidents" PRIMARY KEY (
        "Accident_ID"
     )
);

CREATE TABLE "Time" (
    "Accident_ID" VARCHAR   NOT NULL,
    "Start_Time" DATETIME   NOT NULL,
    "End_Time" DATETIME   NOT NULL
);

CREATE TABLE "Lat_Lng" (
    "Accident_ID" VARCHAR   NOT NULL,
    "Start_Lat" INTEGER   NOT NULL,
    "Start_Lng" INTEGER   NOT NULL,
    "End_Lat" INTEGER   NOT NULL,
    "Eng_Lng" INTEGER   NOT NULL
);

CREATE TABLE "Weather" (
    "Accident_ID" VARCHAR   NOT NULL,
    "Weather_Timestamp" DATETIME   NOT NULL,
    "Temperature(F)" INTEGER   NOT NULL,
    "Wind_Chill(F)" INTEGER   NOT NULL,
    "Humidity(%)" INTEGER   NOT NULL,
    "Pressure(in)" INTEGER   NOT NULL,
    "Visibility(ml)" INTEGER   NOT NULL,
    "Wind_Direction" STRING   NOT NULL,
    "Wind_Speed(mph)" INTEGER   NOT NULL,
    "Precipitation(in)" INTEGER   NOT NULL,
    "Weather_Condition" STRING   NOT NULL,
    CONSTRAINT "pk_Weather" PRIMARY KEY (
        "Accident_ID"
     )
);

CREATE TABLE "Time_of_Day" (
    "Accident_ID" VARCHAR   NOT NULL,
    "Sunrise_Sunset" STRING   NOT NULL
);

CREATE TABLE "Infrastructure" (
    "Accident_ID" VARCHAR   NOT NULL,
    "Bump" VARCHAR   NOT NULL,
    "Crossing" VARCHAR   NOT NULL,
    "Give_Way" VARCHAR   NOT NULL,
    "Junction" VARCHAR   NOT NULL,
    "No_Exit" VARCHAR   NOT NULL,
    "Railway" VARCHAR   NOT NULL,
    "Roundabout" VARCHAR   NOT NULL,
    "Station" VARCHAR   NOT NULL,
    "Stop" VARCHAR   NOT NULL,
    "Traffic_Calming" VARCHAR   NOT NULL,
    "Traffic_Signal" VARCHAR   NOT NULL,
    "Turning_Loop" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Infrastructure" PRIMARY KEY (
        "Accident_ID"
     )
);

CREATE TABLE "Address" (
    "Accident_ID" VARCHAR   NOT NULL,
    "Number" INTEGER   NOT NULL,
    "Street" STRING   NOT NULL,
    "City" STRING   NOT NULL,
    "County_ID" INTEGER   NOT NULL,
    "Zipcode" VARCHAR   NOT NULL
);

CREATE TABLE "Household_Income_by_Race" (
    "Year" DATE   NOT NULL,
    "Race_ID" INTEGER   NOT NULL,
    "County_ID" INTEGER   NOT NULL,
    "Household_Income" INTEGER   NOT NULL,
    "Household_Income_MOE" INTEGER   NOT NULL,
    CONSTRAINT "pk_Household_Income_by_Race" PRIMARY KEY (
        "Year","Race_ID","County_ID"
     )
);

CREATE TABLE "Race" (
    "Race_ID" INTEGER   NOT NULL,
    "Race" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Race" PRIMARY KEY (
        "Race_ID"
     )
);

ALTER TABLE "County" ADD CONSTRAINT "fk_County_County_ID" FOREIGN KEY("County_ID")
REFERENCES "Address" ("County_ID");

ALTER TABLE "Time" ADD CONSTRAINT "fk_Time_Accident_ID" FOREIGN KEY("Accident_ID")
REFERENCES "NY_accidents" ("Accident_ID");

ALTER TABLE "Lat_Lng" ADD CONSTRAINT "fk_Lat_Lng_Accident_ID" FOREIGN KEY("Accident_ID")
REFERENCES "NY_accidents" ("Accident_ID");

ALTER TABLE "Weather" ADD CONSTRAINT "fk_Weather_Accident_ID" FOREIGN KEY("Accident_ID")
REFERENCES "NY_accidents" ("Accident_ID");

ALTER TABLE "Time_of_Day" ADD CONSTRAINT "fk_Time_of_Day_Accident_ID" FOREIGN KEY("Accident_ID")
REFERENCES "NY_accidents" ("Accident_ID");

ALTER TABLE "Infrastructure" ADD CONSTRAINT "fk_Infrastructure_Accident_ID" FOREIGN KEY("Accident_ID")
REFERENCES "NY_accidents" ("Accident_ID");

ALTER TABLE "Address" ADD CONSTRAINT "fk_Address_Accident_ID" FOREIGN KEY("Accident_ID")
REFERENCES "NY_accidents" ("Accident_ID");

ALTER TABLE "Household_Income_by_Race" ADD CONSTRAINT "fk_Household_Income_by_Race_County_ID" FOREIGN KEY("County_ID")
REFERENCES "County" ("County_ID");

ALTER TABLE "Race" ADD CONSTRAINT "fk_Race_Race_ID" FOREIGN KEY("Race_ID")
REFERENCES "Household_Income_by_Race" ("Race_ID");

