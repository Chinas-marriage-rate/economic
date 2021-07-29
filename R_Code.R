setwd("C:/Users/19312/Desktop/cran")
#Importing data into R
data<-read.csv("GDP.CFRM.csv",header=TRUE,sep = ",")
head(data)
attach(data)
#Handling the missing values
install.packages("mice")
#Load "mice" package
library(mice)
#Creating a dataframe for missing values
# Multiple imputation
missing = data[c("GDP.AP", "POPTHM.AP", "INTDSRUSM193.AP", "DGS10.AP","DSPI.AP","U2RATE.AP","USSTHPI.AP")]
summary(missing)
str(missing)

set.seed(5000) #To ensure reproducibility(not necessary)
#Perform the imputation on the missing data
imputed = complete(mice(missing))
summary(imputed)
#filling the original dataframe with the imputed data
data$GDP.AP = imputed$GDP.AP
data$POPTHM.AP = imputed$POPTHM.AP
data$INTDSRUSM193.AP = imputed$INTDSRUSM193.AP
data$DGS10.AP = imputed$DGS10.AP
data$DSPI.AP = imputed$DSPI.AP
data$U2RATE.AP = imputed$U2RATE.AP
data$USSTHPI.AP = imputed$USSTHPI.AP
summary(data) #To ensure we no longer have missing values
# Model
model = lm(GDP.AP~POPTHM.AP + INTDSRUSM193.AP + DGS10.AP + DSPI.AP + U2RATE.AP + USSTHPI.AP, data=data)
#Model Summary
summary(model)

#VIF
library(car)
vif1<-vif(model)
barplot(vif1, main = "VIF Values", horiz = TRUE, col = "green")
#add vertical line at 5
abline(v = 2, lwd = 3, lty = 2)
#Actual vs fitted value plot
plot(GDP.AP~POPTHM.AP, ylab="GDP Annual Percent" ,xlab="Population Annual Percent",main = "Plot of Annual GDP Vs Annual Population")
res = lm(GDP.AP~POPTHM.AP)
abline(res)

#Adding More Variables
#Corporate Profit
corporate_P<- read.csv("CPn.csv", stringsAsFactors=FALSE)
head(corporate_P)
tail(corporate_P)
#Merging the "Corp.AP" variable to the original data
data_n <- merge(data,corporate_P, by ="DATE")
#Check if updated
head(data_n)
str(data_n)
summary(data_n)
#Handle the missing values
missing1 = data_n[c("GDP.AP", "POPTHM.AP", "INTDSRUSM193.AP", "DGS10.AP","DSPI.AP","U2RATE.AP","USSTHPI.AP","Corp.AP")]
summary(missing1)
str(missing1)
set.seed(5000) #To ensure reproducibility(not necessary)
#Perform the imputation on the missing data
imputed1 = complete(mice(missing1))
summary(imputed1)
#filling the original dataframe with the imputed data
data_n$GDP.AP = imputed1$GDP.AP
data_n$POPTHM.AP = imputed1$POPTHM.AP
data_n$INTDSRUSM193.AP = imputed1$INTDSRUSM193.AP
data_n$DGS10.AP = imputed1$DGS10.AP
data_n$DSPI.AP = imputed1$DSPI.AP
data_n$U2RATE.AP = imputed1$U2RATE.AP
data_n$USSTHPI.AP = imputed1$USSTHPI.AP
data_n$Corp.AP = imputed1$Corp.AP
summary(data_n) #To ensure we no longer have missing values
library(mice)
#Modeling the updated data
model_n = lm(GDP.AP~POPTHM.AP + INTDSRUSM193.AP + DGS10.AP + DSPI.AP + U2RATE.AP + USSTHPI.AP + Corp.AP, data=data_n)
#Model Summary
summary(model_n)
#VIF
library(car)
vif2<-vif(model_n);vif2
barplot(vif2, main = "VIF Values", horiz = TRUE, col = "red")
#add vertical line at 5
abline(v = 2, lwd = 3, lty = 2)
#10-Year Breakeven inflation rate(T10YIE)
inflation<- read.csv("T10YIE_p.csv", stringsAsFactors=FALSE)
head(inflation)
tail(inflation)
#Merging the "inflation rate" variable to the original data
data_n1 <- merge(data_n,inflation, by ="DATE")
#Check if updated
head(data_n1)
str(data_n1)
summary(data_n1)
#Handle the missing values
missing2 = data_n1[c("GDP.AP", "POPTHM.AP", "INTDSRUSM193.AP", "DGS10.AP","DSPI.AP","U2RATE.AP","USSTHPI.AP","Corp.AP","T10YIE.AP")]
summary(missing2)
str(missing2)
set.seed(4000) #To ensure reproducibility(not necessary)
#Perform the imputation on the missing data
imputed2 = complete(mice(missing2))
summary(imputed2)
#filling the original dataframe with the imputed data
data_n1$GDP.AP = imputed2$GDP.AP
data_n1$POPTHM.AP = imputed2$POPTHM.AP
data_n1$INTDSRUSM193.AP = imputed2$INTDSRUSM193.AP
data_n1$DGS10.AP = imputed2$DGS10.AP
data_n1$DSPI.AP = imputed2$DSPI.AP
data_n1$U2RATE.AP = imputed2$U2RATE.AP
data_n1$USSTHPI.AP = imputed2$USSTHPI.AP
data_n1$Corp.AP = imputed2$Corp.AP
data_n1$T10YIE.AP = imputed2$T10YIE.AP
summary(data_n1) #To ensure we no longer have missing values
library(mice)
#Modeling the updated data
model_n1 = lm(GDP.AP~POPTHM.AP + INTDSRUSM193.AP + DGS10.AP + DSPI.AP + U2RATE.AP + USSTHPI.AP + Corp.AP + T10YIE.AP, data=data_n1)
#Model Summary
summary(model_n1)
#VIF
library(car)
vif3<-vif(model_n1);vif3
barplot(vif3, main = "VIF Values", horiz = TRUE, col = "green")
#add vertical line at VIF=2
abline(v = 2, lwd = 3, lty = 2, col="red")
