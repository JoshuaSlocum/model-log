library(model.log)
context("Model Object Parsing")

# GLM Method Tests --------------------------------------------------------
test_that("GLM parsers return correct names",{
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  glm_info  <- parse_model(model_glm)
  expect_named(glm_info
               ,c("type"
                  ,"specification"
                  ,"dataset"))
})

test_that("GLM parser returns no NA values",{
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  glm_info  <- parse_model(model_glm)
  expect_true(all(!is.na(glm_info)))
})

test_that("GLM parsers returns correct values",{
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  glm_info  <- parse_model(model_glm)
  expect_equal("glm", glm_info$type$type)
  expect_equal("gaussian", glm_info$type$family)
  expect_equal("identity", glm_info$type$link)
  expect_equal("mpg ~ as.factor(cyl) + hp + wt", glm_info$specification)
  expect_equal("mtcars", glm_info$dataset)
})