# Load in Data ----------------------------------------------------------------

default = TRUE # begin with subject 100307, rf, vinf as default
source('/share/RDirectory/stmm/rfunctions/single_subject/preprocessing.R')

# Fit lm() for Single Coord ---------------------------------------------------

# use first row of mapped measurements as y, task as x
LR_lm_fit <- lm(LR_vinf[1, ] ~ design_2)

# Fit lm() for Each Coord -----------------------------------------------------

# define empty vars for slopes, p-values, and std. error
coefs <- c()
pvals <- c()
error <- c()
# create progress bar for loop
pb = txtProgressBar(min = 0, max = dim(LR_vinf)[1], initial = 0, style = 3) 
# loop through all coords, with i being coord number
for (i in 1:dim(LR_vinf)[1]) {
  if (!any(is.na(LR_vinf[i, ]))) {
    sumfit   <- summary(lm(LR_vinf[i, ] ~ design_2))
    coefs[i] <- sumfit$coefficients[2,1]
    error[i] <- sumfit$coefficients[2,2]
    pvals[i] <- sumfit$coefficients[2,4]
  } else {
    coefs[i] <- NA
    error[i] <- NA
    pvals[i] <- NA
  }
  setTxtProgressBar(pb,i)
}


# NOTES -----------------------------------------------------------------------
# need non-local file path
# correct to bind LR_L and LR_R?
# lm fit p-vals and coef assignments will only work for single task
# should we use na.exlude as na.action in lm?