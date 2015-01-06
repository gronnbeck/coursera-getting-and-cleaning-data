library(xlsx)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
filepath <- "./q3.xlsx"
download.file(url, destfile = filepath, method="curl")

colIndex <- 7:15
rowIndex <- 18:23

dat <- read.xlsx(filepath, sheetIndex=1, header=TRUE,
                  colIndex=colIndex, rowIndex=rowIndex)

s <- sum(dat$Zip*dat$Ext,na.rm=T) 

print(s)