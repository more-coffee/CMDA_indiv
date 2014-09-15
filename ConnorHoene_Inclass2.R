#Name: Connor Hoene (PID: konnor6)
#Date: 9/14/14

################################
#IN CLASS ASSIGNMENT 2 - PART 1#
################################


getwd()
setwd("C:\\Users\\cnr\\Documents\\School\\Senior Fall 2014\\CMDA 3654 (Data Analytics and Visual)\\R scripts")

#The health insurance customer data
load('exampleData.rData')
#Examine data
names(custdata)
dim(custdata)
class(custdata)

#Summary statistics

summary(custdata) #for the entire data frame

#look at individual variables to spot problems

#There are 328 NA's, which is ambigious about whether or not they meant NA to mean False or not.
summary(custdata$is.employed)

#The Min. value is negative
summary(custdata$income)

#The Max. value is 146.7, which seems very high.
summary(custdata$age)

#There doesn't seem to be a problem here
summary(custdata$state.of.res)

#No problems here.
summary(custdata$custid)

#No problems here.
summary(custdata$sex)

#The length is 0, the class is NULL and the Mode is also NULL. Not sure what is meant by this
summary(custdata$martial.stat)

#No problems here.
summary(custdata$health.ins)

#There are 56 NA's, which could mean no rent. Leads to ambiguity.
summary(custdata$housing.type)

#There are 56 NA's, which could mean False. Leads to ambiguity.
summary(custdata$recent.move)

#There are 56 NA's, which could mean 0 vehicles. Leads to ambiguity. Also the mean is not an integer,
#which isn't much of a problem, but you can't own 1.916 vehicles.
summary(custdata$num.vehicles)

#No problems here. The NULL entries have been fixed.
summary(custdata$is.employed.fix1)

#This data seems strange. The Min. age is negative, as is the 1st Qu. and Median. The Mean is 0 and the Max. age is 5.
#not sure if this is how the data should be.
summary(custdata$age.normalized)

#No problems here.
summary(custdata$Median.Income)

#This data seems a bit strange in that the Min. income is negative. The range between Min and Max is only about 12
#so I'm assuming I'm reading the term "norm" wrong when the variable is labeled "something.norm"
summary(custdata$income.norm)

#No problems here.
summary(custdata$gp)

#The class and Mode fields are NULL.
summary(custdata$income.lt.30k)

#No problems here.
summary(custdata$age.range)

#This seems fine except that there are 328 NA's in the data, leading to ambiguity since someone could
#interpret an NA as $0 income.
summary(custdata$Income)




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Read in the uciCar data frame
uciCar <- read.table(
  'http://www.win-vector.com/dfiles/car.data.csv',
  sep=',',
  header=T
)



names(uciCar)

#The data in this data frame contains no missing values, which is good.
#It seems like most of the numbers for each variable are equal. For
#example the "buying" variable has 432 entries for high, low, med, and vhigh.
summary(uciCar)
#There are 432 entries for all fields of the buying variable. No problems with
#this data.
summary(uciCar$buying)
#Same as the 'buying' variable. No problems.
summary(uciCar$maint)
#Same as the 'buying' and 'maint' variables. No problems.
summary(uciCar$doors)
#Same as the previous variables. No problems.
summary(uciCar$persons)
#Same as the previous variables. No problems.
summary(uciCar$lug_boot)
#Same as the previous variables. No problems.
summary(uciCar$safety)
#This is the only row where the numbers aren't equal. Regardless the data
#still seems sound and there are no missing values.
summary(uciCar$rating)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Load credit.Rdata in explore numerical summary for personal status and sex.

load("credit.RData")

names(d)

#How do genders compare in terms of martial status?
#For some reason, there are 3 separate information fields for males and only
#one for females. The females field is 'divorced/separated/married' and there
#are 310 entries in this field. Then there are 50 entries in the 'divorced/separated'
#field for males, 92 entries in the 'married/widowed' field for males, and 548 entries
#in the 'single' field for males. This leads me to assume there is a gender bias
#here and prevents useful conclusions from being taken out of this variable.
summary(d$Personal.status.and.sex)

#What do you glean as information about German loans?
#There are 41 co-applicants, 52 guarantors, and 907 in the category of 'none'
#The 'none' field is misleading because it's ambiguous as to what it actually
#means by none. Does none mean that there are 907 people who are debtors?
#Or does it mean that there are 907 people who haven't taken out a loan and
#are neither a co-applicant nor a guarantor?
#Assuming that it means that 907 people are debtors since that is the topic
#of the variable, this means that a lot more people are taking loans out
#from only 52 guarantors. There are very few co-applicants compared to the
#overall amount of debtors (only 41), making me assume that co-applicants are
#not all that important. This probably means that most people in Germany 
#don't need to increase their odds of receiving a loan by relying on
#a co-applicant. And that probably means that most Germans have good credit.
summary(d$Other.debtors)



################################
#IN CLASS ASSIGNMENT 2 - PART 2#
################################

#Install 'hexbin' package
install.packages("hexbin")
library(ggplot2)
library(hexbin)

#extract a subset of the dataset with reasonable values for the two 
#variables
custdata2 <- subset(custdata,
                    (custdata$age > 0 & custdata$age < 100
                     & custdata$income > 0))


#Create hexbin plot for the age and income variables in custdata2 dataframe
ggplot(custdata2, aes(x=age, y=income)) +
  geom_hex(binwidth=c(5, 10000)) +
  geom_smooth(color="white", se=F) +
  ylim(0,200000)

#How does this hexbin plot compare to the scatterplot?
ggplot(custdata2, aes(x=age, y=income)) +
  geom_point(binwidth=c(5, 10000)) +
  geom_smooth(color="white", se=F) +
  ylim(0,200000)

#The hexbin plot is similar to the scatterplot. Where it differs is that
#it groups together points on the scatterplot into hexbins and colors them
#according to how many of these points are in each bin. This provides a visually
#appealing way to represent the frequency of certain data pairs in terms of income
#and age. It also shows the distribution of the data much better.


#Visualize the relationship between the variables 
#'Number of vehicles' and 'Income'. What type 
#of chart do you use? What do you see?
ggplot(custdata2, aes(x=num.vehicles, y=income)) +
  geom_hex(binwidth=c(1, 10000)) +
  geom_smooth(color="white", se=F) +
  ylim(0,200000)

#I used a hexbin to visualize the relationship between income and # of vehicles.
#I chose the hexbin because both variables have discrete values and ranges.
#The 2 variables also don't necessarily depend on each other, making a scatterplot
#or hexbin plot a good choice.
#Upon creating the chart I have determined that most people have 1 to 2 vehicles and 
#the people who have this number of vehicles mostly make between $25000 to $75000 as
#their income.


#Visualize the relationship between the variables 
#'income less than 30k' and 'recent move'. 
#What type of chart do you select? What do you see?

ggplot(custdata) + geom_bar(aes(x=income.lt.30K,
                                fill=recent.move),
                                position="fill")

#I used a filled bar chart for the relationship between income less than 30K and recent move.
#I used this type of chart because both of these variables are boolean values, making a 
#bar chart very useful when comparing the frequency of true/false statistics.
#Upon creating the chart, I see that most people with an income lower than 30K and most people
#with an income above 30K have not recently moved. There is actually a comparably equal amount
#of people below and above 30K income who have recently moved. It seems like 
#there are more people that have not recently moved in the less than 30K income category, which makes
#sense, but I cannot be absolutely sure of this since there are more NA values in the income greater than
#30K column.