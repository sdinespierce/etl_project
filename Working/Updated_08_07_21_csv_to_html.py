import pandas as pd
 
# to read csv file named "samplee"
a = pd.read_csv("ETL_Project_Data_Dictionary.csv")
table = a.to_html("ETL_Project_Data_Dictionary.html"index=False)
table.replace('\n','') 

# remove extra space
# a['Table Name'].str.strip()
# a['Field Name'].str.strip()
# a['Type'].str.strip()
# a['Description'].str.strip()


# to save as html file
# named as "Table"
# table.to_html("ETL_Project_Data_Dictionary.html",index=False)

# # assign it to a
# # variable (string)
# html_file = a.to_html()
# html_file
