library(model.log)
context("Model Object Entry to Log")

# GLM Method Tests --------------------------------------------------------
test_that("Success Message is displayed",{
  log_init()
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  expect_message(log_add(model_glm, "model_log.csv"), "Added new model entry to model log")
})



file.remove("model_log.csv")