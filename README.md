# [mit 18.05, Introduction to Probability and Statistics](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2014/)
# Studio Solutions

## [Studio1](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2014/a0e73f587d4bfd20a26147c13c66eeaa_MIT18_05S14_studio1_slides.pdf): Getting started with R, counting, simulation

1. Define `myColMatchs(A, sizematch)` function which checks if an entry was repeated at least `sizematch` times in a column of given 2D array `A`.
It will be used in birthday match problem.

2. Birthday match problem:

    * what is the probability of birthday match of `n` student in a class of size `m`?<br>
    compute the probability by simulation and plot it vs `m` for various `n`'s such as 2, 3, and 4.
    
3. Built-in functions introduced:

    * `sample`, `matrix`, `mean`, `min`, `max`, `sum`, `colSums`, `rep`, `seq`, `apply`, `sort`, `which`, `plot`, `lines`, `source`.


## [Studio2](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2014/9d9fd53c579c3d3962fa823d3f931c2b_MIT18_05S14_studio2_slides.pdf): R simulation to estimate probabilities, Learn about `for` loops in R

1. Expectation of random variable X: # people who return to their original seat after randomization.
    
2. Simulate Binomial random variable by `rbinom` and check the results with exact answers of `dbinom` and `pbinom`.

3. Expectation value of a customized bet.

4. Probability of a run of `m` or more of a particular value, in `n` flips of a coin, with the help of `rle` function.

5. Built-in functions introduced:

    * `rbinom`, `dbinom`, `pbinom`, `rle`, `choose`.


## [Studio3](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2014/0c9cedf48eb79532d8b9d307ce75825b_MIT18_05S14_studio3_slides.pdf): Gallery of continuous random variables, making histograms, histograms of averages


1. Normal distribution: `rnorm`, `dnorm`, `pnorm`, `qnorm`.

2. Exponential and Uniform distributions: `rexp`, `dexp`, `pexp`, `runif`, `dunif`, `punif`.

3. Histograms and binning: `hist(data, breaks, freq)`.

4. Histogram of average of exponential random variable: getting ready for Central Limit Theorem.

5. Analyze the experimental results of a medical treatment for cancer:

    * Define a random variable X to be the length of time a random patient given the treatment survives.
    
    * Import data from a function in `ps3prob2data.r` file.
    
    * Draw the bimodal histogram of data and analyze the average and standard deviation of it to conclude the effectiveness of treatment.
    
    
## [Studio4](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2014/2bf8ef7cfe3f500704114e7ed9330acb_MIT18_05S14_studio4_slides.pdf): Covariance, Correlation, CLT

1. Two roulette gamblers:

    * Expected and variance of each gambler's winning random variable.
    
    * Covariance and correlation of two gamblers' winning random variables.
    
    * Estimate each gambler's winning r. v. with normal distribution based on CLT.
    
2. Rounding error of shopping as a random variable.
