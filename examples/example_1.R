# Title: Example workflow to see what needs to be functionized
# Author: Joshua Slocum
# Created: 3/5/2016


# Resources ---------------------------------------------------------------
# http://www.r-bloggers.com/adding-metadata-to-variables/


# Load some packages ------------------------------------------------------
library(ggplot2)
library(dplyr)
library(tidyr)


# Load example data -------------------------------------------------------
data(diamonds)
View(diamonds)

# Do some aggregation


# Create example metadata -------------------------------------------------
creator      <- Sys.getenv("USER")
time_created <- Sys.time()
num_vars     <- ncol(diamonds2)
num_obs      <- nrow(diamonds2)
file_name    <- c("example_1.R")


# Attach example metadata -------------------------------------------------
attr(diamonds2, "creator")      <- creator
attr(diamonds2, "time_created") <- time_created
attr(diamonds2, "num_vars")     <- num_vars
attr(diamonds2, "num_obs")      <- num_obs
attr(diamonds2, "file_name")    <- file_name


# Useful scrap ------------------------------------------------------------

# prints directory of executing file when script is sourced
print(dirname(sys.frame(1)$ofile))
# prints list of args passed to callstack
print(commandArgs())
print(sub(".*=", "", commandArgs()[4])) 
