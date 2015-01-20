library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

filepath <- "./data/q3-1.jpg"
filepath2 <- "./data/q3-2.jpg"

download.file(url, destfile = filepath, method="curl")
download.file(url2, destfile = filepath2, method="curl")

data1 <- read.csv(filepath)
data2 <- read.csv(filepath2)

head(data1)
head(data2)
head(data1$X)
head(data2$CountryCode)

filter(data2, Short.Name == "Upper middle income")$CountryCode
filter(data1, X == "UMC")

m <- merge(filter(data1, X != ""), filter(data2, CountryCode != NULL), by.x="X", by.y="CountryCode")
head(m)

#sorted_labels <- paste(sort(as.integer(levels(m$Gross.domestic.product.2012))))
m <- mutate(m, GDP = as.numeric(as.character(Gross.domestic.product.2012)))
arrange(m, desc(Gross.domestic.product.2012))$Gross.domestic.product.2012
l <- arrange(m, desc(Gross.domestic.product.2012))$GDP

q3_1 <- length(l[!is.na(l)])
r <- arrange(m, desc(GDP))
print(q3_1)
print(r[13,]$Table.Name)

q4_oecd <- filter(m, Income.Group == "High income: OECD")
q4_non_oecd <- filter(m, Income.Group == "High income: nonOECD")
q4_avg_oecd <- mean(q4_oecd$GDP, na.rm = TRUE)
q4_avg_nonoecd <- mean(q4_non_oecd$GDP, na.rm = TRUE)

print(q4_avg_oecd)
print(q4_avg_nonoecd)

breaks <- quantile(m$GDP, probs=seq(0, 1, 0.2), na.rm=TRUE)
m$qtGrp <- cut(m$GDP, breaks=breaks)
table(m$qtGrp, m$Income.Group)
