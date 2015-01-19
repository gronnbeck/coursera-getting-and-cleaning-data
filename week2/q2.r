library(sqldf)

acs <- read.csv("getdata-data-ss06pid.csv")
sql_data <- read.csv.sql("getdata-data-ss06pid.csv", sql = "select pwgtp1 from file where AGEP < 50")
