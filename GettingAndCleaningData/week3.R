set.seed(13435)
X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X <- X[sample(1:5), ]; X$var2[c(1,3)] = NA
X
X[,1]
X[,"var1"]
X[1:2, "var2"]
X[(X$var1 <= 3 & X$var3 >11),]
X[(X$var1 <= 3 | X$var3 >15),]
X[which(X$var2 > 8),]
sort(X$var1)
sort(X$var1, decreasing=TRUE)
sort(X$var2, na.last=TRUE)
X[order(X$var1), ]
X[order(X$var1, X$var3), ]
library(plyr)
arrange(X, var1)
arrange(X,desc(var1))
X$var4 <- rnorm(5)
X
Y <- rbind(X,rnorm(5))
Y
##Summarizing Data
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")
head(restData, n=3)
tail(restData, n=3)
summary(restData)
str(restData)
quantile(restData$councilDistrict, na.rm=TRUE)
quantile(restData$councilDistrict, probs=c(0.5, 0.75, 0.9))
table(restData$zipCode, useNA="ifany")
