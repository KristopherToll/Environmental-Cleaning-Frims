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

# Create two Columns for State and City

# I need to extraxt State from a list:
# Salt Lake City UT United States
# Rexburg ID United States
# Reno NV United State
# Las Vegas NV United State

Pikachu$StateId <- regmatches(Pikachu$Location, regexpr("[A-Z]{2}", Pikachu$Location))
Pikachu$City <- sapply(strsplit(as.character(Pikachu$Location), split=' United States', fixed=TRUE), function(x) (x[1]))
Pikachu$City <- gsub("[A-Z]{2}", "", Pikachu$City, perl = TRUE)

Pikachu <- Pikachu[c("Company Name", "StateId", "City", "NAICS Des.", "NAICS code", "Sales_per_Mil", "Employees", "Location Type", "SIC", "Location","Phone Number")]

library(plyr)
names(Pikachu)[names(Pikachu)=="Company Name"] <- "Company_Names"
names(Pikachu)[names(Pikachu)=="NAICS Des."] <- "NAICS_Des"
names(Pikachu)[names(Pikachu)=="NAICS Code"] <- "NAICS_Code"
names(Pikachu)[names(Pikachu)=="Location Type"] <- "Location_Type"
names(Pikachu)[names(Pikachu)=="Phone Number"] <- "Phone_Number"

# Save as Excel file and dta file
library(foreign)
write.csv(Pikachu, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.csv")
write.dta(Pikachu, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.dta")
