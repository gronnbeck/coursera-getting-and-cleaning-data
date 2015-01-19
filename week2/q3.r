library(sqldf)

acs <- read.csv("getdata-data-ss06pid.csv")
sql_data <- read.csv.sql("getdata-data-ss06pid.csv", sql = "select distinct AGEP from acs")

print(unique(acs$AGEP))
print(head(sql_data))