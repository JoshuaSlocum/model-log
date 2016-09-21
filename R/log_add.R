# Header ------------------------------------------------------------------
# Created: 7/27/2016
# Author: Joshua Slocum
# Purpose: simple function to add model call to log


# Define function ---------------------------------------------------------

log_add <- function(model_obj) {
  
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
  
  # Create new model log lne
  log_line <- paste(c(as.character(model_call)
                    ,user_name
                    ,log.ts)
                    ,collapse = "\t")
  
  # Add log line to file
  cat(log_line
      ,file   = log_file # should be global var
      ,append = TRUE
      ,sep    = ""
      ,fill   = T)
  
  # Show message that model line was added in console
  message("Added new model entry to model log")
  
  # Pass through model object to work with pipe
  return(model_obj)
}
