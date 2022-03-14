# Course Statistics for Data Scientists 2019-2020
# Case Study Linear Mixed Models

#reading the data from file
mydata<-read.table('DATARationSplitPlot.txt',header=T)
mydata
attach(mydata)

# changing variates to factors
Pair<-factor(pair)
Ration<-factor(ration)
Sex<-factor(sex,labels=c('male','female'))

...