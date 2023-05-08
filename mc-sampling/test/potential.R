library(tibble)
library(ggplot2)
theme_set(theme_minimal(base_size = 16))
pal <- RColorBrewer::brewer.pal(3, "Dark2")

niter <- 10000
fname <- list.files(path = "dump", pattern = "*_U.txt", full.names = TRUE)
potential <- scan(file = fname, n = niter, sep = "\n")

tibble(iter = 1:niter, pot = potential) |>
    ggplot(aes(x = iter, y = pot)) +
        geom_point(size = 0.6, colour = "gray40", alpha = 0.5) +
        geom_smooth(colour = pal[1], fill = pal[1]) +
        labs(x = "Iteration", y = "Potential")
