# Header ------------------------------------------------------------------
# Created: 7/27/2016
# Author: Joshua Slocum
# Purpose: Example of model log workflow

# To start we will simply log basic info line by line

# Create log file, it will be tab separated 
file.create("model-log.txt")

# Create header for file
log_header <- c("model_type", "specificaiton", "data")
cat(paste(log_header, collapse = "\t")
    ,file = "model-log.txt"
    ,sep = ""
    ,fill = T
    ,append = TRUE)

# Load data and fit fake model
data("mtcars")
model_1  <- lm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)

# Write model call to file
cat(paste(as.character(model_1$call), collapse = "\t")
    ,file = "model-log.txt"
    ,append = TRUE
    ,sep = ""
    ,fill = T)

# Test of reading log file in to DF
model_log <- read.delim("model-log.txt")
