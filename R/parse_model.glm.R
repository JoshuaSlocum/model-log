# Header ------------------------------------------------------------------
# Created: 1/25/2016
# Author: Joshua Slocum
# Purpose: Parse GLM model info

#' Extract relevant model info for GLM objects
#'
#' @param object The model object of the model to extract info from
#' @return Named list of values to be used as a line entry in the model log.
#' @export
#' 

# Define function ---------------------------------------------------------

parse_model.glm <- function(object) {
  
  model_call <- object[["call"]]
  
  # Calls should have 3 parts: model, spec, and data
  call_length_test <- length(model_call) == 3
  if (!call_length_test) {stop("Model call has more than 3 elements")}
  
  # Get model type (i.e. R function name)
  # For GLMs we also include family and link
  # #possibly_flexible : might allow for custom entry here
  model_type <- list(
    "type"    = as.character(model_call[1])
    ,"family" = object$family$family[[1]]
    ,"link"   = object$family$link[[1]]
  )
  
  # Get model spec
  # #tidy : remove some junk parens later
  model_spec <- as.character(model_call[2])
  
  # Get data set name
  model_data <- as.character(model_call[3])
  
  # Construct list of allvalues to return
  model_info <- list(
    "type"           = model_type
    ,"specification" = model_spec
    ,"dataset"       = model_data
  )

  
  return(model_info)
}
