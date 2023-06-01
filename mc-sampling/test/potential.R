library(tibble)
library(ggplot2)
theme_set(theme_minimal(base_size = 16))
pal <- RColorBrewer::brewer.pal(3, "Dark2")

fname <- "../dump/gamma_0.1_30_10_0.75_0.2_1_100000_10_U.txt"

potential <- scan(file = fname)

tibble(iter = seq_along(potential), pot = potential) |>
    ggplot(aes(x = iter, y = pot)) +
        geom_point(size = 0.6, colour = "gray40", alpha = 0.5) +
        labs(x = "Iteration", y = "Potential")
