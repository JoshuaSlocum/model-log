#' Initialize the log file
#'
#' @param path File path to the log file. Default is the current working
#' directory.
#' @return A log file named "model_log.csv is created in the directory"
#' @export
#' 
log_init <- function(path = getwd()) {
  
  # Set full path with file name
  log_file <- paste(path, "model_log.csv", sep = "/")
  
  # Check if model_log.csv already exists
  # Stop if it exists
  file_exists <- file.exists(log_file)
  if (file_exists) {stop("model_log.csv already exists in directory.")}
  
  # Create log file, it will be tab separated
  # By convention each line will end with a newline
  file.create(log_file)
  
  # Create log file header line
  log_header <- paste(c("model_type" 
                        ,"specificaiton"
                        ,"data"
                        ,"modeler"
                        ,"log_date")
                      ,collapse = ",")
  
  # Add header to file
  cat(log_header
      ,file   = log_file
      ,sep    = ","
      ,fill   = T
      ,append = TRUE)
  
  # Show message that file was created to console
  message(paste("Created model_log.csv in", path, sep = " "))
}

