# Load in Data ----------------------------------------------------------------

default = TRUE # begin with subject 100307, rf, vinf as default
source('/share/RDirectory/stmm/rfunctions/single_subject/preprocessing.R')

# Fit lm() for Single Coord ---------------------------------------------------

# use first row of mapped measurements as y, task as x
run2_lm_fit <- lm(run2_vinf[1, ] ~ design2)

# Fit lm() for Each Coord -----------------------------------------------------

# define empty vars for slopes, p-values, and std. error
coefs <- c()
pvals <- c()
stder <- c()
# create progress bar for loop
pb = txtProgressBar(min = 0, max = dim(run2_vinf)[1], initial = 0, style = 3) 
# loop through all coords, with i being coord number
for (i in 1:dim(run2_vinf)[1]) {
  if (!any(is.na(run2_vinf[i, ]))) {
    sumfit   <- summary(lm(run2_vinf[i, ] ~ design2))
    coefs[i] <- sumfit$coefficients[2,1]
    stder[i] <- sumfit$coefficients[2,2]
    pvals[i] <- sumfit$coefficients[2,4]
  } else {
    coefs[i] <- NA
    stder[i] <- NA
    pvals[i] <- NA
  }
  setTxtProgressBar(pb,i)
}

summary(coefs)
summary(stder)
summary(pvals)

# NOTES -----------------------------------------------------------------------
# need non-local file path
# lm fit p-vals and coef assignments will only work for single task
# should we use na.exlude as na.action in lm?