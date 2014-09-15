###########################################################
# Name: Connor Hoene
# PID: konnor6
# Date: 8/31/14
# Class: CMDA 3654
# Homework #: 1
#
# github account: https://github.com/more-coffee
###########################################################

###################
# PROBLEM 1
###################

#my working directory path is kind of long. Sorry about that.
setwd("C:\\Users\\cnr\\Documents\\School\\Senior Fall 2014\\CMDA 3654 (Data Analytics and Visual)\\R scripts") #need double backslash on PC
getwd()

#6) Find out using R help how to import the prices dataset with no header and create variable 
#names for the created R data frame within the read.table function, with the help of the 
#col.names argument. Print your data frame and ascertain that the header was assigned 
#correctly. Prices dataset is on Scholar in "Data" folder.

varNames = c("PRICE", "SQFT", "AGE", "NE")
mydatatxt = read.table('prices.txt', sep='\t', header=FALSE, col.names = varNames)  


names(mydatatxt)
#Print out dataframe to verify correct variable names
mydatatxt

#7) Find out what row.names argument does (for function read.table). Describe in one line 
# comment.

# row.names:
# This argument represents a vector of row names. It can be the vector giving actual row names, a single
# number giving the column of the table which contains the row names, or character string giving the name
# of the table column containing the row names.


#Read small file into R so that the variable names are a, b, and c
abcVarNames = c("a", "b", "c")
abcdata = read.table('abc.txt', sep='\t', header = FALSE, col.names = abcVarNames)
abcdata



###################
# PROBLEM 2
###################

col1 = c(4, 0, 0, 1)
col2 = c(0, 0, 1, 0)
col3 = c(0, 2, 2, 0)
col4 = c(0, 0, 0, 1)

#create matrix with cbind
MAT1 = cbind(col1, col2, col3, col4)
MAT1
#list last element w/ one command
MAT1[4, 4]

#transpose matrix
t(MAT1)

#inverse matrix
solve(MAT1)


###################
# PROBLEM 3
###################

fpe <- read.table("http://data.princeton.edu/wws509/datasets/effort.dat")

#2) For the fpe dataset, print out only the observations with 0 effort.
fpe[fpe$effort == 0,]

#3) For the fpe dataset print the names of the variables using one function.
names(fpe)

#4) For the fpe dataset print the names of the rows using one function.
row.names(fpe)

#5) Find out what the head() function does and print out the result for the fpe data frame.
# The head function displays the first six entries in a dataset by default
head(fpe)

#6) Export your fpe data frame as both a text and a csv file.
#From R to a csv file
write.csv(fpe, file="effort.csv") 
#From R to a text document
write.table(fpe, file="effort.txt", sep="\t")
