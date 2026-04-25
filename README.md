
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PopHivePlots

<!-- badges: start -->
<!-- badges: end -->

**PopHivePlots** provides standardized ggplot2 themes and color
palettes consistent with PopHIVE brand guidelines. The package
simplifies the creation of publication-ready visualizations with a
single main function that automatically applies appropriate styling.

## Features

- **Single main function** (`pophive_plot()`) for creating branded
  visualizations
- **Five plot types supported:**
  - Choropleth maps
  - Line graphs
  - Dot plots
  - Bar charts
  - Column charts
- **Consistent brand styling** across all visualizations
- **Custom fonts** (Source Serif 4 and Rubik from Google Fonts)
- **PopHIVE color palettes** derived from viridis color schemes

## Installation

You can install the development version of PopHivePlots from GitHub:

``` r
# install.packages("devtools")
devtools::install_github(“PopHIVE/pophive_plots”)
library(PopHivePlots)
library(ggplot2)
```

## Setup

**Important:** You must call `setup_pophive_fonts()` at the start of
each R session before creating any plots:

``` r
library(PopHivePlots)
library(ggplot2)

# Load PopHIVE fonts (required - call once per session)
setup_pophive_fonts()
```

## Usage

The main function is `pophive_plot()`, which takes your data, plot type,
and aesthetic mappings:

``` r
pophive_plot(
  data = your_data,
  plot_type = "line",  # or "map", "dot", "bar", "col"
  aes_mappings = aes(x = x_var, y = y_var, color = group_var),
  title = "Your Title",
  subtitle = "Your Subtitle",
  caption = "Data Source: Your Source",
  x_label = "X Axis Label",
  y_label = "Y Axis Label"
)
```

## Examples

### Line Graph

``` r
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
```

### Dot Plot

``` r
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
```

### Bar/Column Chart

``` r
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
```

### Choropleth Map

``` r
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
```

## Customization Options

The `pophive_plot()` function includes many customization parameters:

### General Parameters

- `title`, `subtitle`, `caption` - Plot labels
- `x_label`, `y_label` - Axis labels

### Plot-Specific Parameters

- **Line plots:**
  - `line_width` - Line thickness (default: 1)
  - `date_breaks`, `date_labels` - Date axis formatting
  - `y_scale_type` - Y-axis scale ("comma", "percent", "dollar")
- **Dot plots:**
  - `dot_size` - Size of dots (default: 4)
  - `dot_color` - Color of dots (default: "\#4e98e4")
- **Bar/Column charts:**
  - `position` - Bar positioning ("dodge", "stack", "fill")
  - `bar_width` - Width of bars (default: 0.7)
- **Maps:**
  - `legend_title` - Title for the legend

## Brand Colors

PopHIVE uses the following color scheme:

**Main Colors:** 
- Navy: `#00356b` 
- White: `#ffffff` 
- Light Blue: `#bedeff`

**Secondary Colors:** 
- Lime Green: `#d6ef4a` 
- Orange: `#ffc232` 
- Pink: `#fecdd0` 
- Purple: `#eadafa`

**Plot-Specific Palettes:** 
- Line graphs and bar charts use colors from the viridis "magma" palette 
- Maps use the full magma color scale (reversed)

## Fonts

The package uses two Google Fonts: 
- **Source Serif 4** - For plot titles 
- **Rubik** - For all other text (subtitles, captions, axis labels, legends)

## Dependencies

### Required Packages

- `ggplot2` (\>= 3.4.0)
- `showtext` (\>= 0.9)
- `sysfonts` (\>= 0.8)
- `scales` (\>= 1.2.0)

### Optional Packages (for specific plot types)

- `sf` (\>= 1.0) - For choropleth maps
- `ggstar` (\>= 1.0) - For dot plots
- `maps` (\>= 3.4) - For example map data

## Internal Use

This package is primarily designed for internal use by the PopHIVE team
to ensure consistent visual identity across projects and products.

## Getting Help

For questions or issues, please contact the package maintainer or open
an issue on GitHub.

## License

MIT License
