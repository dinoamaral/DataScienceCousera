## Question 1
The American Community Survey distributes downloadable data about United States communities. Download the 2006 
microdata survey about housing for the state of Idaho using download.file() from here:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

and load the data into R. The code book, describing the variable names is here:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 
worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() 
function like this to identify the rows of the data frame where the logical vector is TRUE. 
which(agricultureLogical) What are the first 3 values that result?


data2 <- read.csv("./data/getdata-data-ss06hid.csv")
data <- data.table(data2)
agricultureLogical <- data$ACR == 3 & data$AGS == 6
which(agricultureLogical)[1:3]

## Question 2

Using the jpeg package read in the following picture of your instructor into R :
https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg

Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?

install.packages("jpeg")
library("jpeg")
url <- "http://d396qusza40orc.cloudfront.net/getdata/jeff.jpg"
download.file(url, destfile= "./data/jeff.jpg")
img <- readJPEG(f, native = TRUE)
quantile(img, probs = c(0.3, 0.8))

## Question 3
Load the Gross Domestic Product data for the 190 ranked countries in this data set:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

Load the educational data from this data set:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in 
descending order by GDP rank. What is the 13th country in the resulting data frame?

Original data sources: 
 - http://data.worldbank.org/data-catalog/GDP-ranking-table 
 - http://data.worldbank.org/data-catalog/ed-stats


url_gdp <- "http://d396qusza40orc.cloudfront.net/getdata/data/GDP.csv"
download.file(url_gdp, destfile = "./data/GDP.csv")
GDP <- read.csv("./data/GDP.csv", skip = 4, nrows=215)
dataGDP <- data.table(GDP)
dataGDP <- dataGDP[X != ""]
dataGDP <- dataGDP[, list(X, X.1, X.3, X.4)]
setnames(dataGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))

url_country <- "http://d396qusza40orc.cloudfront.net/getdata/data/EDSTATS_Country.csv"
download.file(url_country, destfile = "./data/EDSTATS_Country.csv")
EDSTATS <- read.csv("./data/EDSTATS_Country.csv")
dataEDSTATS <- data.table(EDSTATS)

data_merged <- merge(dataGDP, dataEDSTATS, all = TRUE, by = c("CountryCode"))
sum(!is.na(unique(data_merged$rankingGDP)))

data_merged[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y)][13]

## Question 4
What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

data_merged[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]
