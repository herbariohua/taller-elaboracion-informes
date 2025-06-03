if (!require("tidyverse")) install.packages("tidyverse"); library("tidyverse")
if (!require("palmerpenguins")) install.packages("palmerpenguins"); library("palmerpenguins")
if (!require("ggthemes")) install.packages("ggthemes"); library("ggthemes")
if (!require("sysfonts")) install.packages("sysfonts"); library("sysfonts")
if (!require("showtext")) install.packages("showtext"); library("showtext")

sysfonts::font_add_google(
  name = "Atkinson Hyperlegible",
  family = "atkinson"
)

showtext::showtext_auto()


palmerpenguins::penguins |>
  ggplot2::ggplot(
    ggplot2::aes(
      x = flipper_length_mm,
      y = bill_length_mm
    )
  ) +
  ggplot2::geom_point(
    ggplot2::aes(
      color = species,
      shape = species
    )
  ) +
  ggplot2::geom_smooth(
    method = "lm",
    ggplot2::aes(color = species)
  ) +
  ggplot2::labs(
    title = "Longitud de la aleta y longitud del pico",
    subtitle = "Dimensiones para los Pingüinos Adelie (Adelia), Chinstrap (Barbijo) y Gentoo (Papúa)",
    x = "Longitud de la aleta (mm)",
    y = "Longitud del pico (g)",
    color = "Especie",
    shape = "Especie"
  ) +
  ggplot2::theme_classic(
    base_family = "atkinson"
  ) +
  ggthemes::scale_color_colorblind()


# ggplot2::ggsave(
#   here::here(
#     "materials",
#     "intro-r",
#     "actividad_1.png"
#   ),
#   # plot = actividad_1,
#   width = 7,
#   height = 5,
#   units = "in",
#   # bg = "transparent"
# )
