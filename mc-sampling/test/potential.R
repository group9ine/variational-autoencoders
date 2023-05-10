library(tibble)
library(ggplot2)
theme_set(theme_minimal(base_size = 16))
pal <- RColorBrewer::brewer.pal(3, "Dark2")

niter <- 10000
fname <- list.files(
    path = "../dump", pattern = "*_U.txt", full.names = TRUE
)
potential <- scan(file = fname, sep = "\n")

tibble(iter = seq_along(potential)[-1], pot = potential[-1]) |>
    ggplot(aes(x = iter, y = pot)) +
        geom_point(size = 0.6, colour = "gray40", alpha = 0.5) +
        geom_smooth(colour = pal[1], fill = pal[1]) +
        labs(x = "Iteration", y = "Potential")
