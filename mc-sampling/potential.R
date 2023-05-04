library(tidyverse)

niter <- 10000
potential <- scan(
    file = "test_U.txt",
    what = double(),
    n = niter,
    sep = " "
)
data <- tibble(
    iter = rep(1:niter),
    pot = potential
)
