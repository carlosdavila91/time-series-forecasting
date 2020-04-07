
# Lab Session #2

# Init
library(fpp3)

# Create time plots of the following four time series: 
# Bricks from aus_production, Lynx from pelt, Close from gafa_stock, 
# Demand from vic_elec.
aus_production %>% autoplot(Bricks)

pelt %>% autoplot(Lynx)

gafa_stock %>% autoplot(Close)

vic_elec %>% autoplot(Demand)

# Use help() to find out about the data in each series.
help("aus_production")
help("pelt")
help("gafa_stock")
help("vic_elec")

# For the last plot, modify the axis labels and title.
vic_elec %>% 
  autoplot(Demand) +
  labs(
    x = "Date",
    y = "Electricity Demand (MW)",
    title = "Half-hourly electricity Demand",
    subtitle = "Victoria, Australia"
  )
