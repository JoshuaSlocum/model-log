# Header ------------------------------------------------------------------
# Created: 1/25/2016
# Author: Joshua Slocum
# Purpose: Helper function to extract relevant info from model objects

#' Helper function to extract relevant info from model objects
#' 
#' @param object The model object of the model to be logged
#' @return Named list of values to be used as part of a log entry
#' @export
#' 
#' 
parse_model  <- function(object){
  UseMethod("parse_model")
}

parse_model.default <- function(object) {
  obj_class  <- class(object)
  warning(paste0("No method found for object of class: ", obj_class))
}

