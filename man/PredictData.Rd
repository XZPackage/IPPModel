\name{PredictData}
\alias{PredictData}

\title{
The method 'PredictData' in \link{IPPModel} class
}

\usage{
PredictData()
}

\description{
The method predicts data using \link{Pred.Fun} based on \link{XA.Sample} and \link{XB.Sample}. The method is executed in parallel using package \link{parallel}. Each feature corresponds to one core.
}
\value{
a list of predicting results of each feature. The result is saved in the field \link{Pred.Res}.
}

\seealso{
\link{IPPModel}
}
