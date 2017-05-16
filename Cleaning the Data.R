# H20 -- Project
# Cleaning the Data
# Krisotpher C. Toll
# 5/8/2017

# Importing the Data
library(readxl)
Hoover_Company_Listings <- read_excel("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Hoover_Company_Listings.xlsx")

# Removing NA rows

no_na <- na.omit(Hoover_Company_Listings)

no_na$Sales_per_Mil <- gsub("M", "", no_na$Sales_per_Mil)

# Create two Columns for State and City

# I need to extraxt State from a list:
# Salt Lake City UT United States
# Rexburg ID United States
# Reno NV United State
# Las Vegas NV United State

no_na$StateId <- regmatches(no_na$Location, regexpr("[A-Z]{2}", no_na$Location))
no_na$City <- sapply(strsplit(as.character(no_na$Location), split=' United States', fixed=TRUE), function(x) (x[1]))
no_na$City <- gsub("[A-Z]{2}", "", no_na$City, perl = TRUE)

no_na <- no_na[c("Company Name", "StateId", "City", "NAICS Des.", "NAICS code", "Sales_per_Mil", "Employees", "Location Type", "SIC", "Location","Phone Number")]

library(plyr)
names(no_na)[names(no_na)=="Company Name"] <- "Company_Names"
names(no_na)[names(no_na)=="NAICS Des."] <- "NAICS_Des"
names(no_na)[names(no_na)=="NAICS code"] <- "NAICS_Code"
names(no_na)[names(no_na)=="Location Type"] <- "Location_Type"
names(no_na)[names(no_na)=="Phone Number"] <- "Phone_Number"

# Save as Excel file and dta file
library(foreign)
write.csv(no_na, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.csv")
write.dta(no_na, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.dta")
