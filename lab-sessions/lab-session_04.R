
# Lab Session #4

# Init
library(fpp3)

# We have introduced the following functions: gg_lag and ACF. 
# Use these functions to explore the four time series: 
# - Bricks from aus_production
aus_production %>% gg_lag(Beer, geom = "point")
aus_production %>% ACF(Beer) %>% autoplot()

# - Lynx from pelt
pelt %>% gg_lag(Lynx, geom = "point")
pelt %>% ACF(Lynx) %>% autoplot()

# - Close price of Amazon from gafa_stock
amzn_stock <- gafa_stock %>%
  filter(Symbol == "AMZN") %>% 
  mutate(traiding_day = row_number()) %>% 
  update_tsibble(index = traiding_day, regular = T)

amzn_stock %>% gg_lag(Close, geom = "point")
amzn_stock %>% ACF(Close) %>% autoplot

# - Demand from vic_elec
vic_elec %>% gg_lag(Demand, period = 1, lags = c(1, 2, 24, 48, 336, 17532))
vic_elec %>% ACF(Demand, lag_max = 336) %>% autoplot()

# Can you spot any seasonality, cyclicity and trend? 


# What do you learn about the series?

