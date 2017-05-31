\name{net.edges}
\alias{net.edges}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List the edges in a network
}
\description{
For each class, list every edge in the form of pair of connected nodes.
}
\usage{
net.edges(theta)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theta}{
A list of pXp matrices, each element of the list represents an estimated sparse inverse covariance matrix.  (For example, the result of SIMULE.)
}
}

\value{
edges, a length K list, each element of the list represents an igraph.es object which is the detail of all pairs of connected nodes in the class.
}
\author{
Beilun Wang

Maintainer: Beilun Wang - bw4mw at virginia dot edu
}
\references{
Beilun Wang, Ji Gao, Yanjun Qi (2017). A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models. <https://www.cs.virginia.edu/yanjun/paperA14/2017_JEM_combined.pdf>
}
\examples{
## load an example dataset with K=two tasks, p=100 features, and n=200 samples per task:
data(exampleData)
##run fasjem
result = fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
## get edges list:
net.edges(result)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
