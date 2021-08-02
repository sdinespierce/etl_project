-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Zeny7K
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [County] (
    [County_ID] INTEGER  NOT NULL ,
    [county_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED (
        [County_ID] ASC
    )
)

CREATE TABLE [County_Population_by_Year] (
    [County_ID] INTEGER  NOT NULL ,
    [Year] Date  NOT NULL ,
    [population] INTEGER  NOT NULL ,
    CONSTRAINT [PK_County_Population_by_Year] PRIMARY KEY CLUSTERED (
        [County_ID] ASC
    )
)

CREATE TABLE [NY_accidents] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Severity] INTEGER  NOT NULL ,
    [Distance(mi)] FLOAT  NOT NULL ,
    [Description] STRING  NOT NULL ,
    CONSTRAINT [PK_NY_accidents] PRIMARY KEY CLUSTERED (
        [Accident_ID] ASC
    )
)

CREATE TABLE [Time] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Start_Time] DATETIME  NOT NULL ,
    [End_Time] DATETIME  NOT NULL ,
    [Sunrise_Sunset] STRING  NOT NULL 
)

CREATE TABLE [Lat_Lng] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Start_Lat] INTEGER  NOT NULL ,
    [Start_Lng] INTEGER  NOT NULL ,
    [End_Lat] INTEGER  NOT NULL ,
    [Eng_Lng] INTEGER  NOT NULL 
)

CREATE TABLE [Weather] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Weather_Timestamp] DATETIME  NOT NULL ,
    [Temperature(F)] FLOAT  NOT NULL ,
    [Wind_Chill(F)] FLOAT  NOT NULL ,
    [Humidity(%)] FLOAT  NOT NULL ,
    [Pressure(in)] FLOAT  NOT NULL ,
    [Visibility(ml)] FLOAT  NOT NULL ,
    [Wind_Direction] STRING  NOT NULL ,
    [Wind_Speed(mph)] FLOAT  NOT NULL ,
    [Precipitation(in)] FLOAT  NOT NULL ,
    [Weather_Condition] STRING  NOT NULL ,
    CONSTRAINT [PK_Weather] PRIMARY KEY CLUSTERED (
        [Accident_ID] ASC
    )
)

CREATE TABLE [Infrastructure] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Bump] BIT  NOT NULL ,
    [Crossing] BIT  NOT NULL ,
    [Give_Way] BIT  NOT NULL ,
    [Junction] BIT  NOT NULL ,
    [No_Exit] BIT  NOT NULL ,
    [Railway] BIT  NOT NULL ,
    [Roundabout] BIT  NOT NULL ,
    [Station] BIT  NOT NULL ,
    [Stop] BIT  NOT NULL ,
    [Traffic_Calming] BIT  NOT NULL ,
    [Traffic_Signal] BIT  NOT NULL ,
    [Turning_Loop] BIT  NOT NULL ,
    CONSTRAINT [PK_Infrastructure] PRIMARY KEY CLUSTERED (
        [Accident_ID] ASC
    )
)

CREATE TABLE [Address] (
    [Accident_ID] VARCHAR  NOT NULL ,
    [Number] INTEGER  NOT NULL ,
    [Street] STRING  NOT NULL ,
    [City] STRING  NOT NULL ,
    [County_ID] INTEGER  NOT NULL ,
    [Zipcode] VARCHAR  NOT NULL 
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

CREATE TABLE [Race] (
    [Race_ID] INTEGER  NOT NULL ,
    [Race] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Race] PRIMARY KEY CLUSTERED (
        [Race_ID] ASC
    )
)

ALTER TABLE [County] WITH CHECK ADD CONSTRAINT [FK_County_County_ID] FOREIGN KEY([County_ID])
REFERENCES [Address] ([County_ID])

ALTER TABLE [County] CHECK CONSTRAINT [FK_County_County_ID]

ALTER TABLE [County_Population_by_Year] WITH CHECK ADD CONSTRAINT [FK_County_Population_by_Year_County_ID] FOREIGN KEY([County_ID])
REFERENCES [County] ([County_ID])

ALTER TABLE [County_Population_by_Year] CHECK CONSTRAINT [FK_County_Population_by_Year_County_ID]

ALTER TABLE [Time] WITH CHECK ADD CONSTRAINT [FK_Time_Accident_ID] FOREIGN KEY([Accident_ID])
REFERENCES [NY_accidents] ([Accident_ID])

ALTER TABLE [Time] CHECK CONSTRAINT [FK_Time_Accident_ID]

ALTER TABLE [Lat_Lng] WITH CHECK ADD CONSTRAINT [FK_Lat_Lng_Accident_ID] FOREIGN KEY([Accident_ID])
REFERENCES [NY_accidents] ([Accident_ID])

ALTER TABLE [Lat_Lng] CHECK CONSTRAINT [FK_Lat_Lng_Accident_ID]

ALTER TABLE [Weather] WITH CHECK ADD CONSTRAINT [FK_Weather_Accident_ID] FOREIGN KEY([Accident_ID])
REFERENCES [NY_accidents] ([Accident_ID])

ALTER TABLE [Weather] CHECK CONSTRAINT [FK_Weather_Accident_ID]

ALTER TABLE [Infrastructure] WITH CHECK ADD CONSTRAINT [FK_Infrastructure_Accident_ID] FOREIGN KEY([Accident_ID])
REFERENCES [NY_accidents] ([Accident_ID])

ALTER TABLE [Infrastructure] CHECK CONSTRAINT [FK_Infrastructure_Accident_ID]

ALTER TABLE [Address] WITH CHECK ADD CONSTRAINT [FK_Address_Accident_ID] FOREIGN KEY([Accident_ID])
REFERENCES [NY_accidents] ([Accident_ID])

ALTER TABLE [Address] CHECK CONSTRAINT [FK_Address_Accident_ID]

ALTER TABLE [Household_Income_by_Race] WITH CHECK ADD CONSTRAINT [FK_Household_Income_by_Race_County_ID] FOREIGN KEY([County_ID])
REFERENCES [County] ([County_ID])

ALTER TABLE [Household_Income_by_Race] CHECK CONSTRAINT [FK_Household_Income_by_Race_County_ID]

ALTER TABLE [Race] WITH CHECK ADD CONSTRAINT [FK_Race_Race_ID] FOREIGN KEY([Race_ID])
REFERENCES [Household_Income_by_Race] ([Race_ID])

ALTER TABLE [Race] CHECK CONSTRAINT [FK_Race_Race_ID]

COMMIT TRANSACTION QUICKDBD