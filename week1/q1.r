
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filepath <- "./q1.csv"
download.file(url, destfile = filepath, method="curl")

a <- read.csv(filepath)
b <- a[a$VAL >= 24,]$VAL
count <- length(b[!is.na(b)])

print(count)
