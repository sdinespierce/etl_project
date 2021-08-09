import pandas as pd
 
# to read csv file named "samplee"
a = pd.read_csv("../Report/Data_Dictionary.csv", encoding='latin1')
 
# to save as html file
# named as "Table"
a.to_html("ETL_Project_Data_Dictionary.html", index=False)
 
# assign it to a
# variable (string)
html_file = a.to_html()
