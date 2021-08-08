-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Zeny7K
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

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

CREATE TABLE "Address" (
    "Accident_ID" VARCHAR  NOT NULL ,
    "Number" INTEGER  NOT NULL ,
    "Street" VARCHAR  NOT NULL ,
    "City" VARCHAR  NOT NULL ,
	"Zipcode" VARCHAR  NOT NULL ,
    "County_ID" INTEGER  NOT NULL
)


CREATE TABLE [County] (
    [County_ID] INTEGER  NOT NULL ,
    [county_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED (
        [County_ID] ASC
    )
)

CREATE TABLE [County_Population_by_Year] (
    [County_ID] INTEGER  NOT NULL ,
    [Year] DATE  NOT NULL ,
    [population] INTEGER  NOT NULL ,
    CONSTRAINT [PK_County_Population_by_Year] PRIMARY KEY CLUSTERED (
        [County_ID] ASC
    )
)

CREATE TABLE [Household_Income_by_Race] (
    [Year] DATE  NOT NULL ,
    [Race_ID] INTEGER  NOT NULL ,
    [County_ID] INTEGER  NOT NULL ,
    [Household_Income] INTEGER  NOT NULL ,
    [Household_Income_MOE] INTEGER  NOT NULL ,
    CONSTRAINT [PK_Household_Income_by_Race] PRIMARY KEY CLUSTERED (
        [Year] ASC,[Race_ID] ASC,[County_ID] ASC
    )
)

CREATE TABLE [Infrastructure] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Bump] BIT(1)  NOT NULL ,
    [Crossing] BIT(1)  NOT NULL ,
    [Give_Way] BIT(1)  NOT NULL ,
    [Junction] BIT(1)  NOT NULL ,
    [No_Exit] BIT(1)  NOT NULL ,
    [Railway] BIT(1)  NOT NULL ,
    [Roundabout] BIT(1)  NOT NULL ,
    [Station] BIT(1)  NOT NULL ,
    [Stop] BIT(1)  NOT NULL ,
    [Traffic_Calming] BIT(1)  NOT NULL ,
    [Traffic_Signal] BIT(1)  NOT NULL ,
    [Turning_Loop] BIT(1)  NOT NULL ,
    CONSTRAINT [PK_Infrastructure] PRIMARY KEY CLUSTERED (
        [Accident_ID] ASC
    )
)

CREATE TABLE [Lat_Lng] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Start_Lat] INTEGER  NOT NULL ,
    [Start_Lng] INTEGER  NOT NULL ,
    [End_Lat] INTEGER  NOT NULL ,
    [End_Lng] INTEGER  NOT NULL 
)

CREATE TABLE [NY_accidents] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Severity] INTEGER  NOT NULL ,
    [Distance] DECIMAL  NOT NULL ,
    [Description] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_NY_accidents] PRIMARY KEY CLUSTERED (
        [Accident_ID] ASC
    )
)

CREATE TABLE [Race] (
    [Race_ID] INTEGER  NOT NULL ,
    [Race] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Race] PRIMARY KEY CLUSTERED (
        [Race_ID] ASC
    )
)

CREATE TABLE [Time] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Start_Time] TIMESTAMP  NOT NULL ,
    [End_Time] TIMESTAMP  NOT NULL ,
    [Sunrise_Sunset] VARCHAR(5)  NOT NULL 
)

CREATE TABLE [Weather] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Weather_Timestamp] TIMESTAMP  NOT NULL ,
    [Temperature] DECIMAL  NOT NULL ,
    [Wind_Chill] DECIMAL  NOT NULL ,
    [Humidity] DECIMAL  NOT NULL ,
    [Pressure] DECIMAL  NOT NULL ,
    [Visibility] DECIMAL  NOT NULL ,
    [Wind_Direction] VARCHAR  NOT NULL ,
    [Wind_Speed] DECIMAL  NOT NULL ,
    [Precipitation] DECIMAL  NOT NULL ,
    [Weather_Condition] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Weather] PRIMARY KEY CLUSTERED (
        [Accident_ID] ASC
    )
)

COMMIT TRANSACTION QUICKDBD