\name{fasjem}
\alias{fasjem}
\title{A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models}
\usage{
fasjem(X, method="fasjem-g", lambda=0.1, epsilon=0.1, gamma=0.1, rho=0.05, iterMax=10)
}
\arguments{
\item{X}{A List of input matrices. They can be either data matrices or covariance/correlation matrices. If every matrix in the X is a symmetric matrix, the matrices are assumed to be covariance/correlation matrices you give to use.}
\item{method}{The parameter that decides which second regularization function to use. When \code{method = "fasjem-g"}, the user chooses the group,2 norm as the second regularization function. When \code{method = "fasjem-i"}, the user chooses the group,infinity norm as the second regularization function. The default value is "fasjem-g". Please check the details for more information. }
\item{lambda}{A postive number. It is a hyperparameter that controls the sparsity level of the matrices.}
\item{epsilon}{A postive number. The hyperparameter represents the ratio between l1 norm and the second group norm.}
\item{gamma}{A postive number. A hyperparameter used in calculating each proximity. Please check the Algorithm 1 in our paper for more information.}
\item{rho}{A postive number. The learning rate of the proximal gradient method. Please check the Algorithm 1 in our paper for more information.}
\item{iterMax}{An integer. The max number of iterations in the optimization.}
}
\description{
The R implementation of the FASJEM method, which is introduced in "A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models". }
\references{
Beilun Wang, Ji Gao, Yanjun Qi (2017). A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models. <http://proceedings.mlr.press/v54/wang17e/wang17e.pdf>
}
\details{
  The FASJEM algorithm is a fast and scalable method to etimate multiple related sparse Gaussian Graphical models. It solves the following equation:
\deqn{
\min\limits_{\Omega_{tot}} ||\Omega_{tot}||_1 + \epsilon \mathcal{R}'(\Omega_{tot})
}
Subject to :
\deqn{
  ||\Omega_{tot} - inv(T_v(\hat{\Sigma}_{tot}))||_{\infty} \le \lambda_n
}
\deqn{
  \mathcal{R}'^*(\Omega_{tot} - inv(T_v(\hat{\Sigma}_{tot}))) \le \epsilon\lambda_n
}
Please also see the equation (3.1) in our paper. The \eqn{\lambda_n} is the hyperparameter controlling the sparsity level of the matrices and it is the \code{lambda} in our function. The \eqn{\epsilon\lambda_n} represents the regularization parameter for the second norm, where \eqn{\epsilon} is the \code{epsilon} parameter in our function and the default value is 0.1. Other parameters in the fasjem function are decribed in Algorithm 1 in our paper.
When \code{method = "fasjem-g"}, it means that \eqn{\mathcal{R}'(\cdot) = ||\cdot||_{\mathcal{G},2}}. When \code{method = "fasjem-i"}, it means that \eqn{\mathcal{R}'(\cdot) = ||\cdot||_{\mathcal{G},\infty}}.
For further details, please see our paper: <http://proceedings.mlr.press/v54/wang17e/wang17e.pdf>.
}
\keyword{fasjem}
\examples{
data(exampleData)
fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
}
