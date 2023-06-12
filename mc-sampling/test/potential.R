library(tibble)
library(ggplot2)
theme_set(theme_minimal(
    base_size = 20, base_family = "Fira Sans Condensed"
))
pal <- RColorBrewer::brewer.pal(3, "Dark2")

fname <- list.files(
    path = "../dump", pattern = "*_U.txt", full.names = TRUE
)

potential <- scan(file = fname) |>
    matrix(nrow = 1000, ncol = 500, byrow = TRUE)

idx <- 70
tibble(iter = seq_along(potential[idx, ]), pot = potential[idx, ]) |>
    ggplot(aes(x = iter, y = pot)) +
        geom_point(size = 1, colour = "firebrick") +
        scale_x_continuous(labels = \(x) x * 10) +
        labs(
            x = "Iteration", y = "Potential",
            title = "Evolution with γ = 0.7, T = 0.75"
        )

ggsave(
    filename = "decorrelation.png", device = "png",
    dpi = 600, width = 9, height = 5
)
