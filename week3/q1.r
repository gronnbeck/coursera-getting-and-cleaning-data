url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filepath <- "./data/q1.csv"
#download.file(url, destfile = filepath, method="curl")
csv <- read.csv(filepath)

al <- csv$ACR == 3 & csv$AGS == 6

print(which(al))
