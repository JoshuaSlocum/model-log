#' @title Log Entry
#' @description Writes a log entry to the log
#' @param object The model object whose info we wish to log
#' @param conn The connection to the log
#' 

log_entry <- function(object, conn){
 
  # First generate the entry from the model object
  model_entry <- generate_entry(object)
 
  # Then parse the entry into a tabular format to match the log
  model_log_line <- c(paste(model_entry[[1]][[1]], collapse = ":")
                      ,paste(model_entry[[1]][[2]])
                      ,paste(model_entry[[1]][[3]])
                      ,paste(model_entry[[2]])
                      ,paste(model_entry[[3]]))
 
  # Write the entry to the log file
  utils::write.table(t(model_log_line)
            ,file     = conn
            ,sep      = ","
            ,col.names = FALSE
            ,append   = TRUE)
  
  # Display a success message so the user knows it worked...
  message("Added new model entry to model log")
  
  # Return the model object in case the user has subsequent pipe steps
  return(object)
  
}