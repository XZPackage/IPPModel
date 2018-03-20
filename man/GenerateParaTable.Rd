\name{GenerateParaTable}
\alias{GenerateParaTable}
\title{
The method 'GenerateParaTable' in \link{IPPModel} class
}

\usage{
GenerateParaTable()
}

\description{
This method generates the field \link{ParaTable} based on the field \link{X.Data}.
}
\value{
a data.frame, which is assigned to the field \link{ParaTable}.
}

\seealso{
\link{IPPModel}
}

\note{
The method generates \link{ParaTable} based on the data in \link{X.Data} and some fixed rules, so the result may be wrong. Please check the information in ParaTable carefully before continuing the other tasks.
}
