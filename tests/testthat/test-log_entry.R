library(model.log)
context("Log Entry Writing")

test_that("Log entry is written", {
  log_init()
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  log_entry(model_glm, conn = "./model_log.csv")
  log_data <- read.csv("./model_log.csv")
  expect_equal(nrow(log_data), 1)
})

file.remove("./model_log.csv")