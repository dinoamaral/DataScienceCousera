###Question4
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xpathSApply(rootNode, //zipcode, xmlValue)
sum(xpathSApply(rootNode, //zipcode, xmlValue)==21231)

###Question5
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl2, destfile="./data/data3.csv", method="curl")
library(data.table)
DT <- fread("./data/data3.csv")
system.time(rowMeans(DT)[DT$SEX==1]+ system.time(rowMeans(DT)[DT$SEX==2]))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)+ system.time (mean(DT[DT$SEX==2,]$pwgtp15)))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
