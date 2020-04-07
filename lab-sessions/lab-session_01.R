
# Lab Session #1

# Init
library(tidyverse)
library(tsibble)

# Download tourism.xlsx from http://robjhyndman.com/data/tourism.xlsx, 
# and read it into R using read_excel() from the readxl package.
tourism <- readxl::read_excel("data/tourism.xlsx") %>% 
  mutate()

tourism %>% head()

# Create a tsibble which is identical to the tourism
# tsibble from the tsibble package.

tourism_tsibble <- tourism %>% 
  mutate(Quarter = yearquarter(Quarter)) %>% 
  as_tsibble(
    index = Quarter,
    key = c(Region, State, Purpose)
  )

# Some rows are missing but both keep the same structure
all_equal(tsibble::tourism, tourism_tsibble)

# Find what combination of Region and Purpose had 
# the maximum number of overnight trips on average.

tourism %>% 
  group_by(Region, Purpose) %>% 
  summarise(mean_trips = mean(Trips)) %>% 
  arrange(desc(mean_trips))

# Create a new tsibble which combines the Purposes and Regions, 
# and just has total trips by State.

grouped_tourism_ts <- tourism_tsibble %>% 
  group_by(Purpose, Region) %>% 
  summarise(total_trips = sum(Trips))
  