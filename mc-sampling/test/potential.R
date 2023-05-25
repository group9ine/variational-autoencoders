library(tibble)
library(ggplot2)
theme_set(theme_minimal(base_size = 16))
pal <- RColorBrewer::brewer.pal(3, "Dark2")

fname <- list.files(
    path = "../dump", pattern = "*_U.txt", full.names = TRUE
)

potential <- scan(file = fname) |> matrix(nrow = 10000, ncol = 100)

pot_plt <- potential[, 20]
tibble(iter = seq_along(pot_plt), pot = pot_plt) |>
    ggplot(aes(x = iter, y = pot)) +
        geom_point(size = 0.6, colour = "gray40", alpha = 0.5) +
        labs(x = "Iteration", y = "Potential")
