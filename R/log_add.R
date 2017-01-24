# Header ------------------------------------------------------------------
# Created: 1/23/2016
# Author: Joshua Slocum
# Purpose: simple function to add model call to log

#' log_add is a generic function that records the fitting of a model in the
#' provided log system. 
#'
#' @param model_obj The model object of the model to be logged
#' @param log_path File path to the log file. Default is the current working
#' directory.
#' @return A log entry is recorded in the specified file, and the modelobject
#' is passed through.
#' @export
#' 

# Define function ---------------------------------------------------------

log_add  <- function(model_obj, log_path){
  UseMethod("log_add")
}

log_add.default <- function(model_obj, log_path) {
  obj_class  <- class(model_obj)
  warning(paste0("No method found for object of class: ", obj_class))
}
