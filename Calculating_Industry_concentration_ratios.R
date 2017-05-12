# Calulating industry concentration ratios with hoover_Company Listings
# Kristopher C. Toll

# Reading in the data
library(readr)
hoovs <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.csv", 
                  col_types = cols(Employees = col_number(), 
                                   Sales_per_Mil = col_number()))

# subset out branches and Solid Waste Landfill. 

hoovs_sub <- subset(hoovs, Location_Type != "Branch" & NAICS_Des != "Solid Waste Landfill")

# Create a seperate data object for each state.
# This will ensure that market share are only calculated for each state rather than across all four.

NV <- subset(hoovs_sub, StateId != "AZ" & StateId != "ID" & StateId != "UT")
AZ <- subset(hoovs_sub, StateId != "NV" & StateId != "ID" & StateId != "UT")
ID <- subset(hoovs_sub, StateId != "AZ" & StateId != "NV" & StateId != "UT")
UT <- subset(hoovs_sub, StateId != "AZ" & StateId != "ID" & StateId != "NV")

# It is also neccesary to seperate industry
# Start with Nevada

NV_Collection <- subset(NV, NAICS_Des != "Hazardous Waste Treatment and Disposal"
                        & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal" 
                        & NAICS_Des != "Remediation Services"
                        & NAICS_Des != "Solid Waste Combuster and Incineratros")

# Calculate market concentration ratios

NV_Collection$C4 <- (NV_Collection$Sales_per_Mil/sum(NV_Collection$Sales_per_Mil))*100 
NV_Collection$HHI <- NV_Collection$C4^2
