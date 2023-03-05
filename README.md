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

3. Expectation value of a bet.

4. Probability of a run of `m` or more of a value, in `n` flips of a coin, with the help of `rle` function.

5. Built-in functions introduced:

    * `rbinom`, `dbinom`, `pbinom`, `rle`, `choose`.
