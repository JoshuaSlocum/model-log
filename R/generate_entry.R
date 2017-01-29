# Header ------------------------------------------------------------------
# Created: 1/25/2016
# Author: Joshua Slocum
# Purpose: Combine results to make entry

#' Combine results from helper functions to create an entry for the model
#' 
#' @param object The model object of the model to be logged
#' @return Named list of values to be used as a line entry in the model log.
#' @export
#' 
#' 
generate_entry  <- function(object){
  
  # Time Stamp Entry ----------
  # For simplicity, assume the model was fitted when the log was entered
  # Precise times are, so far, unimportant for this
  log_ts <- as.character(Sys.time())
  
  # Model Info -----------------
  model_info <- parse_model(object)
  
  # User Info ------------------
  user_info <- get_user()
  
  # Create Output -------------
  model_entry <- list(
    "model_info"    = model_info
    ,"user_info"    = user_info
    ,"time_entered" = log_ts
  )
  
  return(model_entry)
  
}
