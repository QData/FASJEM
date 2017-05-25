\name{net.hubs}
\alias{net.hubs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get degrees of most connected nodes.
}
\description{
List the degrees of the most connected nodes in each class.
}
\usage{
net.hubs(theta, nhubs = 10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theta}{
A list of pXp matrices, each an estimated sparse inverse covariance matrix.  (For example, the result of FGL or GGL.)
}
  \item{nhubs}{
The number of hubs to be identified.  net.hubs() will list the degree of the nhubs most connected nodes in each class.
}
}

\value{
hubs, a list of length K, each element of which is a vector giving the degree of the most connected nodes in the corresponding class.}
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
##run simule
result = fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
## get hubs list:
net.hubs(result)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
