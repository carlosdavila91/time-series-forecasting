
library(tidyquant)  # Loads tidyverse, tidyquant, financial pkgs, xts/zoo
library(tidyverse)
library(cranlogs)   # For inspecting package downloads over time
library(corrr)      # Tidy correlation tables and correlation plotting
library(cowplot)    # Multiple plots with plot_grid()

pkgs <- c(
  "tidyr", "lubridate", "dplyr", 
  "broom", "tidyquant", "ggplot2", "purrr", 
  "stringr", "knitr"
)

# Get the downloads for the individual packages
tidyverse_downloads <- cran_downloads(
  packages = pkgs, 
  from     = "2017-01-01", 
  to       = "2017-06-30") %>%
  tibble::as_tibble() %>%
  group_by(package)

# Visualize the package downloads
tidyverse_downloads %>%
  ggplot(aes(x = date, y = count, color = package)) +
  # Data
  geom_point(alpha = 0.5) +
  facet_wrap(~ package, ncol = 3, scale = "free_y") +
  # Aesthetics
  labs(title = "tidyverse packages: Daily downloads", x = "",
       subtitle = "2017-01-01 through 2017-06-30",
       caption = "Downloads data courtesy of cranlogs package") +
  scale_color_tq() +
  theme_tq() +
  theme(legend.position="none")
