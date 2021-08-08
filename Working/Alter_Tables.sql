
ALTER TABLE "County" (CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED ([County_ID] ASC))

ALTER TABLE "County_Population_by_Year" (CONSTRAINT [PK_County_Population_by_Year] PRIMARY KEY CLUSTERED ([County_ID] ASC))

ALTER TABLE "NY_accidents" (CONSTRAINT [PK_NY_accidents] PRIMARY KEY CLUSTERED ([Accident_ID] ASC))

ALTER TABLE "Weather" (CONSTRAINT [PK_Weather] PRIMARY KEY CLUSTERED ([Accident_ID] ASC))

ALTER TABLE "Infrastructure" (CONSTRAINT [PK_Infrastructure] PRIMARY KEY CLUSTERED ([Accident_ID] ASC))

ALTER TABLE "Household_Income_by_Race" ([PK_Household_Income_by_Race] PRIMARY KEY CLUSTERED ([Year] ASC,[Race_ID] ASC,[County_ID] ASC))

ALTER TABLE "Race" (CONSTRAINT [PK_Race] PRIMARY KEY CLUSTERED ([Race_ID] ASC))

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