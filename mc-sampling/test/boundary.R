library(ggplot2)
theme_set(theme_minimal(base_size = 15))

n <- 100000
side <- 5
dr <- 0.1
x <- runif(n, 0, side)

for (i in seq_len(1000)) {
    kick <- runif(n, -dr, dr)
    x <- x + kick
    # boundary condition
    x <- ifelse(0 < x & x < side, x, x - kick)
}

ggplot() +
    geom_histogram(
        aes(x), boundary = 0, binwidth = dr, fill = "firebrick"
    ) +
    labs(x = "x", y = "Counts per bin")
