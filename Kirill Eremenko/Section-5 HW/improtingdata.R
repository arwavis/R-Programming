?read.csv()

# 1st Method : Select the file Manually This method prompts you to select the file manually and
# save the dataframe to variable called stats.

 stats <- read.csv(file.choose())
stats

# 2nd Method : Set the Working Directory and read data from the Working Directory
getwd()
setwd("C:\\Users\\aravindv\\Documents\\Github-projects\\R-Programming\\Kirill Eremenko\\Section-5 HW")

getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
stats

#------------------------------------------Exploring Data
nrow(stats) # Shows number of rows
ncol(stats) # Shows number of columns
head(stats, n=10) # Shows first 5 rows
tail(stats, n=8) # Shows last 5 rows
str(stats) # Shows the structure of the data
runif(stats)
summary(stats)

#------------------------------------------ Using $ Sign

head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users
# Is same as using
stats[, "Internet.users"]
stats$Internet.users[2]
levels(stats$Income.Group)


#------------------------------------------ Basic Operations with a DF
# Subsetting
stats[1:10,]
stats[3:9,]  
stats[c(4,100),]
#Remember how the [] work:
stats[1,]
is.data.frame(stats[1,]) # I DF there is no need to use drop=F
stats[,1]
is.data.frame(stats[,1])
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])


# Multiply column
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
stats$Birth.rate - stats$Internet.users

# Adding a column
head(stats)
stats$MyCalc <-stats$Birth.rate * stats$Internet.users
head(stats)

# test of knowledge
stats$xyz <-1:5
stats

# Remove a column
head(stats)
stats$xyz <- NULL
head(stats)
stats$MyCalc <- NULL
head(stats)

#------------------------------------------ Filtering DataFrames

head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income" & stats$Internet.users > 95,]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]

#------------------------------------------ Qplot Visualization
library(ggplot2)
?qplot
qplot(data = stats, x=Internet.users)
qplot(data = stats, x=Income.Group, y=Birth.rate)
qplot(data = stats, x=Income.Group, y=Birth.rate, size =I(3))
qplot(data = stats, x=Income.Group, y=Birth.rate, size =I(3) , color =I("red"))
qplot(data = stats, x=Income.Group, y=Birth.rate,geom = "boxplot")

#------------------------------------------ Visualizing what is required.
qplot(data = stats,x =Internet.users, y=Birth.rate)
qplot(data = stats,x =Internet.users, y=Birth.rate,
     color = I("red"),size = I(4))
qplot(data = stats,x =Internet.users, y=Birth.rate,
      color = Income.Group ,size = I(5))
      
#------------------------------------------ Creating Dataframe.
# This is the easiest way to create a new DataFrame from Vector.
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
# Helps change/Re-define column Name
colnames(mydf) <- c("Country" , "Code", "Region")
head(mydf)
summary(mydf)

# Second way of create Dataframe combining the change of column names.
#mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
#head(mydf)

#------------------------------------------ Merging Dataframe.
head(stats)
head(mydf)      

merged <- merge(stats, mydf, by.x ="Country.Code", by.y = "Code")
head(merged)
# To remove duplicate Coumtry column
merged$Country <- NULL
str(merged)
head(merged)

#------------------------------------------  Visualizing the Merged Data

qplot(data = merged,x =Internet.users, y=Birth.rate,
      color = Region ,size = I(5))
# change shapes
qplot(data = merged,x =Internet.users, y=Birth.rate,
      color = Region ,size = I(5), shape = I(17))
# Transparency 
qplot(data = merged,x =Internet.users, y=Birth.rate,
      color = Region ,size = I(5), shape = I(19), alpha = I(0.6))

# Title
qplot(data = merged,x =Internet.users, y=Birth.rate,
      color = Region ,size = I(5), shape = I(19), alpha = I(0.6), main="Birth Rate Vs Internet Users")
