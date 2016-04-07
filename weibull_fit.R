#place defects.csv in your working directory and replace the path in read.csv below

defects <- read.csv("C:/Users/Andrew/Desktop/defects.csv")

#if you haven't already,
#install.packages("MASS")

library(MASS)

#MASS contains a function to fit to a specified distribution

fit = fitdistr(defects$Time,densfun = "weibull", start = list(scale = 1, shape = 2))

theo = pweibull(defects$Time, fit$estimate[2], fit$estimate[1], lower.tail = TRUE, log.p = FALSE)

plot(defects$Time, defects$C, col = 7)

lines(defects$Time, theo)
