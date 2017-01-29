#' @title Get user info
#' @description get user info from system
#' @return A character vector containing the user name to be used in a log entry


get_user <- function(){
  system_info <- Sys.info()
  
  # For ease of use, assume the logged in user is the one who fit the model
  # However, in cases where this is uknown we default to login. This may be the
  # case on some linux systems that are not administered by the users.
  # #possibly_flexible : might allow for entry at run time as well later
  if (system_info["user"] == "unknown") {
    user_name <- Sys.info()["login"][[1]]
  } else {
    user_name <- Sys.info()["user"][[1]]
  }
  
  return(user_name)
}