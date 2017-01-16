# Header ------------------------------------------------------------------
# Created: 7/27/2016
# Author: Joshua Slocum
# Purpose: simple function to add model call to log

#' Add an entry to the log
#'
#' @param model_obj The model object of the model to be logged
#' @param log_path File path to the log file. Default is the current working
#' directory.
#' @return A log file named "model_log.txt is created in the directory"
#' @export
#' 

# Define function ---------------------------------------------------------

log_add <- function(model_obj, log_path) {
  
  # Check that a call is an element in model_obj
  has_call <- "call" %in% names(model_obj)
  if (!has_call) {stop("Model object has no call element")}
  
  # Store call
  model_call <- model_obj[["call"]]
  
  # Check that call length is 3
  # Calls should have 3 parts: model, spec, and data
  call_length_test <- length(model_call) == 3
  if (!call_length_test) {stop("Model call has more than 3 elements")}
  
  # Get user = modeler
  user_name <- Sys.info()["user"][[1]]
  
  # Get log time
  log.ts <- as.character(Sys.time())
  
  # Get model type (i.e. R function name)
  model_type <- model_call[1]
  
  # Get model spec
  model_spec <- model_call[2]
  
  # Get data set name
  model_data <- model_call[3]
  
  # Create new model log lne
  log_line <- paste(c(model_type
                    ,model_spec
                    ,model_data
                    ,user_name
                    ,log.ts)
                    ,collapse = ",")
  
  # Add log line to file
  cat(log_line
      ,file   = log_path # should be global var
      ,append = TRUE
      ,sep    = ""
      ,fill   = T)
  
  # Show message that model line was added in console
  message("Added new model entry to model log")
  
  # Pass through model object to work with pipe
  return(model_obj)
}
