## Extract, Transform, and Load

In this project, the team of Terrell Bradford, Michael Cipriani, Ashleigh DeVito, Laura Kemp, and Sam Pierce sought to build a database of information related to New York State car accidents.

### Extract
Data targeted for this project was pertinent to car accidents within New York. Population data for the counties intersecting NYC was also pulled from the Census. Household Income and Race were acquired for the state, by County.

The data was gathered from:

* United States Census Bureau for [Population](https://www.census.gov/data/developers/data-sets/popest-popproj/popest.html)
* Data USA for [Income and Demographics](https://datausa.io/profile/geo/new-york#economy)
* Kaggle for [Accident Data](US_Accidents_raw.csv)

![image](Report/pages/images/Sources_page.png?raw=true "Sources")

The above data sets include information such as address, county, weather, infrastructure, time of day, race, etc.

### Transform
After our data was gathered, the team worked on creating an Entity Relationship Diagram (see below) to organize the information. This helped narrow down our data and start the process of creating csv tables (via Pandas in Jupyter Notebooks) that included only essential/relevant information to the project. Throughout this process additioanl data cleaning was completed, including splitting and merging datasets, altering data types, and dropping extraneous data.

![image](Report/Entity_Relationship_Diagram.png?raw=true "Entity Relationship Diagram")


### Load
The final step was to transfer the final output data into a database. The data was then cleaned and loaded into an Amazon Web Service (AWS) database. The schemas of the tables were constructerd using SQL. Then, SQLAlchemy was used to load the data into the tables.

### HTML
Once the ETL steps were complete, the team utilized HTML to display the database properties and report on our process. Bootstrap and CSS were used on formatting and the pages are responsive to screen size.

### Report

**[Live site can be found here](https://sdinespierce.github.io/etl_project/)**

![image](Report/pages/images/Landing_page.png?raw=true "Landing Page")
