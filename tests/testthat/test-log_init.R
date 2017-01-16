library(model.log)
context("Model Log File Creation")

test_that("Log creation message is shown",{
  expect_message(log_init(), "Created model_log.csv in")
})

test_that("File named model_log.txt exists on specified path", {
  expect_true(file.exists("model_log.csv"))
})

test_that("Log created has a header row", {
  expect_true(is.character(names(read.csv("model_log.csv"))))
})

test_that("New log is empty", {
  expect_true(nrow(read.csv("model_log.csv")) == 0)
})

# Clean-up
file.remove("model_log.csv")
