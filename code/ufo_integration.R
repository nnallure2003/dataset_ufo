# Nikitha Nallure
# 11/07/2023
# Integrate monthly UFO data into a single file

rm(list = ls())

library(readr)


csv_files <- list.files(pattern = ".csv")


combined_data <- data.frame()


first_file <- read.csv(csv_files[1])
column_types <- sapply(first_file, class)


for (file in csv_files) {
  data <- read.csv(file)
  
  # Check if column types match
  if(identical(column_types, sapply(data, class))) {
    combined_data <- rbind(combined_data, data)
  } else {
    cat("Column types in", file, "do not match. Skipping.\n")
  }
}


write.csv(combined_data, "ufo_sightings.csv", row.names = FALSE, fileEncoding = "UTF-8")

