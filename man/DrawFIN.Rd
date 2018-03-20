\name{DrawFIN}
\alias{DrawFIN}

\title{
The method 'DrawFIN' in \link{IPPModel} class
}

\usage{
DrawFIN(threshold = 0, lay.out = igraph::layout.auto)
}

\arguments{
  \item{threshold}{a numeric, the threshold of link weights. Only the links whose weights are greater than the threshold are shown in FIN.}
  \item{lay.out}{the layout defined in the package igraph.}
 }

\description{
The method draws the feature interaction network (FIN) based on the field \link{FIN.Data}.
}

\seealso{
\link{IPPModel}
}
