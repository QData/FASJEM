\name{fasjem}
\alias{fasjem}
\title{A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models}
\usage{
fasjem(X, method, lambda, epsilon, gamma, rho, iterMax)
}
\arguments{
\item{X}{A List of matrices. They can be both data matrices or covariance/correlation matrices. If every matrix in the X is a sysmetric matrix, the matrices are assumed to be covariance/correlation matrices you give to use.}
\item{method}{The parameter that decides which method to use. method = "fasjem-g", use the group,2 norm and method = "fasjem-i", use group,infinity norm. }
\item{lambda}{A postive scalar. It is a hyperparameter controlling the sparsity level of the matrices.}
\item{epsilon}{A postive scalar. The ratio between l1 norm and the second group norm.}
\item{gamma}{A postive scalar. A hyperparameter used in calculating each proximity. }
\item{rho}{A postive scalar. The learning rate of the proximal gradient method.}
\item{iterMax}{An integer. The number of iterations.}
}
\description{
The R implementation of the FASJEM method, which is introduced in "A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models"}
\examples{
data(exampleData)
fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
}
