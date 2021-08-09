## Extract, Transform, and Load

In this project, the team of Terrell Bradford, Michael Cipriani, Ashleigh DeVito, Laura Kemp, and Sam Pierce sought to build a database of information related to New York State car accidents.

### Extract
The team's original intent was to utilize accident data from all across the United States. However, the scope had to be narrowed down to New York due to an excessive amount of data and file sizes.

The data was gathered from:

* United States Census Bureau for [Population and Demographics](https://www.census.gov/data/developers/data-sets/popest-popproj/popest.html)
* Data USA for [Income](https://datausa.io/profile/geo/new-york#economy)
* Kaggle for [Accident Data](US_Accidents_raw.csv)

![image](https://user-images.githubusercontent.com/83014623/128734529-7ada624b-b87c-46f6-b5ae-a2f5d23d2ebf.png)

The above data sets include information such as address, county, weather, infrastructure, time of day, race, etc.

### Transform
After our data was gathered, the team worked on creating an Entity Relationship Diagram (see below) to organize the information. This helped narrow down our data and start the process of creating csv tables (via Pandas) that included only essential/relevant information to the project. Throughout this process additioanl data cleaning was completed, including splitting and merging datasets, altering data types, and dropping extraneous data.

![image](https://user-images.githubusercontent.com/83014623/128728477-bdcea802-1d34-4aef-82f0-a87c86996b68.png)


### Load
The final step was to transfer the final output data into a database. The data was then cleaned using Jupyter Notebooks and loaded into an Amazon Web Service (AWS) database. The AWS database matched the tables and columns from the final Panda's Dataframe by using SQLAlchemy. For specfic detail pleasee see the code used below:

![image](https://user-images.githubusercontent.com/83014623/128735511-69fd6314-1a2f-4991-a6d2-435d6796dd61.png)
![image](https://user-images.githubusercontent.com/83014623/128735638-10fde660-0ac2-4127-af45-58e6fd6527be.png)

### HTML
Once the ETL steps were complete, the team utilized HTML to properly display the database and our process. For the HTML pages screenshots/links please see below:

#### Landing Page
[](file:///D:/CODE/etl_project/Report/pages/index.html) 
![image](https://user-images.githubusercontent.com/83014623/128736457-7e852072-52dd-4016-bd9e-bdd64fe309e5.png)

(insert image and link)

#### 
