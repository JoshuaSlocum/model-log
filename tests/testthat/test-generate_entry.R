library(model.log)
context("Model Object Entry Creation")

# GLM Method Tests --------------------------------------------------------
test_that("GLM entry has correct names",{
  data("mtcars")
  model_glm  <- glm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)
  glm_entry  <- generate_entry(model_glm)
  expect_named(glm_entry
               ,c("type"
                  ,"specification"
                  ,"dataset"
                  ,"modeler"
                  ,"time_entered"))
})