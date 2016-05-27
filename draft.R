## read data
raw_data <- read.csv("data/EErzeugung.csv", skip = 7, header = FALSE, sep = ";", stringsAsFactors = FALSE)
names(raw_data) <- c("Year","Month","Source","Energie.product.brutto","Energie.product.netto","Heat.product.netto","Fuel.use")
head(raw_data)

## convert strings to numeric
raw_data$Energie.product.brutto <- as.numeric(raw_data$Energie.product.brutto)
raw_data$Energie.product.netto  <- as.numeric(raw_data$Energie.product.netto)
raw_data$Heat.product.netto     <- as.numeric(raw_data$Heat.product.netto)
raw_data$Fuel.use               <- as.numeric(raw_data$Fuel.use)

## reshape dataset
wind <- subset(raw_data, Source == "Windkraft")
total <- subset(raw_data, Source == "Insgesamt")
total$time <- paste(total$Year,total$Month, sep = ".")

raw_data <- read.csv("data/totaldate.csv", header = TRUE, sep = " ", stringsAsFactors = FALSE)
