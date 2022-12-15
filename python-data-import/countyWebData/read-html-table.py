import os
import os.path
from selenium.webdriver.common.by import By
import pandas as pd
from selenium import webdriver
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options

firefox_options = Options()
firefox_options.add_argument("--headless")
driver = webdriver.Firefox(options=firefox_options)

# html table parsed from https://en.wikipedia.org/wiki/List_of_counties_in_Iowa
htmlFilePath =  "file://" + os.path.dirname(__file__) + "/" + "iowa-counties-table.html"
driver.get(htmlFilePath)
htmlTable = driver.find_element(By.XPATH, "/html/body/main/table").get_attribute('outerHTML')
pdTable = pd.read_html(htmlTable, converters={'FIPS code[10]' : str})
df = pdTable[0]



print()
print("Get County List")
print("---------------")
print()
#print("HTML Columns")
#print("------------")
#for column in df.columns:
  #print(column)

#print()
#print("HTML Rows")
#print("---------")

print()
print("-- county table")
print()

Name = ""; FIPSCode = ""; MapNumber = ""; AlphaNumber = ""
for index, row in df.iterrows():
  Name = ""; FIPSCode = ""; MapNumber = ""; AlphaNumber = ""
  Name = row["County"]
  FIPSCode = str(row["FIPS code[10]"])
  MapNumber = row["Map #"]
  AlphaNumber = row["#"]
  #generate SQL insert
  #print(Name + "," + str(FIPSCode) + "," + str(MapNumber) + "," +  str(AlphaNumber))
  # insert county values (NEWID(), '<countyName>','<countyFIPSId>',<countyMapId>)
  print("insert counties values (NEWID(), '" + Name.replace("'","''") + "','" + str(FIPSCode) + "'," + str(MapNumber) + ")")

# get adjacent county list (text copied from https://www2.census.gov/geo/docs/reference/county_adjacency.txt)
filepath = os.path.dirname(__file__) + "/" + "iowa-adjacent-counties.txt"
txtfile = open(filepath, 'r')
lines = txtfile.readlines()

print()
print("-- adjacent county fill table")
print()

countyHeaderLine = False; adjacentCountyLine = False; countyFipsId = ""; adjacentCountyFipsId = ""
for line in lines:
    countyHeaderLine = False; adjacentCountyLine = False;
    leading_spaces = len(line) - len(line.lstrip())
    if (leading_spaces == 0) :
      countyHeaderLine = True
      countyFipsId = ""
      countyFipsId = str(line.split('\t', 2)[1]).replace("\n", "")[2:]
    elif (leading_spaces == 2) :
      adjacentCountyLine = True
      adjacentCountyState = str(line.split(',', 1)[1]).replace("\n", "").strip()[:2]
      if (adjacentCountyState != "IA"):
        continue
      adjacentCountyFipsId = str(line.rsplit('\t', 1)[1]).replace("\n", "")[2:]
      #print(countyFipsId + ";" + adjacentCountyFipsId)
      if (str(countyFipsId) != str(adjacentCountyFipsId)):
        print("insert adjacentCountiesLoad values ('" + str(countyFipsId).strip() + "','" + str(adjacentCountyFipsId).strip() +"')")



