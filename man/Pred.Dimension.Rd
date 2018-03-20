\name{Pred.Dimension}
\alias{Pred.Dimension}

\title{The field 'Pred.Dimension' in \link{IPPModel} class}

\description{
   Pred.Dimension is an integer, indicating which class is predicted. This field is used only for classification model. For example, the output field is assumed to have three classes, so Pred.Dimension can be 1, 2 or 3. If Pred.Dimension equals 1, then the first class is predicted and analyzed. Note that if Pred.Dimension is larger than 3, then it is reset to 1.
}

\seealso{
\link{IPPModel}
}
