\name{visregList}
\alias{visregList}
\title{Join multiple visreg objects together in a list}
\description{
This function takes multiple visreg objects, from separate calls to
\code{visreg()}, and joins them together in a single object.  The single object
will be of type \code{visregList} unless \code{collapse=TRUE} is specified, in
which case the list will be collapsed back down into a single \code{visreg}
object.}
\usage{
visregList(..., labels, collapse=FALSE)
}
\arguments{
  \item{\dots}{
    \code{visreg} objects, as produced by calls to \code{\link{visreg}}.
  }

  \item{labels}{
    A character vector with length corresponding to the number of \code{visreg}
    objects passed to the function that provides labels for the different
    objects in subsequent plots.  Only has an effect if \code{collapse=TRUE}.
  }

  \item{collapse}{
    If \code{TRUE}, the resulting object will be collapsed down into a single
    \code{visreg} object.  If \code{FALSE}, the resulting object will be a
    \code{visregList}.
  }
}
\value{
  A \code{visreg} or \code{visregList} object, depending on the value of
  \code{collapse}.
}
\author{
  Patrick Breheny
}
\seealso{
  \code{\link{visreg}}
  \code{\link{plot.visreg}}
}
\examples{
fit <- lm(Ozone ~ Solar.R + Wind + Temp, data=airquality)
v1 <- visreg(fit, "Wind", plot=FALSE, alpha=0.2)
v2 <- visreg(fit, "Wind", plot=FALSE, alpha=0.01)
vv1 <- visregList(v1, v2, collapse=FALSE)
vv2 <- visregList(v1, v2, collapse=TRUE,
                  labels=c("Confidence: 0.80", "Confidence: 0.99"))
op <- par(mfrow=c(1,2))
plot(vv1)
par(op)
plot(vv2)
}
