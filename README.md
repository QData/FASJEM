## References

BibTex Citation:
```
@InProceedings{pmlr-v54-wang17e,
  title =    {{A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models}},
  author =   {Beilun Wang and Ji Gao and Yanjun Qi},
  booktitle =    {Proceedings of the 20th International Conference on Artificial Intelligence and Statistics},
  pages =    {1168--1177},
  year =     {2017},
  editor =   {Aarti Singh and Jerry Zhu},
  volume =   {54},
  series =   {Proceedings of Machine Learning Research},
  address =      {Fort Lauderdale, FL, USA},
  month =    {20--22 Apr},
  publisher =    {PMLR},
  pdf =      {http://proceedings.mlr.press/v54/wang17e/wang17e.pdf},
  url =      {http://proceedings.mlr.press/v54/wang17e.html}
}
```

## CRAN R Library page: [URL](https://cran.r-project.org/web/packages/fasjem/)


## Context
This repo provides two implementations of the FASJEM algorithm: a novel fast and Scalable approach to estimating multiple sparse Gaussian Graphic Modles (SGGMs) jointly for many related tasks under a high-dimensional situation.  

FASJEM is described in the paper [A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Model](https://arxiv.org/abs/1702.02715) by Beilun Wang, Ji Gao, and Yanjun Qi and accepted by AISTAT 2017.  FASJEM has three major contributions:

- We solve FASJEM through an entry-wise manner which is parallelizable.
- We choose a proximal algorithm to optimize FASJEM. This improves the computational efficiency from O(Kp3) to O(Kp2) and reduces the memory requirement from O(Kp2) to O(K).
- We theoretically prove that FASJEM achieves a consistent estimation with a convergence rate of O(log(Kp)/ntot). On several synthetic and four real-world datasets, FASJEM shows significant improvements over baselines on accuracy, computational complexity and memory costs.

## implementations
This repo provides two different implementations of the FASJEM algorithm:

1. the implementation of FASJEM method based on the [torch7](http://torch.ch/).
To use this GPU version of the FASJEM code, you need to install the [torch7](http://torch.ch/) and
 include the [cutorch](https://github.com/torch/cutorch) package.

2. the R implementation of FASJEM as the R package "fasjem" in CRAN
- install the R "simule" package through R console:
```r
install.packages('fasjem')
```
- then load the library simule in R console, by running:
```r
library(fasjem)
```
- then run demo to learn basic functions provided by the fasjem R package, by running:
```r
demo(fasjem)
```



## Contacts
- bugs, maintenance, feedback, questions: Beilun Wang bw4mw [at] virginia [dot] edu

## References
- ENCODE Project Consortium et al. An integrated encyclopedia of dna elements in the human genome. Nature, 489(7414):57–74, 2012.
- Trey Ideker and Nevan J Krogan. Differential network biology. Molecular systems biology, 8(1):565, 2012.
- Tim Beck, Robert K Hastings, Sirisha Gollapudi, Robert C Free, and Anthony J Brookes. Gwas central: a comprehensive resource for the comparison and interrogation of genome-wide association studies. European Journal of Human Genetics, 22(7):949–952, 2014.
- Steffen L Lauritzen. Graphical models. Oxford University Press, 1996.
- Kantilal Varichand Mardia, John T Kent, and John M Bibby. Multivariate analysis. 1980.
- Ming Yuan and Yi Lin. Model selection and estimation in the gaussian graphical model. Biometrika,v94(1):19–35, 2007.
- Rich Caruana. Multitask learning. Machine learning, 28(1):41–75, 1997.
- Patrick Danaher, Pei Wang, and Daniela M Witten. The joint graphical lasso for inverse covariance estimation across multiple classes. Journal of the Royal Statistical Society: Series B (Statistical Methodology), 2013.
- Karthik Mohan, Palma London, Maryam Fazel, Su-In Lee, and Daniela Witten. Node-based learning of multiple gaussian graphical models. arXiv preprint arXiv:1303.5145, 2013.
- Julien Chiquet, Yves Grandvalet, and Christophe Ambroise. Inferring multiple graphical structures. Statistics and Computing, 21(4):537–553, 2011.
- Jean Honorio and Dimitris Samaras. Multi-task learning of gaussian graphical models. In Proceedings of the 27th International Conference on Machine Learning (ICML-10), pages 447–454, 2010.
- Jian Guo, Elizaveta Levina, George Michailidis,
and Ji Zhu. Joint estimation of multiple graphical
models. Biometrika, page asq060, 2011.
- Bai Zhang and Yue Wang. Learning structural changes of gaussian graphical models in controlled experiments. arXiv preprint arXiv:1203.3532, 2012.
- Yi Zhang and Jeff G Schneider. Learning multiple tasks with a sparse matrix-normal penalty. In Advances in Neural Information Processing Systems, pages 2550–2558, 2010.
- Yunzhang Zhu, Xiaotong Shen, and Wei Pan. Structural pursuit over multiple undirected graphs. Journal of the American Statistical Association, 109(508):1683–1696, 2014.
- Eunho Yang, Aurélie C Lozano, and Pradeep K Ravikumar. Elementary estimators for graphical models. In Advances in Neural Information Processing Systems, pages 2159–2167, 2014.
- Onureena Banerjee, Laurent El Ghaoui, and Alexandre d’Aspremont. Model selection through sparse maximum likelihood estimation for multivariate gaussian or binary data. The Journal of Machine Learning Research, 9:485–516, 2008.
- Sahand Negahban, Bin Yu, Martin J Wainwright, and Pradeep K Ravikumar. A unified framework for high-dimensional analysis of m-estimators with decomposable regularizers. In Advances in Neural Information Processing Systems, pages 1348–1356, 2009.
- Eunho Yang, Aurelie Lozano, and Pradeep Ravikumar. Elementary estimators for high-dimensional linear regression. In Proceedings of the 31st International Conference on Machine Learning (ICML-14), pages 388–396, 2014.
- Eunho Yang, Aurelie C Lozano, and Pradeep D Ravikumar. Elementary estimators for sparse covariance matrices and other structured moments. In ICML, pages 397–405, 2014.
- Eunho Yang and Pradeep K Ravikumar. Dirty statistical models. In Advances in Neural Information Processing Systems, pages 611–619, 2013.
- Patrick L Combettes and Jean-Christophe Pesquet. Proximal splitting methods in signal processing. A Fast and Scalable Joint Estimator for Learning Multiple Related Sparse Gaussian Graphical Models In Fixed-point algorithms for inverse problems in science and engineering, pages 185–212. Springer, 2011.
- John Nickolls, Ian Buck, Michael Garland, and Kevin Skadron. Scalable parallel programming with cuda. Queue, 6(2):40–53, 2008.
- Trevor Hastie, Robert Tibshirani, Jerome Friedman, T Hastie, J Friedman, and R Tibshirani. The elements of statistical learning, volume 2. Springer, 2009.
- Adam J Rothman, Peter J Bickel, Elizaveta Levina, Ji Zhu, et al. Sparse permutation invariant covariance estimation. Electronic Journal of Statistics, 2:494 \	– 515, 2008.
- Tony Cai, Weidong Liu, and Xi Luo. A constrained l1 minimization approach to sparse precision matrix estimation. Journal of the American Statistical Association, 106(494):594–607, 2011.
- Cho-Jui Hsieh, Matyas A Sustik, Inderjit S Dhillon, and Pradeep D Ravikumar. Sparse inverse covariance matrix estimation using quadratic approximation. In NIPS, pages 2330–2338, 2011.
- Peter J Bickel and Elizaveta Levina. Covariance regularization by thresholding. The Annals of Statistics, pages 2577–2604, 2008.
- Ronan Collobert, Koray Kavukcuoglu, and Clé-ment Farabet. Torch7: A matlab-like environmentfor machine learning. In BigLearn, NIPS Workshop,number EPFL-CONF-192376, 2011.
