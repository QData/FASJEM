\name{fasjem-package}
\alias{fasjem-package}
\docType{package}
\title{
A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models}
\description{
Runs the simule for network estimation and sparse inverse covariance estimation across multiple related datasets.
}
\details{
\tabular{ll}{
Package: \tab simule\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2017-05-08\cr
License: \tab GPL (>= 2)\cr
}
Estimating multiple sparse Gaussian Graphical Models (sGGMs) jointly for many related tasks (large K) under a high-dimensional (large p) situation is an important task. Most previous studies for the joint estimation of multiple sGGMs rely on penalized log-likelihood estimators that involve expensive and difficult non-smooth optimizations. We propose a novel approach, FASJEM for FAst and Scalable Joint structure-Estimation of Multiple sGGMs at a large scale. As the first study of joint sGGM using the M-estimator framework, our work has three major contributions: (1) We solve FASJEM through an entry-wise manner which is parallelizable. (2) We choose a proximal algorithm to optimize FASJEM. This improves the computational efficiency from O(Kp^3) to O(Kp^2) and reduces the memory requirement from O(Kp^2) to O(K). (3) We theoretically prove that FASJEM achieves a consistent estimation with a convergence rate of O(log(Kp)/n_{tot}). On several synthetic and four real-world datasets, FASJEM shows significant improvements over baselines on accuracy, computational complexity and memory costs.
}
\author{
Beilun Wang

Maintainer: Beilun Wang - bw4mw at virginia dot edu
}
\references{
Beilun Wang, Ji Gao, Yanjun Qi (2017). A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models. <https://www.cs.virginia.edu/yanjun/paperA14/2017_JEM_combined.pdf>
}
\keyword{ package }
\examples{
\dontrun{
data(exampleData)
fasjem(X = exampleData, method = "fasjem-g", 0.1, 0.1, 0.1, 0.05, 10)
}
}
