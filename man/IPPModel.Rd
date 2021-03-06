% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/IPPModel.R
\docType{class}
\name{IPPModel}
\alias{IPPModel}
\alias{IPP}
\alias{FIN}
\title{Class providing object with methods for drawing IPPs and FIN}
\format{\code{R6Class} object.}
\usage{
IPPModel
}
\value{
Object of \code{R6Class} with methods for drawing IPPs and FIN.
}
\description{
The class provides objects with methods for drawing impact pattern plots (IPPs) and feature interaction network (FIN).
}
\section{Fields}{

\describe{
\item{\code{\link{X.Data}}}{a data.frame, the dataset of input features.}

\item{\code{\link{Pred.Fun}}}{an object, the prediction function. It can be any
model created by "nnet", "randomforest" and "kernlab" etc.}

\item{\code{\link{Model.Package}}}{a string, the package name of the interpreted
machine learning model, such as "nnet" and "randomforest".}

\item{\code{\link{Pred.Type}}}{a string, the type of prediction.}

\item{\code{\link{Pred.Dimension}}}{an integer, indicating which class is predicted.
This field is used only for classification model.}

\item{\code{\link{XB.Size}}}{an integer, the size of \link{XB.Sample}.}

\item{\code{\link{XB.SamplingMethod}}}{a string, the sampling method of
\link{XB.Sample}, "joint" or "independent". "joint" means that all features
are sampled from \link{X.Data} jointly. "independent" means that each
feature is sampled independently; then all features are combined randomly.}

\item{\code{\link{ParaTable}}}{a data.frame, the parameter table. It is generated by
method \link{GenerateParaTable}.}

\item{\code{\link{XA.Sample}}}{a list, the sample of X_A extracted from
\link{X.Data}. It is generated by method \link{SamplingXA}.}

\item{\code{\link{XB.Sample}}}{a list, the sample of X_B extracted from
\link{X.Data}. It is generated by method \link{SamplingXB}.}

\item{\code{\link{Pred.Res}}}{a list, the prediction results of f(X_A,X_B), which is
generated by method \link{PredictData}.}

\item{\code{\link{Clustering.Res}}}{a list, the clustering results, which is
generated by method \link{ClusterImpactPlots}.}

\item{\code{\link{TreeRules}}}{a list, the decision tree rules, which is generated
by method \link{BuildTree}.}

\item{\code{\link{FIN.Data}}}{a data.frame, the feature interaction network, which
is generated by method \link{BuildTree}.}

\item{\code{\link{ColorList}}}{a list, the curve colors used for drawing IPPs.}

\item{\code{\link{TaskFinishTime}}}{a list, the finishing time of tasks.}
}}

\section{Methods}{
 \describe{ \item{\link{initialize}}{initialize some fields
  of object and excute the method \link{CheckInitialization} and
  \link{GenerateParaTable}.} \item{\link{CheckInitialization}}{validate the
  initialization information.} \item{\link{GenerateParaTable}}{Generate the
  parameter table \link{ParaTable}. } \item{\link{CheckParaTable}}{validate
  the information in \link{ParaTable}.} \item{\link{SamplingXA}}{sampling
  \link{XA.Sample} from \link{X.Data}.} \item{\link{SamplingXB}}{sampling
  \link{XB.Sample} from \link{X.Data}.} \item{\link{PredictData}}{predict
  data using \link{Pred.Fun} based on \link{XA.Sample} and \link{XB.Sample}.}
  \item{\link{ClusterImpactPlots}}{cluster the impact curves of each feature
  based on the predicting results \link{Pred.Res}.}
  \item{\link{BuildTree}}{build decision tree based on the clustering results
  \link{Clustering.Res}.} \item{\link{DrawIPP}}{draw the impact pattern
  plots.} \item{\link{DrawFIN}}{draw the feature interaction network.}
  \item{\link{WriteToExcel}}{write the results to an excel file.}
  \item{\link{ExecuteAll}}{execute the methods \link{SamplingXA},
  \link{SamplingXB}, \link{PredictData}, \link{ClusterImpactPlots} and
  \link{BuildTree} in sequence.}

  }
}

\examples{
library(IPPModel)
library(igraph)

#------ FIRST EXAMPLE ------
library(nnet)
data("bank")
# build model
bank.NN <- nnet(y ~ ., data = bank, size = 5, maxit = 1000)
# remove the output variable
bank.ds = bank[-17]
# create IPPModel object
IPP.bank = IPPModel$new(XDS=bank.ds, PredFun=bank.NN,
                        ModelPackage="nnet", PredType="raw", PredDim=1,
                        XB.Size=1000, XB.SamplingMethod="joint")
# modify the clustering method to "kmedoids"
IPP.bank$ParaTable$clusteringMethod = "kmedoids"
# execute all tasks
IPP.bank$ExecuteAll()
# draw impact pattern plots (IPP)
IPP.bank$DrawIPP(centralized = TRUE, nc = 4)
# draw feature interaction network (FIN)
IPP.bank$DrawFIN(threshold = 0.2, lay.out = igraph::layout.auto)
# write the results into an excel file
IPP.bank$WriteToExcel("output.xlsx")

#------ SECOND EXAMPLE ------
library(randomForest)
data("whitewine")
# build model
WW.RF <- randomForest(quality ~ ., data = whitewine, mtry = 4,importance=TRUE, na.action=na.omit)
# remove the output variable
WW.ds = whitewine[-12]
# create IPPModel object
IPP.WW = IPPModel$new(XDS=WW.ds, PredFun=WW.RF,
                      ModelPackage="randomForest", PredType="response", PredDim=1,
                      XB.Size=1000, XB.SamplingMethod="joint")
# set the maximum depth of trees to be 5
IPP.WW$ParaTable$treeDepth = 5
# execute all tasks
IPP.WW$ExecuteAll()
# draw impact pattern plots (IPP)
IPP.WW$DrawIPP(centralized = TRUE, nc = 4)
# draw feature interaction network (FIN)
IPP.WW$DrawFIN(threshold = 0.1, lay.out = igraph::layout.circle)

#------ THIRD EXAMPLE ------
library(kernlab)
data("iris")
iris.SVM <- ksvm(Species ~ ., data = iris,kernel="rbfdot", kpar="automatic",C=0.1, prob.model = TRUE)
# remove the output variable
iris.ds = iris[-5]
# create IPPModel object
IPP.iris = IPPModel$new(XDS=iris.ds, PredFun=iris.SVM,
                        ModelPackage="kernlab", PredType="prob", PredDim=1,
                        XB.Size=200, XB.SamplingMethod="independent")
# execute the tasks step by step
IPP.iris$SamplingXA()  # sampling XA
IPP.iris$SamplingXB()  # sampling XB
IPP.iris$PredictData()  # predict
IPP.iris$ClusterImpactPlots() # clustering impact plots
IPP.iris$BuildTree()  # build tree
# draw impact pattern plots (IPP)
IPP.iris$DrawIPP(centralized = TRUE, nc = 4)
# draw feature interaction network (FIN)
IPP.iris$DrawFIN(threshold = 0.3, lay.out = igraph::layout.auto)
# write the results into an excel file
IPP.iris$WriteToExcel("output.xlsx")

}
\references{
Xiaohang Zhang, Ji Zhu, SuBang Choe, Yi Lu and Jing Liu.
  Exploring black box of supervised learning models: Visualizing the impact
  of features on prediction. Working paper.
}
\keyword{data}
