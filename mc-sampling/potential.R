library(tidyverse)

niter <- 100000
potential <- scan(
    file = "dump/test_U.txt",
    what = double(),
    n = niter,
    sep = " "
)

tibble(
    iter = rep(1:niter),
    pot = potential
) |>
    ggplot(aes(x = iter, y = pot)) +
        geom_line(linewidth = 0.8)
