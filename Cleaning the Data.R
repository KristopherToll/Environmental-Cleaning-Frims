# H20 -- Project
# Cleaning the Data
# Krisotpher C. Toll
# 5/8/2017

# Importing the Data
library(readxl)
Hoover_Company_Listings <- read_excel("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Hoover_Company_Listings.xlsx")

# Removing NA rows

Pikachu <- na.omit(Hoover_Company_Listings)

Pikachu$Sales_per_Mil <- gsub("M", "", Pikachu$Sales_per_Mil)
  
# Save as Excel file and dta file
library(foreign)
write.csv(Pikachu, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.csv")
write.dta(Pikachu, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.dta")
