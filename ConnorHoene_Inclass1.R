# Name: Connor Hoene
# PID: konnor6
# In class assignment 1



setwd("C:\\Users\\cnr\\Documents\\School\\Senior Fall 2014\\CMDA 3654 (Data Analytics and Visual)\\R scripts\\CMDA\\CMDA_indiv")

cardata = read.table('cars1.csv', sep=',', header=T)

#get number of rows
nrow(cardata)
#get number of columns
ncol(cardata)
#get dimensions of data frame
dim(cardata)


var1 = cardata[2, 2]

#variable names in this data frame
names(cardata)

#output of first column
cardata[,1]
#output of second column
cardata[,2]

#assign speed values to SPEED
SPEED = cardata$speed

#output row 15
cardata[15,]

