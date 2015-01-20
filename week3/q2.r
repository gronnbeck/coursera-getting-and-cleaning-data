library(jpeg)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
filepath <- "./data/q2.jpg"
download.file(url, destfile = filepath, method="curl")
img <- readJPEG(filepath, native=TRUE)

quantile(img, probs = seq(0.30, 0.80, 1))
quantile(img, probs = seq(0.80, 1))

