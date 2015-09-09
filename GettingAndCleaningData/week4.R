url <- "https://d396qusza40orc.cloudfront.net/getdata/data/ss06hid.csv"
download.file(url,destfile="~/Dropbox/Coursera/datasciencecoursera/GettingAndCleaningData/data/ss06hid.csv", method="curl")
houseData <- read.csv("~/Dropbox/Coursera/datasciencecoursera/GettingAndCleaningData/data/ss06hid.csv")
names(houseData)
strsplit(names(houseData), "wgtp")[123]


url2 <- "https://d396qusza40orc.cloudfront.net/getdata/data/GDP.csv"
download.file(url2, destfile="~/Dropbox/Coursera/datasciencecoursera/GettingAndCleaningData/data/GDP.csv", method="curl")
GDP <- read.csv("~/Dropbox/Coursera/datasciencecoursera/GettingAndCleaningData/data/GDP.csv")
