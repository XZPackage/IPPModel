\name{Pred.Type}
\alias{Pred.Type}

\title{The description of the field 'Pred.Type' in \link{IPPModel} class}

\description{
Pred.Type is the type of prediction. The IPP model only supports interpreting the models with numeircal outputs, so Pred.Type is used to assure that the output is numeric, not class. The value of Pred.Type depends on what package is used. For example, if "nnet" is used to create \link{Pred.Fun}, Pred.Type should be "raw" for both classification and regression. If "randomForest" or "kernlab" is used, Pred.Type should be "prob" for classification, or be "response" for regression. If other package is used, you should reference the predict function of that package.
}

\seealso{
\link{IPPModel}
}
