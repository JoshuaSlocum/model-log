# Header ------------------------------------------------------------------
# Created: 1/25/2016
# Author: Joshua Slocum
# Purpose: Helper function to generate an entry from a model object.

#' Helper function to create log entry object
#' 
#' @param object The model object of the model to be logged
#' @return Named list of values to be used as a line entry in the model log.
#' @export
#' 
#' 
generate_entry  <- function(object){
  UseMethod("generate_entry")
}

generate_entry.default <- function(object) {
  obj_class  <- class(object)
  warning(paste0("No method found for object of class: ", obj_class))
}

