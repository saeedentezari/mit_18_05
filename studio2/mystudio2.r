# --------------------------------------
# My solution to R problems in week 2
# --------------------------------------

# ----------------
# studio2 problems
# ----------------

# -------- Board Question ---------
# Expectation of random variable X
# X: # of people who return to their original seat
npeople = 20
ntrials = 1000
trials = rep(0, ntrials)
for (i in 1:ntrials)
{
  nmatches = sum(sample(1:npeople, npeople) == 1:npeople)
  trials[i] = nmatches
}
print(mean(trials))
# interesting: average number of people who sit back in their original seat
# is independent from npeople
# you can find it out by examining different npoeple values

# -------- Exercise 1 --------
# random variable Y ~ Binomial(ntosses = 8, phead = 0.6)

# 1. run a simulation for estimating P(Y = 6) and P(Y <= 6)

# rbinom(ntrials, ntosses, phead) generates a vector of ntrials binomial outcome
ntosses = 8
phead = 0.7
ntrials = 1000
trials = rbinom(ntrials, ntosses, phead)

# estimate of P(Y = 6)
mean(trials == 6)
# estimate of P(Y <= 6)
mean(trials <= 6)

# 2. (a) use R to compute pmf and cdf
# we can also calculate pmf(6) and cdf(6) of Y by built-in functions
# dbinom(values, ntosses, phead) pmf of Binomial(ntosses, phead) random variable
# pbinom(values, ntosses, phead) cdf of Binomial(ntosses, phead) r.v.

# exact P(Y = 6)
dbinom(6, ntosses, phead)
# exact P(Y <= 6)
pbinom(6, ntosses, phead)
# dbinom() and pbinom() can return pmd and cdf for vector of values
# with par(mfrow = c(row, col)) you can respectively plot multiple plots in one figure
par(mfrow=c(1, 2))
plot(dbinom(0:ntosses, ntosses, phead))
par(mfrow = c(1, 1))
plot(pbinom(0:ntosses, ntosses, phead))
par(mfrow = c(1, 1))  # take back the parameter mfrow to its default value

# 2. (b) use formula for binomial probabilities to compute pmf(6) = P(Y = 6)
choose(ntosses, 6) * (phead)^6 * (1-phead)^(ntosses-6)

# -------- Exercise 3 --------
# A friend has a coin with probability .6 of heads.
# She proposes the following gambling game.
# You will toss it 10 times and count the number of heads.
# The amount you win or lose on k heads is given by k^2 − 7*k

# --------
# (a) plot the payoff function
outcomes = 0:10
payoff = outcomes^2 - 7 * outcomes
plot(outcomes, payoff, pch=19)  # pch=19 tells plot to use solid circles

# --------
# (b) exact computation to decide if this is a good bet or not

# be careful about E(h(X)) != h(E(X))
# where X ~ binom(10, 0.6) and h(k) = k^2 - 7k
# so we calculate expectation as E(h(X)) = \sum_{x_i in X} h(x_i) * p(x_i)

phead = 0.6
ntosses = 10
xi = 0:ntosses
hxi = xi^2 - 7 * xi
pxi = dbinom(xi, ntosses, phead)

EX = sum(hxi * pxi)
EX

# --------
# (c) approximate part (b) by simulation

ntrials = 1000
trials = rbinom(ntrials, ntosses, phead)
payoff = trials^2 - 7 * trials
EXaprx = mean(payoff)
EXaprx

# you can check the variance of expected value by various ntrials

# -------------
# Problem set 2
# -------------

# -------- problem 6 --------

# ------------
# (a) random sequence of 50 flips (0 and 1)

# we can generate ntrials of Bernoulli(phead) random variable by
# rbinom(ntrials=1, size or length= 1, phead)
phead = 0.5
nflips = 50

trials = rbinom(nflips, 1, phead)
trials

# ------------
# (b) a run is a subsequence of all 1's or 0's
#     how long is the longest run in part (a)?

# use function Run Length Encoding rle(trials)
# to compute the lengths and values of each run in vector of trials

trials
runLengthEncoder = rle(trials)
runLengthEncoder

# we can get access to run lengths with addressing rle variable
runLengthEncoder$lengths
# and find longest run by max() function
max(runLengthEncoder$lengths)

# -----------
# (c) simulation for expected longest run size

ntrials = 10000
ntosses = 50
maxRun = rep(0, ntrials)
for (i in seq(ntrials))
{
  trial = rbinom(ntosses, 1, 0.5)
  maxRun[i] = max(rle(trial)$lengths)
}
mean(maxRun)  # expected longest run size

# -----------
# (d) probability of a run of 8 or more in 50 flips

ntrials = 10000
ntosses = 50
isMaxGreaterThan = rep(0, ntrials)
for (i in seq(ntrials))
{
  trial = rbinom(ntosses, 1, 0.5)
  isMaxGreaterThan[i] = sum(rle(trial)$lengths >= 8)  # is any run of length 8 or more?
}
mean(isMaxGreaterThan)  # expected longest run size

# plot prob. for various run lengths
y = rep(0, ntosses)
for (greaterThan in 1:ntosses)
{
  isMaxGreaterThan = rep(0, ntrials)
  for (i in seq(ntrials))
  {
    trial = rbinom(ntosses, 1, 0.5)
    isMaxGreaterThan[i] = sum(rle(trial)$lengths >= greaterThan)
  }
  y[greaterThan] = mean(isMaxGreaterThan)
}
# plotting
plot(1:ntosses, y, xlab='k', ylab='prob. of a run with at least size k (in 50 tosses)')
