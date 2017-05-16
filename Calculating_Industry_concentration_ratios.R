# Calulating industry concentration ratios with hoover_Company Listings
# Kristopher C. Toll

# Reading in the data
library(readr)
options(scipen=999999)
hoovs <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Raw_data/Clean_Company_listing.csv", 
                  col_types = cols(Employees = col_number(), 
                                   Sales_per_Mil = col_number()))

# Just Branches

branches <- subset(hoovs, Location_Type == "Branch")

# subset out branches and Solid Waste Landfill. 

hoovs_sub <- subset(hoovs, Location_Type != "Branch" & NAICS_Des != "Solid Waste Landfill")
hoovs_sub <- subset(hoovs_sub, Sales_per_Mil != "NA")
hoovs_sub <- subset(hoovs_sub, Employees != "NA")
# Create a seperate data object for each state.
# This will ensure that market share are only calculated for each state rather than across all four.

ID <- subset(hoovs_sub, StateId != "AZ" & StateId != "ID" & StateId != "UT")
AZ <- subset(hoovs_sub, StateId != "ID" & StateId != "NV" & StateId != "UT")
ID <- subset(hoovs_sub, StateId != "AZ" & StateId != "ID" & StateId != "UT")
UT <- subset(hoovs_sub, StateId != "AZ" & StateId != "ID" & StateId != "NV")

# It is also neccesary to seperate industry
# Start with Nevada Collection 

NV_Collection <- subset(NV, NAICS_Des != "Hazardous Waste Treatment and Disposal"
                        & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal" 
                        & NAICS_Des != "Remediation Services"
                        & NAICS_Des != "Solid Waste Combustors and Incinerators"
                        & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal")
NV_Collection$C4 <- (NV_Collection$Sales_per_Mil/sum(NV_Collection$Sales_per_Mil))*100 
NV_Collection$HHI <- NV_Collection$C4^2
NV_Collection$EmploymentRatio <- (NV_Collection$Employees/sum(NV_Collection$Employees))*100

# Nevada Waste Treatment and Disposal

NV_Disposal <- subset(NV, NAICS_Des != "Hazardous Waste Collection"
                      & NAICS_Des != "Other Waste Collection"
                      & NAICS_Des != "Remediation Services"
                      & NAICS_Des != "Soild Waste Collection ")
NV_Disposal$C4 <- (NV_Disposal$Sales_per_Mil/sum(NV_Disposal$Sales_per_Mil))*100 
NV_Disposal$HHI <- (NV_Disposal$C4)^2
NV_Disposal$EmploymentRatio <- (NV_Disposal$Employees/sum(NV_Disposal$Employees))*100

# Nevada Remediation

NV_Remediation <- subset(NV, NAICS_Des != "Hazardous Waste Collection"
                         & NAICS_Des != "Hazardous Waste Treatment and Disposal"
                         & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal"
                         & NAICS_Des != "Other Waste Collection"
                         & NAICS_Des != "Soild Waste Collection"
                         & NAICS_Des != "Solid Waste Combustors and Incinerators")
NV_Remediation$C4 <- (NV_Remediation$Sales_per_Mil/sum(NV_Remediation$Sales_per_Mil))*100 
NV_Remediation$HHI <- NV_Remediation$C4^2
NV_Remediation$EmploymentRatio <- (NV_Remediation$Employees/sum(NV_Remediation$Employees))*100



# Idaho Waste Collection 

ID_Collection <- subset(ID, NAICS_Des != "Hazardous Waste Treatment and Disposal"
                        & NAICS_Des != "Hazardous Waste Treatment and Disposal" 
                        & NAICS_Des != "Remediation Services"
                        & NAICS_Des != "Solid Waste Combustors and Incinerators"
                        & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal")
ID_Collection$C4 <- (ID_Collection$Sales_per_Mil/sum(ID_Collection$Sales_per_Mil))*100 
ID_Collection$HHI <- ID_Collection$C4^2
ID_Collection$EmploymentRatio <- (ID_Collection$Employees/sum(ID_Collection$Employees))*100

# Idaho Waste Treatment and Disposal

ID_Disposal <- subset(ID, NAICS_Des != "Hazardous Waste Collection"
                      & NAICS_Des != "Other Waste Collection"
                      & NAICS_Des != "Remediation Services"
                      & NAICS_Des != "Soild Waste Collection")
ID_Disposal$C4 <- (ID_Disposal$Sales_per_Mil/sum(ID_Disposal$Sales_per_Mil))*100 
ID_Disposal$HHI <- ID_Disposal$C4^2
ID_Disposal$EmploymentRatio <- (ID_Disposal$Employees/sum(ID_Disposal$Employees))*100

# Idaho Remediation

ID_Remediation <- subset(ID, NAICS_Des != "Hazardous Waste Collection"
                         & NAICS_Des != "Hazardous Waste Treatment and Disposal"
                         & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal"
                         & NAICS_Des != "Other Waste Collection"
                         & NAICS_Des != "Soild Waste Collection"
                         & NAICS_Des != "Solid Waste Combustors and Incinerators")
ID_Remediation$C4 <- (ID_Remediation$Sales_per_Mil/sum(ID_Remediation$Sales_per_Mil))*100 
ID_Remediation$HHI <- ID_Remediation$C4^2
ID_Remediation$EmploymentRatio <- (ID_Remediation$Employees/sum(ID_Remediation$Employees))*100

# Utah Waste Collection

UT_Collection <- subset(UT, NAICS_Des != "Hazardous Waste Treatment and Disposal"
                        & NAICS_Des != "Hazardous Waste Treatment and Disposal" 
                        & NAICS_Des != "Remediation Services"
                        & NAICS_Des != "Solid Waste Combustors and Incinerators"
                        & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal")
UT_Collection$C4 <- (UT_Collection$Sales_per_Mil/sum(UT_Collection$Sales_per_Mil))*100 
UT_Collection$HHI <- UT_Collection$C4^2
UT_Collection$EmploymentRatio <- (UT_Collection$Employees/sum(UT_Collection$Employees))*100

# Utah Waste Treatment and Disposal

UT_Disposal <- subset(UT, NAICS_Des != "Hazardous Waste Collection"
                      & NAICS_Des != "Other Waste Collection"
                      & NAICS_Des != "Remediation Services"
                      & NAICS_Des != "Soild Waste Collection")
UT_Disposal$C4 <- (UT_Disposal$Sales_per_Mil/sum(UT_Disposal$Sales_per_Mil))*100 
UT_Disposal$HHI <- UT_Disposal$C4^2
UT_Disposal$EmploymentRatio <- (UT_Disposal$Employees/sum(UT_Disposal$Employees))*100

# Utah Remediation

UT_Remediation <- subset(UT, NAICS_Des != "Hazardous Waste Collection"
                         & NAICS_Des != "Hazardous Waste Treatment and Disposal"
                         & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal"
                         & NAICS_Des != "Other Waste Collection"
                         & NAICS_Des != "Soild Waste Collection"
                         & NAICS_Des != "Solid Waste Combustors and Incinerators")
UT_Remediation$C4 <- (UT_Remediation$Sales_per_Mil/sum(UT_Remediation$Sales_per_Mil))*100 
UT_Remediation$HHI <- UT_Remediation$C4^2
UT_Remediation$EmploymentRatio <- (UT_Remediation$Employees/sum(UT_Remediation$Employees))*100

# Arizona Waste Collection

AZ_Collection <- subset(AZ, NAICS_Des != "Hazardous Waste Treatment and Disposal"
                        & NAICS_Des != "Hazardous Waste Treatment and Disposal" 
                        & NAICS_Des != "Remediation Services"
                        & NAICS_Des != "Solid Waste Combustors and Incinerators"
                        & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal")
AZ_Collection$C4 <- (AZ_Collection$Sales_per_Mil/sum(AZ_Collection$Sales_per_Mil))*100 
AZ_Collection$HHI <- AZ_Collection$C4^2
AZ_Collection$EmploymentRatio <- (AZ_Collection$Employees/sum(AZ_Collection$Employees))*100

# Arizona Waste Treatment and Disposal

AZ_Disposal <- subset(AZ, NAICS_Des != "Hazardous Waste Collection"
                      & NAICS_Des != "Other Waste Collection"
                      & NAICS_Des != "Remediation Services"
                      & NAICS_Des != "Soild Waste Collection")
AZ_Disposal$C4 <- (AZ_Disposal$Sales_per_Mil/sum(AZ_Disposal$Sales_per_Mil))*100 
AZ_Disposal$HHI <- AZ_Disposal$C4^2
AZ_Disposal$EmploymentRatio <- (AZ_Disposal$Employees/sum(AZ_Disposal$Employees))*100

# Arizona Remediation

AZ_Remediation <- subset(AZ, NAICS_Des != "Hazardous Waste Collection"
                         & NAICS_Des != "Hazardous Waste Treatment and Disposal"
                         & NAICS_Des != "Other Nonhazardous Waste Treatment and Disposal"
                         & NAICS_Des != "Other Waste Collection"
                         & NAICS_Des != "Soild Waste Collection"
                         & NAICS_Des != "Solid Waste Combustors and Incinerators")
AZ_Remediation$C4 <- (AZ_Remediation$Sales_per_Mil/sum(AZ_Remediation$Sales_per_Mil))*100 
AZ_Remediation$HHI <- AZ_Remediation$C4^2
AZ_Remediation$EmploymentRatio <- (AZ_Remediation$Employees/sum(AZ_Remediation$Employees))*100