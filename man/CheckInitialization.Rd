\name{CheckInitialization}
\alias{CheckInitialization}

\title{
The method 'CheckInitialization' in \link{IPPModel} class
}

\usage{
CheckInitialization(XDS, PredType, PredDim, ModelPackage, XB.Size, XB.SamplingMethod)
}

\arguments{
  \item{XDS}{the dataset of input features.}
  \item{PredType}{the type of prediction.}
  \item{PredDim}{indicating which class is predicted. }
  \item{ModelPackage}{the package name of the interpreted machine learning model.}
  \item{XB.Size}{the size of XB.Sample.}
  \item{XB.SamplingMethod}{the sampling method of XB.Sample.}
}

\description{
The method validates the arguments in the method \link{initialize}.
}
\value{
TRUE, if all arguments are validated.
FALSE, if at least one argument is not validated.
}

\seealso{
\link{IPPModel}
}
