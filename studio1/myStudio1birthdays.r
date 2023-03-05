# --------------------------
# my code for studio1
# --------------------------

# -----------------------
# define npeople_prob function which returns probability of matching
# birthdays at least szmatch times, for a range of npeople
npeople_prob = function(maxpeople, szmatch=2, ntrials=1000)
{
  # import myColMatches function to use
  source("~/mit_18_05/studio1/myColMatches.r")
  probs = rep(0, maxpeople)
  for (npeople in 1:maxpeople)
  {
    samples = sample(1:365, npeople*ntrials, replace=TRUE)
    trials = matrix(samples, nrow=npeople, ncol=ntrials)
    probs[npeople] = mean(myColMatches(trials, szmatch))
  }
  return(probs)
}
#-----------------------
# Plot probability of at least two people have the same birthdays
# in various npeople in a class
# then print out the size of class which has the probability greater than
# a specific threshold
maxpeople = 100
npeople_prob_result = npeople_prob(maxpeople, szmatch=3, ntrials=10000)
plot(1:maxpeople, npeople_prob_result, type="l")
pthreshold = 0.5
lines(1:maxpeople, rep(pthreshold, maxpeople), col="red")
print(min(which(npeople_prob_result > pthreshold)))
#-----------------------
# explore the effect of ntrials on variability of estimation
maxpeople = 100
# draw and empty plot
plot(NULL,
     xlim=c(0, maxpeople), ylim=c(0, 1),
     xlab="n people in class", ylab="probability at least two birthdays match",
     main="birthday match prob est for various n of trials")
ntrials = c(10, 100, 1000, 10000)
colors = c("black", "red", "green", "blue")
for (i in seq(length(ntrials)))
{
  lines(1:maxpeople, npeople_prob(maxpeople, ntrials=ntrials[i]),
        col=colors[i], lwd=2)
}
legend(60, 0.4, legend=ntrials, fill=colors)
#------------------------
maxpeople = 400
plot(NULL,
     xlim=c(0, maxpeople), ylim=c(0, 1),
     xlab="n people in class", ylab="probability of at least m birthdays match",
     main="birthday match prob est for various number of matches m")
# ntrials default was set to 1000 in npeople_prob function
# m: at least m match must occur
m = 2:4
colors = c("red", "green", "blue")
for (i in seq(length(m)))
{
  lines(1:maxpeople, npeople_prob(maxpeople, szmatch=m[i]),
        col=colors[i], lwd=2)
}
legend(300, 0.4, legend=m, fill=colors)