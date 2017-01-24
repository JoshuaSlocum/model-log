# Header ------------------------------------------------------------------
# Created: 10/03/2016
# Author: Joshua Slocum
# Purpose: Try out auto dependency graph of variables

# Load example data -------------------------------------------------------
data(diamonds)


# Feature Creation --------------------------------------------------------

# Create bins of depth
diamonds <- diamonds %>%
  mutate(depth_bin = as.factor(ntile(depth, 10)))

# Subset to modeling dataset
modeling_data <- diamonds %>%
  select(carat, cut, color, depth_bin, price)


# Fit a model -------------------------------------------------------------

model_01 <- lm(price ~.
               ,data = modeling_data)


# Check model summary -----------------------------------------------------

summary(model_01)



# manually create dependency graph -------------------------------------------------
# Here we manually create a small DAG showing the dependency of depth_bin on depth
# This exercise should provide some hints at how to parse the script to construct the
# edge and node DFs for the graph. 

library(DiagrammeR)

# nodes
model_nodes <- create_nodes(nodes = 1:2
                               ,type = "a"
                               ,label = c("depth", "depth_bin")
                               ,style = "filled"
                               ,color = "aqua"
                               ,value = c("depth", "depth_bin")
)

# edges
model_edges <- create_edges(from = c(1)
                            ,to = c(2)
                            ,rel = "a")

model_graph <- create_graph() %>%
  set_graph_name("model_01_dag") %>%
  add_node_df(model_nodes) %>%
  add_edge_df(model_edges)
  
model_graph %>% render_graph()

# Automatically Generate graph --------------------------------------------
# Now let's try and automatically generate the graph in a few methods

# Take1: parse script -----------------------------------------------------
# This method relies on being able to parse the script itself for variable
# dependencies. 
library(stringr)
prog_lines   <- readLines("data-dependency-graph.R")
m_lines  <- prog_lines[grep("mutate", prog_lines)]
lhs_vars <- m_lines
substr(m_lines, str_locate(m_lines, "\\(")[1,1], nchar(m_lines))
lhs <- str_extract(m_lines, "\\([A-z]+\\s=") %>% str_extract("[A-z]+")

# Processing RHS is more tricky...
# First solution attempt
# Parse out alpha words
# Then use find to figure out which is not a function
# Any that are not a function and are on RHS are antecedents of lhs
# Below regex works except when a var might be named.liked.this which would be werid...

rhs_words <- substr(m_lines, str_locate(m_lines, "=")[1,1], nchar(m_lines)) %>%
  str_extract_all("([A-z]+[._]*[A-z]+)")

# if weird names can work on tuning this:
# substr(m_lines, str_locate(m_lines, "=")[1,1]+2, nchar(m_lines)) %>% str_split("[\\(*]")

# Which RHS words are not found on the path?

rhs_word <- rhs_words[[1]][which(lapply(rhs_results, 
                                         FUN = function(x){
                                           identical(x,character(0))}) == T)]

# Now use lhs and rhs to auto create node df

nodes
model_nodes <- create_nodes(nodes = seq()
                            ,type = "a"
                            ,label = c("depth", "depth_bin")
                            ,style = "filled"
                            ,color = "aqua"
                            ,value = c("depth", "depth_bin")
)

# edges
model_edges <- create_edges(from = c(1)
                            ,to = c(2)
                            ,rel = "a")

model_graph <- create_graph() %>%
  set_graph_name("model_01_dag") %>%
  add_node_df(model_nodes) %>%
  add_edge_df(model_edges)

model_graph %>% render_graph()
