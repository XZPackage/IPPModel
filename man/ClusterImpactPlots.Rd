\name{ClusterImpactPlots}
\alias{ClusterImpactPlots}

\title{
The method 'ClusterImpactPlots' in \link{IPPModel} class
}

\usage{
ClusterImpactPlots()
}

\description{
Cluster impact curves to generate impact pattern plots.
}
\value{
a list of clustering results of each feature. The result is saved in the field \link{Clustering.Res}.
}

\details{
The method clusters the impact curves of each feature based on the predicting results \link{Pred.Res}. The parameters of the clustering process are defined in the field \link{ParaTable}.
The clustering method is defined by the column 'clusteringMethod';
The distance measure is defined by the 'distMeasure'; the column 'centralized' determines if the impact curves are centralized or not before clustering; the 'autoK' tells if the number of clusters is determined automatically by Dunn index or not; the 'numK' determines the maximum number of clusters if autoK = TRUE; otherwise, the 'numK' means the number of clusters. The method is executed in parallel using package \link{parallel}. Each feature corresponds to one core.
}

\seealso{
\link{IPPModel}
}


