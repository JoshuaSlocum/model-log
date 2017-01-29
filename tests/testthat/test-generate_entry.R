library(model.log)
context("Log Entry Creation")

test_that("Model Entry has length 3",{
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  log_entry  <- generate_entry(model_glm)
  expect_equal(3, length(log_entry))
})

test_that("Model Entry is a list",{
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  log_entry  <- generate_entry(model_glm)
  expect_is(log_entry, "list")
})

# #todo make test read schema of log to match. Likely use expect from file in both tests.
test_that("Model Entry has correct names",{
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  log_entry  <- generate_entry(model_glm)
  expect_named(log_entry,
               c("model_info"
                 ,"user_info"
                 ,"time_entered"))
})