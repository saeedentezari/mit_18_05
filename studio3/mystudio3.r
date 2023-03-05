# ------------------------------------
# My code of studio3 and problem set 3
# ------------------------------------

# -------------------
# Normal distribution
# -------------------

# -------- rnorm --------

# rnorm(n, mu, sigma) generates n random values from Norm(mu, sigma^2) distribution
rnorm(50, 0, 1)

# P(-1 < Z < 1) for Z standard normal r.v.
data = rnorm(10000, 0, 1)
mean(abs(data) < 1) # 0.68 rule of thumb
mean(abs(data) < 2) # 0.95 rule of thumb

# -------- dnorm --------

# dnorm(x, mu, sigma) gives pdf of normal r.v. with mean mu and standard deviation sigma
x = 0
dnorm(x, 0, 1)
# obviously, x can be a vector of values
x = seq(-2, 2, 0.4)
dnorm(x, 0, 1)

# plot the standard normal density
z = seq(-6, 6, 0.01)
plot(z, dnorm(z, 0, 1), type='l', col='blue', lwd=3)
# add some other densities in the same plot figure
lines(z, dnorm(z, 1, 1), type='l', col='red', lwd=3)
lines(z, dnorm(z, 0, 2), type='l', col='green', lwd=3)

# -------- pnorm --------

# pnorm(x, mu, sigma) gives cdf of normal r.v. drawn from N(mu, sigma^2) distribution
x = 0
pnorm(x, 0, 1)
x = seq(-2, 2, 0.4)
pnorm(x, 0, 1)

# plot the standard normal (cumulative) distribution or cdf
z = seq(-6, 6, 0.01)
plot(z, pnorm(z, 0, 1), type='l', col='blue', lwd=3)
lines(z, pnorm(z, 1, 1), type='l', col='red', lwd=3)
lines(z, pnorm(z, 0, 2), type='l', col='green', lwd=3)

# -------- qnorm --------

# qnorm(p, mu, sigma) is inverse function of the cdf, it takes prob. and returns value (of r.v.),
# such that,
# a = qnorm(p, mu, sigma) <==> P(Z < a) = F(a) = p <==> p = pnorm(a, mu, sigma)
# or, qnorm is the inverse of the function pnorm
p = 0.5
qnorm(p, 0, 1)

a = -0.358
p = pnorm(a, 0, 1)
p
a = qnorm(p, 0, 1)
a

# qnorm of p = 0 or 1
qnorm(p=1, 0, 1)
qnorm(p=0, 0, 1)

# ------------------------------------
# Exponential and Uniform distribution
# ------------------------------------

# -------- rexp and runif --------

# rexp(n, lambda) generates n random values from exponential(lambda) distribution
# dexp, pexp, qexp as like as functions of normal distribution
# and also runif(n, a, b) for uniform(a, b) distribution

# plot pdf of exp. dist.
x = seq(0, 10, 0.01)
lambda = 0.5
plot(x, dexp(x, lambda), type='l', col='blue', lwd=2)
lambda = 1
lines(x, dexp(x, lambda), type='l', col='green', lwd=2)
lambda = 2
lines(x, dexp(x, lambda), type='l', col='red', lwd=2)
# plot straight lines of x = 0 and y = 0
abline(v=0)
abline(h=0)
# you can also plot pexp instead of dexp, to see the cdf's

# plot pdf of uniform dist.
x = seq(-5, 5, 0.01)
a = 0
b = 0.5
plot(x, dunif(x, a, b), type='l', col='green', lwd=2, ylim=c(0, 3))
a = 1
b = 3
lines(x, dunif(x, a, b), type='l', col='blue', lwd=2, ylim=c(0, 5))
# cdf of the blue one
lines(x, punif(x, a, b), lty=2, col='blue', lwd=2)  # see par -> lty documentation for line types

## you can also interact with various distribution in the awesome link below:
## https://mathlets.org/mathlets/probability-distributions/

# ---------
# histogram
# ---------

n = 100
mu = 0
sigma = 1
data = rnorm(n, mu, sigma)
# automatic histogram
hist(data)

# -------- binning --------

# breaks = (can be) a single number (suggesting) number of bins
hist(data, breaks=2)
hist(data, breaks=10)
hist(data, breaks=100)
# break = (either can be) a vector indicating to edge of each bin (or break points)
binwidth = 0.2
bins = seq(min(data), max(data)+binwidth, binwidth) # max+binwidth for making sure we don't miss any data
hist(data, breaks=bins)
# by default we get a frequency histogram
# to get a density histogram, set freq=FALSE
hist(data, breaks=bins, freq=FALSE)

# with enough data, the density histogram should looks like the pdf
# generate big number of stand. norm. random values
n = 10000
data = rnorm(n, mu, sigma)
binwidth = 0.1
bins = seq(min(data), max(data)+binwidth, binwidth)
hist(data, breaks=bins, freq=FALSE)
# compare with its pdf
x = bins
lines(x, dnorm(x, mu, sigma), col='red', lwd=2)

# ----------------
# Studio3 problems
# ----------------

# -------- Histogram of averages of exp(1) --------

# --------
# 1. generate a frequency histogram of 1000 samples from an exp(1) random variable

n = 1000
lambda = 1
data = rexp(n, lambda)
binwidth = 0.5
bins = seq(min(data), max(data)+binwidth, binwidth)
hist(data, breaks=bins, freq=TRUE)

# --------
# 2. generate a density histogram for the "average" of two independent exp(1) r.v.

data1 = rexp(n, lambda)
data2 = rexp(n, lambda)
aveData = (data1 + data2) / 2
binwidth = 0.5
bins = seq(min(data), max(data)+binwidth, binwidth)
hist(aveData, breaks=bins, freq=FALSE)

# --------
# 3. Using rexp(), matrix() and colMeans() generate a density histogram
# for the average of 50 independent exp(0.5) random variables.
# Make 10000 sample averages and use a binwidth of 0.05 for this.
# Look at the spread of the histogram.

ntrials = 10000
nexps = 50
lambda = 0.5
data = matrix(rexp(nexps*ntrials, lambda), nrow=nexps, ncol=ntrials)
aveData = colMeans(data)
# plot
binwidth = 0.05
bins = seq(min(aveData), max(aveData)+binwidth, binwidth)
hist(aveData, breaks=bins, freq=FALSE, col='yellow')

# --------
# 4. Superimpose a graph of the pdf of N(1, 1/50) on your plot in problem 3.
# Remember the second parameter in N is sigma^2.

x = seq(min(bins), max(bins), 0.01)
mu = 1 / lambda
sigma = sqrt(1 / nexps) / lambda
lines(x, dnorm(x, mu, sigma), type='l', col='red', lwd=2)

# -------------
# Problem Set 3
# -------------

# -------- problem 2 --------
# Suppose there is an experimental medical treatment for a cancer,
# that if untreated is nearly always fatal within 12-15 months.
# The doctors enroll 5000 patients in a study,
# in which each patient is given the treatment and followed for 5 years.
# Let X be the length of time a random patient given the treatment survives.
# (If a patient is still alive at the end of the study, then X = 5 for this patient.)

# download 'ps3prob2data.r' file from Related Resources of 18.05, or link below
# https://ocw.mit.edu/ans7870/18/18.05/s14/r-code/ps3prob2data.r
# put it to your R working directory

# you can get R working directory by getwd()
getwd()
# or set your working directory by setwd(dir = "<path>")
setwd(dir='~/mit_18_05/studio3')
getwd()

# to load a file into your R workspace, put the file in your R working directory
# and load it by source function
source('ps3prob2data.r')

# you could have loaded the file directly by calling source funtion with the url

# file 'ps3prob2data.r' contains a function getprob2data
# which returns data prepared for this problem.
# load data into vector years, 5000 trials of r.v. X
years = getprob2data()

# lets take a brief look at distribution of years
hist(years, breaks=100)

# --------
# (a) compute the mean and standard deviation of the data

mean(years)
mean((x-mean(years))^2)
# R has function var for calculating variance
var(years)
std = sqrt(var)
std

# --------
# (b) plot a frequency histogram with binwidth = 0.1 years

binwidth = 0.1
bins = seq(min(years), max(years)+binwidth, binwidth)
hist(years, breaks=bins)

# --------
# (c) a description for the data

# bimodal data, with a spike at years = 5
# lower mode might be since of death according to cancer
# higher mode might be since of natural death (of probably old patients)
# spike because 20 percent of patients survived (X = 5)
# nonsense average (2.5) because of two modes or categories of patients
# bimodal reflected in the large standard deviation (2.0) (with respect to range of values)

# --------
# (d) what conclusion about the effectiveness of the treat? recommendations?

# effective on about half of the patients (all except lower mode)
# for further researches,
# understand what characteristics of the patients and disease predict the effectiveness,
# based on the treated patients

# -------- Problem 6 --------
# The length of human gestation is well-approximated by a normal distribution
# with mean μ = 280 days and standard deviation σ = 8.5 days.

# --------
# (a) Graph the corresponding pdf and cdf.

mu = 280 # days
sigma = 8.5 # days
days = seq(mu-4*sigma, mu+4*sigma, 0.01)
# multiple plots
par(mfrow=c(2, 1))
# plot respectively
# pdf first
plot(days, dnorm(days, mu, sigma), type='l', lwd=3)
# cdf second
plot(days, pnorm(days, mu, sigma), type='l', lwd=3)
# take back the parameter mfrow to its default value
par(mfrow=c(1, 1))
