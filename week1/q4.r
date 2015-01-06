library(XML)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
filepath <- "./q4.xml"
download.file(url, destfile = filepath, method="curl")

doc <- xmlTreeParse(filepath, useInternal=TRUE)

allZips <- xpathSApply(doc, "//zipcode", xmlValue)
zipcodes <- allZips[allZips == 21231]
count <- length(zipcodes)

print(count)
