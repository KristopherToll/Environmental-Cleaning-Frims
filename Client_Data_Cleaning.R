# Customer Data

library(readr)

# Read in LQG

NV_LQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/NV_LQG.csv")
CA_LQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/CA_LQG.csv")
UT_LQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/UT_LQG.csv")
AZ_LQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/AZ_LQG.csv")
ID_LQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/ID_LQG.csv")

LQG <- rbind(NV_LQG, CA_LQG, UT_LQG, AZ_LQG, ID_LQG)
LQG$TYPE <- "LQG"

# Read in SQG

NV_SQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/NV_SQG.csv")
CA_SQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/CA_SQG.csv")
UT_SQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/UT_SQG.csv")
AZ_SQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/AZ_SQG.csv")
ID_SQG <- read_csv("C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/ID_SQG.csv")

SQG <- rbind(NV_SQG, CA_SQG, UT_SQG, AZ_SQG, ID_SQG)
SQG$TYPE <- "SQG"

Clients <- rbind(LQG, SQG)

# Counties by Las Vegas

Clark <- subset(Clients, COUNTY == "CLARK")
Mohave <- subset(Clients, COUNTY == "MOHAVE")
Inyo <- subset(Clients, COUNTY == "INYO")
Lincoln <- subset(Clients, COUNTY == "LINCOLN")
Nye <- subset(Clients, COUNTY == "NYE")
San_Bernardino <- subset(Clients, COUNTY == "SAN BERNARDINO")
Washington <- subset(Clients, COUNTY == "WASHINGTON")

Vegas <- rbind(Clark, Mohave, Inyo, Lincoln, Nye, San_Bernardino, Washington)
Vegas <- subset(Vegas, STATE != "ID")
Vegas <- Vegas[sample(nrow(Vegas)),]

write.csv(Vegas, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/Vegas.csv")

# Counties by Reno

Washoe <- subset(Clients, COUNTY == "WASHOE")
Pershing <- subset(Clients, COUNTY == "PERSHING")
Storey <- subset(Clients, COUNTY == "STOREY")
Churchhill <- subset(Clients, COUNTY == "CHURCHILL")
Lyon <- subset(Clients, COUNTY == "LYON")
Carson_City <- subset(Clients, COUNTY == "CARSON CITY")
Humboldt <- subset(Clients, COUNTY == "HUMBOLDT")
Mineral <- subset(Clients, COUNTY == "MINERAL")
Alpine <- subset(Clients, COUNTY == "ALPINE")
Amador <- subset(Clients, COUNTY == "AMADOR")
El_Dorado <- subset(Clients, COUNTY == "EL DORADO")
Placer <- subset(Clients, COUNTY == "PLACER")
Nevada <- subset(Clients, COUNTY == "NEVADA")
Sierra <- subset(Clients, COUNTY == "SIERRA")
Plumas <- subset(Clients, COUNTY == "PLUMAS")
Lassen <- subset(Clients, COUNTY == "LASSEN")
Mono <- subset(Clients, COUNTY == "MONO")

Reno <- rbind(Washoe, Pershing, Storey, Churchhill, Lyon, Carson_City, Humboldt, Mineral, Alpine, Amador, El_Dorado, Placer, Nevada, Sierra, Plumas, Lassen, Mono)
Reno <- Reno[sample(nrow(Reno)),]

write.csv(Reno, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/Reno.csv")

# Counties by Phenoix

Maricopa <- subset(Clients, COUNTY == "MARICOPA")
Pinal <- subset(Clients, COUNTY == "PINAL")
Gila <- subset(Clients, COUNTY == "GILA")
Yavapai <- subset(Clients, COUNTY == "YAVAPAI")
La_Paz <- subset(Clients, COUNTY == "LA PAZ")
Yuma <- subset(Clients, COUNTY == "YUMA")
Pima <- subset(Clients, COUNTY == "PIMA")
Coconino <- subset(Clients, COUNTY == "COCONINO")
Cochise <- subset(Clients, COUNTY == "COCHISE")
Graham <- subset(Clients, COUNTY == "GRAHAM")
Navajo <- subset(Clients, COUNTY == "NAVAJO")

Phenoix <- rbind(Maricopa, Pinal, Gila, Yavapai, La_Paz, Yuma, Pima, Coconino, Cochise, Graham, Navajo)
Phenoix <- Phenoix[sample(nrow(Phenoix)),]

write.csv(Phenoix, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/Phenoix.csv")

# Counties by Salt Lake

Salt_Lake <- subset(Clients, COUNTY == "SALT LAKE")
Utah <- subset(Clients, COUNTY == "UTAH")
Wasatch <- subset(Clients, COUNTY == "WASATCH")
Summit <- subset(Clients, COUNTY == "SUMMIT")
Morgan <- subset(Clients, COUNTY == "MORGAN")
Davis <- subset(Clients, COUNTY == "DAVIS")
Tooele <- subset(Clients, COUNTY == "TOOELE")
Rich <- subset(Clients, COUNTY == "RICH")
Cache <- subset(Clients, COUNTY == "CACHE")
Weber <- subset(Clients, COUNTY == "WEBER")
Box_Elder <- subset(Clients, COUNTY == "BOX ELDER")
Daggett <- subset(Clients, COUNTY == "DAGGETT")
Unitah <- subset(Clients, COUNTY == "UNITAH")
Duchesne <- subset(Clients, COUNTY == "DUCHESNE")
Carbon <- subset(Clients, COUNTY == "CARBON")
Emery <- subset(Clients, COUNTY == "EMERY")
Sevier <- subset(Clients, COUNTY == "SEVIER")
Sanpete <- subset(Clients, COUNTY == "SANPETE")
Millard <- subset(Clients, COUNTY == "MILLARD")
Juab <- subset(Clients, COUNTY == "JUAB")

Salt <- rbind(Salt_Lake, Utah, Wasatch, Summit, Morgan, Davis, Tooele, Rich, Cache, Weber, Box_Elder, Daggett, Unitah, Duchesne, Carbon, Emery, Sevier, Sanpete, Millard, Juab)
Salt <- Salt[sample(nrow(Salt)),]

write.csv(Salt, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/Salt_Lake.csv")

# Counties by Bosie

Ada <- subset(Clients, COUNTY == "ADA")
Boise <- subset(Clients, COUNTY == "BOISE")
Gem <- subset(Clients, COUNTY == "GEM")
Canyon <- subset(Clients, COUNTY == "CANYON")
Elmore <- subset(Clients, COUNTY == "ELMORE")
Owyhee <- subset(Clients, COUNTY == "OWYHEE")
Gooding <- subset(Clients, COUNTY == "GOODING")
Camas <- subset(Clients, COUNTY == "CAMAS")
Blaine <- subset(Clients, COUNTY == "BLAINE")
Valley <- subset(Clients, COUNTY == "VALLY")
Adams <- subset(Clients, COUNTY == "ADAMS")
Washington <- subset(Clients, COUNTY == "WASHINGTON")
Payette <- subset(Clients, COUNTY == "PAYETTE")

Bosie <- rbind(Ada, Boise, Gem, Canyon, Elmore, Owyhee, Gooding, Camas, Blaine, Valley, Adams, Washington, Payette)
Bosie <- subset(Bosie, STATE != "UT")
Bosie <- Bosie[sample(nrow(Bosie)),]

write.csv(Bosie, file = "C:/Users/Kristopher/odrive/Google Drive/Shared with Me/H20/Working Files/Customer_data/Bosie.csv")
