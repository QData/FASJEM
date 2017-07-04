\name{net.neighbors}
\alias{net.neighbors}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get neighbors of a node in the network
}
\description{
For each class, returns the name of neighbour nodes connected to a given node.
}
\usage{
net.neighbors(theta, index)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theta}{
A list of pXp matrices, each element represents an estimated sparse inverse covariance matrix.  (For example, the result of SIMULE.)
}
  \item{index}{
The row number of the node to be investigated.
}
}

\value{
neighbors, a  length K list. Each element in the list is a vector including row names of the neighbour nodes for the index node.
}
\author{
Beilun Wang

Maintainer: Beilun Wang - bw4mw at virginia dot edu
}
\references{
Beilun Wang, Ji Gao, Yanjun Qi (2017). A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models. <http://proceedings.mlr.press/v54/wang17e/wang17e.pdf>
}

\examples{
## load an example dataset with K=2 tasks, p=100 features, and n=200 samples per task:
data(exampleData)
##run fasjem
result = fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
## get neighbors of node 50:
net.neighbors(result,index=50)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
