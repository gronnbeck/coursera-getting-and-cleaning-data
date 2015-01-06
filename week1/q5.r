library(data.table)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv "
filepath <- "./q5.csv"
#download.file(url, destfile = filepath, method="curl")

DT <- fread(filepath)

print(system.time(DT[,mean(pwgtp15),by=SEX]))
print(system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}))
print(system.time(tapply(DT$pwgtp15,DT$SEX,mean)))
print(system.time(mean(DT$pwgtp15,by=DT$SEX)))
#print(system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}))
print(system.time(sapply(split(DT$pwgtp15,DT$SEX),mean)))


#print(DT[,mean(pwgtp15),by=SEX])
#print(mean(DT$pwgtp15,by=DT$SEX))
#print(sapply(split(DT$pwgtp15,DT$SEX),mean))