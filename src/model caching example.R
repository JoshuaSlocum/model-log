# Testing of model param caching table and model caching folder
# Notes -------------------------------------------------------------------
# Work flow is save model results, and alsocheck if  similar model already
# fitted before doing fit. Look into utilizing memoization for things.

# Easy solution but cumbersome workflow
# 1. Specify formula object
# 2. Check against aready used formulas
# 3. Check data (name) on used datasets. 
# 4. If new formula or data proceed.
# 5. Fit model
# 6. Save model object
# 7. Add model objet to list
# 8. Add model name and info to list
# 9. Evaluate on hold-out or save CV results ifapplicable
# If desired, run cleanup function to sweep earlier models and leave last N
# or other named models in the workspace


data("mtcars")


# Create modle file caching folder ----------------------------------------
dir.create("./data/model_cache")


# Create model_list object to store model metadata ------------------------
model_list <- list()


# Create a list to store model specs --------------------------------------
model_spec <- list()

# Create sample model 1 ---------------------------------------------------
model_1  <- lm(mpg ~ as.factor(cyl) + hp + wt, data = mtcars)


# Example model caching routine -------------------------------------------
# Idea: Either do function wrappers, post model create function, or
# A new operator!!!
# Add  model object to model list
model_list[[1]] <- model_1

# Save as rds to /model_cache
saveRDS(model_1, file = "./data/model_cache/model_1.Rds")

# Save model spec to list
model_info <- c("model_1", as.character(model_1$call)[2])
model_spec[[1]] <- model_info

# Remove original model from workspace
rm(model_1)






