# install.packages("ggplot2")
library(ggplot2)
library(here)
library(tidyverse)

# Read in the data and store as "ci_np" data object
ci_np <- read.csv("ci_np.csv")

# display the first 6 rows
head(ci_np)

colnames(ci_np)

glimpse(ci_np)

ggplot(data = ci_np)

ggplot(data = ci_np, mapping = aes(x = year, y = visitors)) +
  geom_point()

ggplot(data = ci_np, mapping = aes(x = year, y = visitors)) +
  geom_col()

ggplot(data = ci_np, mapping = aes(x = year, y = visitors)) +
  geom_point() +
  geom_line()

ggplot(data = ci_np, mapping = aes(x = year, y = visitors)) +
  geom_point() +
  geom_smooth(method = 'lm' )

# Plotting one variable ----

ggplot(data = ci_np, aes(x = visitors)) +
  geom_histogram(bins = 10)

ggplot(data = ci_np, mapping = aes(x = visitors)) +
  geom_density()

ggplot(data = ci_np, mapping = aes(x = year, y = visitors)) +
  geom_point(shape = 8, color = "blue")

ggplot(ci_np, aes(x = year, y = visitors)) +
  geom_point(shape = 8, color = "blue")

ggplot(ci_np, aes(x = year, y = visitors)) +
  geom_point(aes(size = visitors))

ggplot(ci_np, aes(x = year, y = visitors)) +
  geom_point(aes(size = visitors,
                 color = visitors))

ca_np <- read.csv("ca_np.csv")

unique(ca_np$park_name)

ggplot(data = ca_np, mapping = aes(x = year, y = visitors)) +
  geom_point(aes(color = park_name))

ggplot(data = ca_np, mapping = aes(x = year, y = visitors)) +
  geom_point()

ggplot(data = ca_np, mapping = aes(x = year, y = visitors)) +
  geom_point(aes(color = park_name)) +
  facet_wrap(park_name ~ .)

ggplot(data = ca_np, mapping = aes(x = year, y = visitors)) +
  geom_point(aes(color = park_name)) +
  facet_wrap(park_name ~ ., scales = "free_y")

abalone <- read.csv("abalone_landings.csv")

glimpse(abalone)

ggplot(data = abalone, mapping = aes(x = Year, y = Abalone_Landings_lbs)) +
  geom_point(aes(color = Abalone_Species))+
  geom_smooth(method = 'lm' )

#reseach question: All abalone species except Red abalone have 0 landings post 2001

ggplot(data = abalone, aes(x = Year, y = Abalone_Landings_lbs, color = Abalone_Species)) +
  geom_smooth() +
  facet_wrap(Abalone_Species ~ .) +
  scale_color_manual(values = c(
    "Red" = "firebrick",
    "Green" = "darkgreen",
    "Pink" = "deeppink", 
    "Black" = "black", 
    "White" = "white"
  ))

ggsave("abalone_landings_by_species.png",
       width = 8,
       height = 6,
       units = "in",
       dpi = 300)


unique(abalone$Abalone_Species)

# What we learned from our graph:
# All species declined precipitously over the course of the dataset. But, only red abalone had any harvest (>0lbs) at the endo of the data series.

# Follow up research question:
# How did juvenile abalone populations fare during this period. We would need size data, and potentially non-fisheries data to answer this question.

ggsave()