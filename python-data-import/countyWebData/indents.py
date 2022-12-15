
import os
import os.path
# L = ["Geeks\n", "for\n", "Geeks\n"]
  
# # writing to file
# file1 = open('iowa-counties.txt', 'w')
# file1.writelines(L)
# file1.close()
  
# Using readlines()
# os.getcwd()
# print('__file__:    ', __file__)

filepath =  os.path.dirname(__file__) + "/" + "iowa-counties.txt"

file1 = open(filepath, 'r')
Lines = file1.readlines()
  
count = 0
# Strips the newline character
for line in Lines:
    leading_spaces = len(line) - len(line.lstrip())
 
    countyHeaderLine = False
    adjacentCountyLine = False
    unknownLine = False
    lineType = ""

    if (leading_spaces == 0) :
      countyHeaderLine = True
      lineType = "header"
      #insert statement
    elif (leading_spaces == 2) :
      adjacentCountyLine = True
      lineType = "adjacent item"
      #insert statements for each tied to header
    else:
      unknownLine = True

    count += 1
    # print("Line{}: {} {}".format(count, line, lineType))
    print(line)
    print("County:")
    # print("County: {}: {} {}".format(count, line, lineType))


