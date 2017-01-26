# Header ------------------------------------------------------------------
# Created: 1/25/2016
# Author: Joshua Slocum
# Purpose: Generate an entry for GLMs

#' Create a log entry for GLM objects
#'
#' @param object The model object of the model for which an entry is desired
#' @return Named list of values to be used as a line entry in the model log.
#' @export
#' 

# Define function ---------------------------------------------------------

generate_entry.glm <- function(object) {
  
  model_call <- object[["call"]]
  system_info <- Sys.info()
  
  # Calls should have 3 parts: model, spec, and data
  call_length_test <- length(model_call) == 3
  if (!call_length_test) {stop("Model call has more than 3 elements")}
  
  # For ease of use, assume the logged in user is the one who fit the model
  # However, in cases where this is uknown we default to login. This may be the
  # case on some linux systems that are not administered by the users.
  # #possibly_flexible : might allow for entry at run time as well later
  if (system_info["user"] == "unknown") {
    user_name <- Sys.info()["login"][[1]]
  } else {
    user_name <- Sys.info()["user"][[1]]
  }
  
  # For simplicity, assume the model was fitted when the log was entered
  # Precise times are, so far, unimportant for this
  log_ts <- as.character(Sys.time())
  
  # Get model type (i.e. R function name)
  # For GLMs we also include family and link
  # #possibly_flexible : might allow for custom entry here
  model_type <- list(
    "type"    = model_call[1]
    ,"family" = object$family$family[[1]]
    ,"link"   = object$family$link[[1]]
  )
  
  # Get model spec
  # #tidy : remove some junk parens later
  model_spec <- model_call[2]
  
  # Get data set name
  model_data <- model_call[3]
  
  # Create new model log lne
  log_entry <- list(
    "type"           = model_type
    ,"specification" = model_spec
    ,"dataset"       = model_data
    ,"modeler"       = user_name
    ,"time_entered"  = log_ts
  )

  
  return(log_entry)
}
