# ----------------
# Studio4 Problems
# ----------------
cat('\n---- Studio4 Problems ----\n')


# -------- Problem 1: Covariance and Correlation --------
cat('- Problem 1\n')

# ---- (a) Expected winnings ----
cat('-- (a)\n')

# create a variable for storing oneBet table of information
oneBet.values = c(1, -1)
oneBet.pmfs = c(18/38, 20/38)

# getting expected value for winning in each bet
oneBet.expected = sum(oneBet.values * oneBet.pmfs)

# create variables for jill and jack's data
jill.expected = 15 * oneBet.expected
jack.expected = 10 * oneBet.expected

# print the answers
cat('Jill\'s expectation to win in one day =', jill.expected, '\n')
cat('Jack\'s expectation to win in one day =', jack.expected, '\n')

# ---- (b) Variances ----
cat('-- (b)\n')

# variance of one bet, recall that Var(X) = E((X - E(X))^2)
oneBet.variance = sum( (oneBet.values - oneBet.expected)^2 * oneBet.pmfs )

# since the bets are independent of each other, Var(X+Y) = Var(X) + Var(Y)
# variances for jill and jack
jill.variance = 15 * oneBet.variance
jack.variance = 10 * oneBet.variance

# print the answer
cat('variance of Jill\'s winning in one day r.v. =', jill.variance, '\n')
cat('variance of Jack\'s winning in one day r.v. =', jack.variance, '\n')

# ---- (c) Covariance and correlation ----
cat('-- (c)\n')

# W_jack = W_1 + ... + W_10
# W_jill = W_1 + ... + W_10 + W_11 + ... + W_15
# because each bettings are independent of eath other,
# and by the linear expand property of covariance, we will have:
# Cov(W_jack, W_jill) = Cov(W_1, W_1) + ... + Cov(W_10, W_10) = Var(W_1) + ... + Var(W_10)
jilljack.covariance = 10 * oneBet.variance

# to get the correlation, we just need to divide covariance by their standard deviations
jilljack.correlation = jilljack.covariance / sqrt(jill.variance * jack.variance)

# print the answers
cat('covariance of their winnings in one day =', jilljack.covariance, '\n')
cat('correlation of their winnings in one day =', jilljack.correlation, '\n')

# ---- (d) + (e) Scalability ----
cat('-- (d) + (e)\n')

cat('We now create random variables which are 100 independent adition of W_jill or W_jack\n')
cat('expected value would be 100 times greater\n')
cat('and so on for variance, because of independency\n')
cat('covariance should be the same, because we saw covariance here is the sum of variances\n')
cat('but! the correlation remains the same, because covariance and variances scaled by the same number\n')
cat('so the correlation is the same as that between W_jill and W_jack.\n')
cat('It can be seen that correlation is invariant about the scale (getting one day for scale, or 100 days)\n')

# -------- Problem 2: Simulation; Central Limit Theorem --------
cat('\n- Problem 2\n')

# ---- (a) Simulation ----
cat('-- (a)\n')

# for simulating 100 days of jack's betting, 10 bet in each day,
# jack should be betting 1000 times.
# we can simulate number of winnings by rbinom() in 5000 trials
jack.nplays = 1000
probWin = 18/38
ntrials = 5000

jack.nwins = rbinom(ntrials, jack.nplays, probWin)

# to compute jack's number of losses, we have to subtract number of wins from total bets
jack.nlosses = jack.nplays - jack.nwins

# each win has 1$ win, and each loose is 1$
# and total wins value can be obtained by
jack.totalWinnings = jack.nwins - jack.nlosses

# draw density histogram of jack total winnings
hist(jack.totalWinnings, freq=FALSE, breaks=20, col='orange')
cat('density histogram of jack total winnings in 100 day as shown\n')

# ---- (b) Why CLT? ----
cat('-- (b)\n')

cat('Since jack total winnings is the sum of (large number) 1000 (10 bet in 100 days) i.i.d. random variables,\n')
cat('central limit theorem says its distribution is approximately normal.\n')

# ---- (c) Compare with normal graph ----
cat('-- (c)\n')

# mean of jack total winnings is 100 times of jack's expectation to win in one day
mu = 100 * jack.expected
# and the variance is so
sigma = sqrt(100 * jack.variance)

# draw a normal graph by mean mu and standard deviation sigma
# range of normal graph: most of the probability is within 3.5*sigma of mu
x = seq(mu-3.5*sigma, mu+3.5*sigma, 1)
y = dnorm(x, mu, sigma)
# draw on previous plot by lines()
lines(x, y, col='blue', lwd=2)
cat('normal graph is added to density histogram plot.\n')

# ---- (d) 95% confidence interval - theoretical ----
cat('-- (d)\n')

cat('we know that 95% of probability is within 2*sigma of the mean,\n')
interval95.low = mu - 2*sigma
interval95.high = mu + 2*sigma
cat('which is the range of:', c(interval95.low, interval95.high), '\n')

# ---- (e) 95% confidence interval - experimental ----
cat('-- (e)\n')

# for finding that which percent of jack total winnings trials is in the
# theoretical 95% conf. int., we look at the trials, jack.totalWinnings

# R has no sequential comparison like -3 < -2 < -1
# so we should do the comparison seprately

# we check the trials above the low
trialsAboveLow = jack.totalWinnings > interval95.low
# then below the high
trialsBelowHigh = jack.totalWinnings < interval95.high
# in multiplication the two variables, only the entries satisfying two conditions would be TRUE
trialsInInterval95 = trialsAboveLow * trialsBelowHigh
# which fraction of them are in theoretical 95% conf. int.?
fractionInInterval95 = mean(trialsInInterval95)

cat(fractionInInterval95*100, 'percent of simulation data are in the theoretical 95% conf. int.\n')

# -------- Problem 3: Simulation; Covariance and Correlation --------
cat('\n- Problem 3\n')

# ---- (a) Plot Jack vs. Jill total winnings ----
cat('-- (a)\n')

# Jill total winnings is the jack total winnings + 500 (5 bets in each 100 days) extra bets she get
jill.nAdditionalPlays = 500
# ntrials and probWin is defined above
# jill's number of additional wins in trials
jill.nAdditionalWins = rbinom(ntrials, jill.nAdditionalPlays, probWin)
# jill's number of losses in addition
jill.nAdditionalLosses = jill.nAdditionalPlays - jill.nAdditionalWins
# jill's total value of additional winnings
jill.totalAdditionalWinnings = jill.nAdditionalWins - jill.nAdditionalLosses
# jill's total value of winnings
jill.totalWinnings = jack.totalWinnings + jill.totalAdditionalWinnings

plot(jack.totalWinnings, jill.totalWinnings, cex=0.5, pch=19, col=rgb(1,.643,.224,alpha=.2))
cat('plot of Jack vs. Jill total winnings is shown.\n')

# ---- (b) Sample covariance and correlation ----
cat('-- (b)\n')

# we can use cov() and cor() functions

# sample covariance of Jack and Jill total winnings
cat('sample covariance of Jack and Jill total winnings in 100 days =',
    cov(jack.totalWinnings, jill.totalWinnings), '\n')

# sample correlation of Jack and Jill total winnings
cat('sample correlation of Jack and Jill total winnings =',
    cor(jack.totalWinnings, jill.totalWinnings), '\n')



# -------------
# Problem Set 4
# -------------
cat('\n---- Problem Set 4 ----\n')


# -------- Problem 4: Canada has no common cents --------
cat('\n- Problem 4\n')

# a vector specified for Rounding Error
RE = c(-2, -1, 0, 1, 2) # in cents


# an overal loop for getting the result of simulation 3 times
cat('The result of redoing simulation 3 times are shown below:\n')
for (t in 1:3)
  {
    ntrials = 10000
    trials = rep(0, ntrials)
    for (j in 1:ntrials)
    {
      # in each trial we get 1000 sample of rounding errors
      REs = sample(RE, 1000, replace=TRUE)
      # then append the sum of Rounding Errors in this trial into a vector for trials
      trials[j] = sum(REs)
    }
    
    # after ntrials simulation, we look at trials vector for finding out that
    # for what fraction of trials, rounding error exceeds 100 cents
    print(mean(abs(trials) > 100))
  }

