\name{schedulingData}
\docType{data}
\alias{schedulingData}
\title{HPC Job Scheduling Data}
\description{
These data consist of informaiton on 4331 jobs in a high performance computing environment. Seven attributes were recorded for each job aling with a discrete class describing the execution time. 

The predcitors are: \code{Protocol} (the type of computation), \code{Compounds} (the number of data points for each jobs), \code{InputFields} (the number of characteristic being estimated), \code{Iterations} (maximum number of iterations for the computations), \code{NumPending} (the number of other jobs pending at the time of launch), \code{Hour} (decimal hour of day for launch time) and \code{Day} (of launch time).

The classes are: \code{VF} (very fast), \code{F} (fast), \code{M} (moderate) and \code{L} (long).
}

\usage{data(schedulingData)}

\value{
  \item{schedulingData}{a data frame with 4331 rows and 8 columns}
  }

\examples{
data(schedulingData)

library(caret)

set.seed(1104)
inTrain <- createDataPartition(schedulingData$Class, p = .8, list = FALSE)

schedulingData$NumPending <- schedulingData$NumPending + 1

trainData <- schedulingData[ inTrain,]
testData  <- schedulingData[-inTrain,]

modForm <- as.formula(Class ~ Protocol + log10(Compounds) +
                      log10(InputFields)+ log10(Iterations) +
                      log10(NumPending) + Hour + Day)


cost <- function(pred, obs)
  {
    isNA <- is.na(pred)
    if(!all(isNA))
      {
        pred <- pred[!isNA]
        obs <- obs[!isNA]

        cost <- ifelse(pred == obs, 0, 1)
        if(any(pred == "VF" & obs == "L")) cost[pred == "L" & obs == "VF"] <- 10
        if(any(pred == "F" & obs == "L")) cost[pred == "F" & obs == "L"] <- 5
        if(any(pred == "F" & obs == "M")) cost[pred == "F" & obs == "M"] <- 5
        if(any(pred == "VF" & obs == "M")) cost[pred == "VF" & obs == "M"] <- 5
        out <- mean(cost)
      } else out <- NA
    out
  }

costSummary <- function (data, lev = NULL, model = NULL)
{
    if (is.character(data$obs))  data$obs <- factor(data$obs, levels = lev)
    c(postResample(data[, "pred"], data[, "obs"]),
      Cost = cost(data[, "pred"], data[, "obs"]))
}

ctrl <- trainControl(method = "repeatedcv", repeats = 5,
                     summaryFunction = costSummary)
}

\keyword{datasets}  

