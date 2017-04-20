\name{fasjem}
\alias{fasjem}
\title{A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models}
\usage{
fasjem(X, method, lambda, epsilon, gamma, rho, iterMax)
}
\arguments{
\item{X}{A List of matrices. They can be both data matrices or covariance/correlation matrices. If each matrix in the X is sysmetric matrix, we assume they are covariance/correlation matrices you give.}
\item{method}{A parameter to decide which method you choose to use. If you use method = "fasjem-g", you choose the group,2 norm as the second norm. If you use method = "fasjem-i", you choose the group,infinity norm as the second norm. }
\item{lambda}{A postive scalar. It is a hyperparameter controling the sparsity level of the matrices.}
\item{epsilon}{A postive scalar. It is a hyperparameter controling the ratio between l1 norm and the second group norm.}
\item{gamma}{A postive scalar. A hyperparameter is used in calculating each proximity. }
\item{rho}{A postive scalar. The learning rate of the proximal gradient method.}
\item{iterMax}{An integer. The number of iterations we use.}
}
\description{
An R implementation of fasjem method, which is introduced in "A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models"}
\examples{
data(exampleData)
fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
}
