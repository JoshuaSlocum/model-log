library(model.log)
context("Model Log File Creation")

# Run function
log_init()

test_that("File named model_log.txt exists on specified path", {
  expect_true(file.exists("model_log.txt"))
})


file.remove("model_log.txt")
