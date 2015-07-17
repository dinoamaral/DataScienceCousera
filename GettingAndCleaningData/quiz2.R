## Question 2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata/data/ss06pid.csv"
download.file(fileUrl, destfile="./data/ss06pid.csv", method="curl")
install.packages("sqldf")
library(sqldf)
acs <- read.csv.sql("./data/ss06pid.csv", header=T, sep=",")
sqldf("select pwgtp1 from acs where AGEP < 50")

## Question 3
sqldf("select distinct AGEP from acs")

## Question 4
library(httr)
http <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(http)
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)

## Question 5
file <- "http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"
download.file(file, destfile= "./data/wksst8110.for")
list.files("./data")
file_down <- read.csv("./data/wksst8110.for", header = T)
dim(file_down)
fd <- "./data/wksst8110.for"
file <- read.fwf(file=fd, widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4))
sum(file[ ,4])