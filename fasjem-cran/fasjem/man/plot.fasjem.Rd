\name{plot.fasjem}
\alias{plot.fasjem}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Plotting function for fasjem objects
}
\description{
  Plotting function for fasjem objects. This function implements plotting for either the original multiple graphs, the shared graph,
  the subject-specific networks, or the neighborhood networks for certain node.
}
\usage{
  \method{plot}{fasjem}(x, type="graph", subID=NULL, index=NULL, ...)
}
\arguments{
  \item{x}{
    fasjem object
  }
  \item{type}{
    Plotting type. This argument defines which type of network(s) is chosen by the user. There are four options:
    "graph": plot the original networks, "share": plot the shared graph, "sub": plot subject-specific network, and "neighbor": plot the neighborhood networks for a given node.
  }
  \item{subID}{
    If \code{type="sub"}, \code{subID} indicates which subject-specific network should be plotted.
  }
  \item{index}{
    If \code{type="neighbor"}, \code{index} indicates which node to choose for plotting the neighborhood networks.
  }
  \item{...}{
    Additional arguments to pass to plot function
  }
}
\details{
  Plotting function for fasjem objects. It can be used to plot simulated networks or results obtained from running fasjem algorithm.
}
\references{
Beilun Wang, Ji Gao, Yanjun Qi (2017). A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models. <http://proceedings.mlr.press/v54/wang17e/wang17e.pdf>
}
\author{
  Beilun Wang and Yanjun Qi
}
\seealso{
  \code{\link{fasjem}}
}
\examples{
  \dontrun{
    data(exampleData)
    results = fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
    plot.fasjem(results)
    plot.fasjem(results, type="share")
    plot.fasjem(results, type="sub", subID=1)
    plot.fasjem(results, type="neighbor", index=50)
  }
}
\keyword{ fasjem }
