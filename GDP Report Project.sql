If OBJECT_ID('Raw_Data_GDP') IS NOT NULL DROP TABLE Raw_Data_GDP

CREATE TABLE Raw_Data_GDP
(DEMO_IND NVARCHAR(200),
Indicator NVARCHAR(200),
[LOCATION] NVARCHAR(200),
Country NVARCHAR(200),
[TIME] NVARCHAR(200),
[VALUE] FLOAT,
[Flag Codes] NVARCHAR(200),
Flags NVARCHAR(200)
)

-- Import the Data

Bulk Insert Raw_Data_GDP
from 'C:\Users\sarve\Downloads\gdp_raw_data\gdp_raw_data.csv'
with ( Format = 'CSV');

-- select * from Raw_Data_GDP


-- Drop View GDP_Excel_Input

Create View GDP_Excel_Input AS

select a.*, b.GDP_Per_Capita from 
     
	  (select country, [Time] as Year_No, [Value] as GDP_Value from Raw_Data_GDP
	  where Indicator = 'GDP (current US$)') a

	  Left Join 
	  (select Country, [Time] as Year_No, [Value] as GDP_Per_Capita From Raw_Data_GDP
	  where Indicator = 'GDP per capita (current US$)') b
	  on a.Country = b.Country And a.Year_No = b.Year_No

-- Select * from GDP_Excel_Input



-- 4: Creating a Store Procedure 

Create Procedure GDP_Input_monthly as 

If OBJECT_ID('Raw_Data_GDP') IS NOT NULL DROP TABLE Raw_Data_GDP

CREATE TABLE Raw_Data_GDP
(DEMO_IND NVARCHAR(200),
Indicator NVARCHAR(200),
[LOCATION] NVARCHAR(200),
Country NVARCHAR(200),
[TIME] NVARCHAR(200),
[VALUE] FLOAT,
[Flag Codes] NVARCHAR(200),
Flags NVARCHAR(200)
)

-- Import the Data

Bulk Insert Raw_Data_GDP
from 'C:\Users\sarve\Downloads\gdp_raw_data\gdp_raw_data.csv'
with ( Format = 'CSV');


-- EXEC GDP_Input_Monthly
