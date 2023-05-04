library(tidyverse)

niter <- 100000
potential <- scan(
    file = "dump/test_U.txt",
    what = double(),
    n = niter,
    sep = " "
)
data <- tibble(
    iter = rep(1:niter),
    pot = potential
)
