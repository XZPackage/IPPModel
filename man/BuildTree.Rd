\name{BuildTree}
\alias{BuildTree}

\title{
The method 'BuildTree' in \link{IPPModel} class
}

\usage{
BuildTree()
}

\description{
The method builds tree models for each feature based on the clustering results \link{Clustering.Res}. The tree size is determined by the columns 'treeSize' and 'minSplit' in the field \link{ParaTable}. The method is executed in parallel using package \link{parallel}. Each feature corresponds to one core.
}
\value{
a list of tree rules of each feature. The result is saved in the field \link{TreeRules}.
}

\seealso{
\link{IPPModel}
}
