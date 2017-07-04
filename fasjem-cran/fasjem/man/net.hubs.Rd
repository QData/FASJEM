\name{net.hubs}
\alias{net.hubs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get degrees of most connected nodes.
}
\description{
List the degrees of the hub nodes in each class.
}
\usage{
net.hubs(theta, nhubs = 10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theta}{
A list of pXp matrices, each element represents an estimated sparse inverse covariance matrix.
}
  \item{nhubs}{
The number of hubs to be identified.
}
}

\value{
hubs, a length K list. Each element in the list is a vector of Length n hubs giving the degree of the most connected nodes of the corresponding class.}
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
## get hubs list:
net.hubs(result)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
