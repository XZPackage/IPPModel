\name{initialize}
\alias{initialize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The method 'initialize' in \link{IPPModel} class
}
\usage{
initialize(XDS, PredFun, PredType, PredDim=1, ModelPackage, XB.Size=200,
           XB.SamplingMethod="joint")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{XDS}{ a data.frame, the dataset of input features. It is assigned to the field \link{X.Data}.}
  \item{PredFun}{an object, the prediction function. It is assigned to the field \link{Pred.Fun}.}
  \item{PredType}{a string, the type of prediction. It is assigned to the field \link{Pred.Type}.}
  \item{PredDim}{an integer, indicating which class is predicted. This field is used only for classification model. It is assigned to the field \link{Pred.Dimension}.}
  \item{ModelPackage}{a string, the package name of the interpreted machine learning model, such as "nnet" and "randomforest". It is assigned to the field \link{Model.Package}.}
  \item{XB.Size}{an integer, the size of \link{XB.Sample}. It is assigned to the field \link{XB.Size}.}
  \item{XB.SamplingMethod}{a string, the sampling method of XB.Sample, "joint" or "independent". "joint" means that all features are sampled from X.Data jointly. "independent" means that each feature is sampled independently; then all features are combined randomly. It is assigned to the field \link{XB.SamplingMethod}.}
}
\description{
The method initializes some fields and generate the field \link{ParaTable} by calling the method \link{GenerateParaTable}.
}
\seealso{
\link{IPPModel}
}

