
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)


head(wash)

head(chi)

# Importing library
library(ggplot2)
library(lubridate)


wash$Gender <- NA
wash$Birth.Year <- NA
wash$City <- 'Washington'
ny$City <- 'New York'
chi$City <- 'Chicago'

head(wash)

city <- rbind(ny, wash)
city <- rbind(city, chi)
head(city)

ggplot(aes(x = City, y = Trip.Duration), data = city) +
    geom_bar(position = 'dodge', stat = "summary", fun.y = "mean", fill = "orange", colour="black") + 
    ggtitle('Avg Travel Time By City') +
    labs(y = 'Avg Trip Length', x = 'City') +
    coord_cartesian()

summary(city$Trip.Duration)

ggplot(aes(x=Birth.Year, fill=City), data= city) +
    geom_bar(position='dodge') +
    theme(text = element_text(size = 25)) +
    ggtitle("Rider Birth Year") +
    scale_x_continuous(breaks = seq(1900, 2020, by = 20)) +
    labs(x = "Count of Riders")

summary(city$Birth.Year)

# Visualizing data with ggplot
ggplot(aes(x = Gender, fill = City), data = city) +
    geom_bar( position = position_dodge2(width = 0.5, preserve = "single", padding = -0.5), colour="black") +
    ggtitle('Counts of each gender') +
    scale_x_discrete(labels = c('Not mentioned', 'Female', 'Male')) +
    labs(y = 'Riders', x = 'Gender') +
    scale_fill_manual("legend", values = c("Chicago" = "black", "New York City" = "pink"))



system('python -m nbconvert Explore_bikeshare_data.ipynb')
