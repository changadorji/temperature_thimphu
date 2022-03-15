library(ggridges)
library(tidyverse)
library(extrafont)
loadfonts()

theme_set(theme_classic(base_family = 'Garamond', base_size = 18))

#working directory
setwd("E:/the lazy analyst/bhutan weather data")

#read data
df <- read.csv('Khasadrapchu_data_daily.csv')

df %>% 
  drop_na(Year, Tmean) %>% 
  ggplot(aes(Tmean, as.factor(Year), fill=stat(x)))+
  geom_density_ridges_gradient(scale = 2, rel_min_height = 0.01)+
  scale_fill_viridis_c(name = "Temp (C)", option = "C") +
  labs(title = 'Temperatures in Thimphu',
       subtitle = 'From 2015 to 2020',
       x='Mean Temperature in C',
       y='YEAR',
       caption = 'Source:ICIMOD')+
  theme(legend.position = c(.95, .2))
  
