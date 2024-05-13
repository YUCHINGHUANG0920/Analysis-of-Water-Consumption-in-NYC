# Analysis of Water Consumption in NYC
## Overview
This is a personal assignment for Baruch College's CIS 9440 Data Warehousing and Analytics course. The objective is to practically extract data from a data source and build ETL scripts to create a Data Warehouse to address specific business requirements.

The data source for this project is the **NYC Open Data - Water Consumption And Cost dataset (2013 - Feb 2023)**, which includes monthly consumption and cost data by borough and development. The assumed business requirements are: to analyze the average water consumption for each of the five boroughs of New York City and the water consumption at different times to identify which borough has the highest average water consumption and at what times the water consumption is highest. This analysis is intended to provide insights for future adjustments and management for water pricing.


## Workflow of this project:

![Star Schema](https://github.com/YUCHINGHUANG0920/Analysis-of-Water-Consumption-in-NYC/blob/master/InformationArchitecture.png)


### 1. Data Source
URL: https://data.cityofnewyork.us/Housing-Development/Water-Consumption-And-Cost-2013-Feb-2023-/66be-66yr/about_data

Data Dictionary: This data dictionary is available in **Data_Dictionary_Water_Consumption___Cost.xlsx** for reference.


### 2. Storage
We create an Azure container to store the downloaded raw datasets from the data source. To connect to the Azure container, we must ensure that the connection string is recorded in JSON format (named **config.json**) within the **config** folder, facilitating the smooth execution of scripts.


### 3. Data Modeling
We utilize DbSchema to draw the data modeling diagram of this project in a star schema format. The dbs file can be found in **database/waterconsumption.dbs**.
![Star Schema](https://github.com/YUCHINGHUANG0920/Analysis-of-Water-Consumption-in-NYC/blob/master/database/StarSchema.png)


### 4. Transformation
After reviewing the data in the database, we need to perform data transformations and remove duplicate or missing records. Then, we create various dimension tables and the final fact table. Finally, we upload each table to the data warehouse. (PostgreSQL is used for the data warehouse in this project.)

Similar to data storage, we need to create a JSON formatted configuration file (named **config_sql.json**) in the **config** folder. This file should contain the username, password, and host information required to connect to the PostgreSQL database. This setup enables the connection between the processed data and the PostgreSQL database.


### 5. Data Visualization
Once the data warehouse is established, we can use **Tableau** as a visualization tool. Initially, we established a connection between PostgreSQL and Tableau to generate different charts. 

Here is the link for the final charts: https://public.tableau.com/views/AnalysisofWaterConsumption/Dashboard1?:language=en-US&publish=yes&:sid=&:display_count=n&:origin=viz_share_link


Insights from the charts:
1. Although Manhattan has the highest total water consumption, this may be due to a larger number of data rather than the actual highest water usage. Therefore, analyzing based on average daily consumption is more appropriate.
2. Queens has the highest average daily water consumption, followed by Manhattan.
3. The chart helps identify which developments have the highest average daily water consumption.
4. For Queens, water consumption is lower on Fridays and Saturdays compared to other days, and July records the highest water consumption annually.
5. For Manhattan, water consumption is higher on Sundays compared to other days, and June records the highest water consumption annually.
6. After Identifying the locations and time periods with higher water consumption, we can subsequently analyze the abundance of water resources to confirm the supply-demand balance and adjust water prices accordingly.