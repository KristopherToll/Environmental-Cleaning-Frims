# Calulating industry concentration ratios with hoover_Company Listings
# Kristopher C. Toll

# Reading in the data
hoovs <- read.csv(file =  "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.csv")

# Load in libraries

library(ggplot2)
library(mosaic)
library(plotly)
library(DT)
library(plyr)

# subset out branches

hoovs_noB <- subset(hoovs, Location.Type != "Branch")

# Create a Column for State

hoovs_noB$State <- strsplit()