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
      x = species,
      fill = sex
    )
  ) +
  ggplot2::geom_bar(
    position = "dodge"
  ) +
  ggplot2::facet_wrap(
    ~ island
  ) +
  ggplot2::labs(
    title = "Número de individuos por especie e isla",
    x = "Especies",
    y = "Cantidad",
    fill = "Sexo"
  ) +
  ggplot2::theme_classic(
    base_family = "atkinson"
  ) +
  ggthemes::scale_fill_colorblind(
    labels = c("Hembra", "Macho", "NA")
  )


# ggplot2::ggsave(
#   here::here(
#     "materials",
#     "intro-r",
#     "ggplot_actividad_2.png"
#   ),
#   # plot = actividad_1,
#   width = 7,
#   height = 5,
#   units = "in",
#   # bg = "transparent"
# )
