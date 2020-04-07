
# Lab Session #3

# Init
library(fpp3)
library(sugrrants)

# Look at the quarterly tourism data for the Snowy Mountains
snowy <- tourism %>%
  filter(Region == "Snowy Mountains")

# - Use autoplot(), gg_season() and gg_subseries() to explore the data.
snowy %>% autoplot(Trips)

snowy %>% gg_season(Trips)

snowy %>% gg_subseries(Trips)

# - What do you learn?
# If period is not indicated, the function does it for you
# In this case the function which gave the neatest 
# results is gg_subseries()

# Produce a calendar plot for the pedestrian data from one location and one year.

# See the locations
pedestrian %>% 
  as_tibble() %>% 
  group_by(Sensor) %>% 
  summarise(n(), min(Date), max(Date))

# Plot
(pedestrian %>% 
  filter(Sensor == "QV Market-Elizabeth St (West)",
         year(Date) == 2016) %>% 
  frame_calendar(x = Time, y = Count, date = Date) %>% 
  ggplot(aes(x = .Time, y = .Count, group = Date)) + 
  geom_line()) %>% 
  prettify()

