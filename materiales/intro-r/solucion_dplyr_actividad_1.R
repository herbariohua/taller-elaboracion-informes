if (!require("tidyverse")) install.packages("tidyverse"); library("tidyverse")
if (!require("palmerpenguins")) install.packages("palmerpenguins"); library("palmerpenguins")
if (!require("janitor")) install.packages("janitor"); library("janitor")

palmerpenguins::penguins

palmerpenguins::penguins_raw |>
  janitor::clean_names() |>
  dplyr::rename(
    bill_length_mm = culmen_length_mm,
    bill_depth_mm = culmen_depth_mm,
  ) |>
  dplyr::mutate(
    species = dplyr::case_match(
      species,
      "Adelie Penguin (Pygoscelis adeliae)" ~ "Adelie",
      "Gentoo penguin (Pygoscelis papua)" ~ "Gentoo",
      "Chinstrap penguin (Pygoscelis antarctica)" ~ "Chinstrap",
      .default = species
    ),
    sex = stringr::str_to_lower(sex),
    year = lubridate::year(date_egg)
  ) |>
  dplyr::select(
    species,
    island,
    bill_length_mm,
    bill_depth_mm,
    flipper_length_mm,
    body_mass_g,
    sex,
    year
  )
