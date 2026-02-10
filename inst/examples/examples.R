library(devtools)
remove.packages("PopHivePlots")
.rs.restartR()
devtools::document()
res <- devtools::check()
res$errors
res$warnings
res$notes
devtools::install()

devtools::build_manual()

library(PopHivePlots)
library(ggplot2)

# Setup fonts
setup_pophive_fonts()

# Sample data
df_line <- data.frame(
  year = rep(2015:2024, 3),
  value = c(runif(10, 20, 50), runif(10, 30, 60), runif(10, 25, 55)),
  category = rep(c("Category A", "Category B", "Category C"), each = 10)
)

# Create line plot
pophive_plot(
  data = df_line,
  plot_type = "line",
  aes_mappings = aes(x = year, y = value, color = category, linetype = category),
  title = "Trends Over Time",
  subtitle = "Example line graph with custom PopHIVE theme",
  caption = "Data source: sample data",
  x_label = "Year",
  y_label = "Value",
  line_width = 0.8
)

# Sample data
df_dot <- data.frame(
  category = c("Category A", "Category B", "Category C", "Category D", "Category E"),
  value = c(45, 67, 23, 89, 56)
)

# Create dot plot
pophive_plot(
  data = df_dot,
  plot_type = "dot",
  aes_mappings = aes(x = value, y = reorder(category, value)),
  title = "Category Comparison",
  subtitle = "Example horizontal dot plot",
  caption = "Data source: sample data",
  x_label = "Value",
  y_label = "Category",
  dot_size = 4
)

# Sample data
df_col <- data.frame(
  category = rep(c("Q1", "Q2", "Q3", "Q4"), 3),
  value = c(runif(4, 20, 50), runif(4, 30, 60), runif(4, 25, 55)),
  group = rep(c("Product A", "Product B", "Product C"), each = 4)
)

# Create column chart
pophive_plot(
  data = df_col,
  plot_type = "col",
  aes_mappings = aes(x = category, y = value, fill = group),
  title = "Quarterly Sales by Product",
  subtitle = "Sales performance across different products and quarters",
  caption = "Data source: sample data",
  x_label = "Quarter",
  y_label = "Sales (thousands)",
  position = "dodge",
  bar_width = 0.7
)


library(sf)
library(maps)

# Sample spatial data
states <- st_as_sf(maps::map("state", plot = FALSE, fill = TRUE))
states$value <- runif(nrow(states), 0, 100)

# Create map
pophive_plot(
  data = states,
  plot_type = "map",
  aes_mappings = aes(fill = value),
  title = "US Population Density by State",
  subtitle = "Example choropleth map with custom PopHIVE theme",
  caption = "Data Source: sf package",
  legend_title = "Population Density"
)
