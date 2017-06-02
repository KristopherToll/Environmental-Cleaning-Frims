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

# Get rid of everything but Remediation, hazardous waste collection and disposal

HazFrims <- no_na

HazFrims <- subset(HazFrims, NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal"
                   & NAICS_Des != "Other Waste Collection"
                   & NAICS_Des != "Soild Waste Collection"
                   & NAICS_Des != "Solid Waste Combustors and Incinerators"
                   & NAICS_Des != "Solid Waste Landfill")

HazFrims <- subset(HazFrims, HazFrims$SIC != "17990801 Asbestos removal and encapsulation"
                   & SIC != "17990802 Lead burning"
                   & SIC != "49530101 Acid waste, collection and disposal"
                   & SIC != "49530103 Radioactive waste materials, disposal"
                   & SIC != "49530200 Refuse collection and disposal services"
                   & SIC != "49539904 Medical waste disposal")

# Make sure that varaible types are correct
HazFrims$Phone_Number <- paste(HazFrims$Phone_Number, "N")
HazFrims$Sales_per_Mil <- gsub(",", "", HazFrims$Sales_per_Mil)
HazFrims$Employees <- gsub(",", "", HazFrims$Employees)


# Save as CSV file and dta file
library(foreign)
write.csv(HazFrims, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/HazFirms.csv")
write.dta(HazFrims, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/HazFirms.dta")
