# Header ------------------------------------------------------------------
# Created: 7/27/2016
# Author: Joshua Slocum
# Purpose: simple function to create model log file


# Define Function ---------------------------------------------------------

log_init <- function(path = getwd()) {
  
  # Set full path with file name
  log_file <- paste(path, "model-log.txt", sep = "/")
  
  # Check if model-log.txt already exists
  # Stop if it exists
  file_exists <- file.exists(log_file)
  if (file_exists) {stop("model-log.txt already exists in directory.")}
  
  # Create log file, it will be tab separated
  # By convention each line will end with a newline
  file.create(log_file)
  
  # Create log file header lind
  log_header <- paste(c("model_type", "specificaiton", "data")
                      ,collapse = "\t")
  
  # Add header to file
  cat(log_header
      ,file = log_file
      ,sep = ""
      ,fill = T
      ,append = TRUE)
  
  # Add log file path to global vars
  # This is done so path does not need to be passed to funcs
  log_file <<- log_file
  
  # Show message that file was created to console
  message(paste("Created model-log.txt in", path, sep = " "))
}

