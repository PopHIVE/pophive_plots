#' Create PopHIVE Styled Plot
#'
#' @description
#' Main function to create publication-ready plots with PopHIVE brand styling.
#' This is the primary user-facing function that handles all plot types.
#'
#' @param data A data frame or sf object containing the data to plot.
#' @param plot_type Character string specifying the type of plot to create.
#'   Options are: "map", "line", "dot", "bar", "col" (same as "bar").
#' @param aes_mappings A list of aesthetic mappings created with `aes()`.
#'   Required mappings depend on plot type:
#'   - map: `fill` (and geometry from sf object)
#'   - line: `x`, `y`, `color`, `linetype` (color and linetype usually the same variable)
#'   - dot: `x`, `y`
#'   - bar/col: `x`, `y`, `fill`
#' @param title Character string for the plot title. Default is NULL.
#' @param subtitle Character string for the plot subtitle. Default is NULL.
#' @param caption Character string for the plot caption. Default is NULL.
#' @param x_label Character string for the x-axis label. Default is NULL.
#' @param y_label Character string for the y-axis label. Default is NULL.
#' @param legend_title Character string for the legend title. Used only for map plots.
#'   Default is "Legend".
#' @param position For bar/col charts, the position adjustment. Options are
#'   "dodge", "stack", or "fill". Default is "dodge".
#' @param bar_width Numeric value for the width of bars in bar/col charts.
#'   Default is 0.7.
#' @param line_width Numeric value for the width of lines in line plots.
#'   Default is 1.
#' @param date_breaks For line plots with date x-axis, the spacing of date breaks
#'   (e.g., "1 month", "1 year"). Default is NULL (automatic).
#' @param date_labels For line plots with date x-axis, the format of date labels
#'   (e.g., "%b %Y", "%Y"). Default is NULL (automatic).
#' @param y_scale_type For line plots, the type of y-axis scale transformation
#'   from the scales package (e.g., "comma", "percent", "dollar"). Default is "comma".
#' @param dot_color Character string for the color of dots in dot plots.
#'   Default is "#4e98e4" (PopHIVE blue).
#' @param dot_size Numeric value for the size of dots in dot plots. Default is 4.
#' @param ... Additional arguments passed to the geom layer.
#'
#' @return A ggplot2 object with PopHIVE styling applied.
#'
#' @details
#' This function automatically applies the appropriate PopHIVE theme and color
#' scales based on the plot type. Make sure to call `setup_pophive_fonts()`
#' at the start of your R session before creating plots.
#'
#' Plot types:
#' - "map": Choropleth maps using sf objects
#' - "line": Line graphs with time series or continuous data
#' - "dot": Horizontal dot plots for comparisons
#' - "bar" or "col": Bar/column charts for categorical comparisons
#'
#' @examples
#' \dontrun{
#' # Load fonts first
#' library(pophive)
#' setup_pophive_fonts()
#'
#' # Choropleth map
#' library(sf)
#' pophive_plot(
#'   data = states_sf,
#'   plot_type = "map",
#'   aes_mappings = aes(fill = population),
#'   title = "US Population by State",
#'   subtitle = "2024 estimates",
#'   caption = "Source: Census Bureau",
#'   legend_title = "Population"
#' )
#'
#' # Line graph
#' pophive_plot(
#'   data = time_series,
#'   plot_type = "line",
#'   aes_mappings = aes(x = year, y = value, color = category, linetype = category),
#'   title = "Trends Over Time",
#'   x_label = "Year",
#'   y_label = "Value",
#'   line_width = 0.8
#' )
#'
#' # Dot plot
#' pophive_plot(
#'   data = comparison_data,
#'   plot_type = "dot",
#'   aes_mappings = aes(x = value, y = reorder(category, value)),
#'   title = "Category Comparison",
#'   x_label = "Value",
#'   y_label = "Category"
#' )
#'
#' # Bar chart
#' pophive_plot(
#'   data = sales_data,
#'   plot_type = "col",
#'   aes_mappings = aes(x = quarter, y = sales, fill = product),
#'   title = "Quarterly Sales",
#'   x_label = "Quarter",
#'   y_label = "Sales (thousands)",
#'   position = "dodge"
#' )
#' }
#'
#' @export
pophive_plot <- function(data,
                         plot_type = c("map", "line", "dot", "bar", "col"),
                         aes_mappings,
                         title = NULL,
                         subtitle = NULL,
                         caption = NULL,
                         x_label = NULL,
                         y_label = NULL,
                         legend_title = "Legend",
                         position = "dodge",
                         bar_width = 0.7,
                         line_width = 1,
                         date_breaks = NULL,
                         date_labels = NULL,
                         y_scale_type = "comma",
                         dot_color = "#4e98e4",
                         dot_size = 4,
                         ...) {

  # Match plot type
  plot_type <- match.arg(plot_type)

  # Treat "col" same as "bar"
  if (plot_type == "col") plot_type <- "bar"

  # Check required packages
  required_packages <- c("ggplot2")
  if (plot_type == "map") required_packages <- c(required_packages, "sf")
  if (plot_type == "dot") required_packages <- c(required_packages, "ggstar")

  for (pkg in required_packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      stop(paste0("Package '", pkg, "' is required for plot_type = '", plot_type,
                  "'. Please install it with: install.packages('", pkg, "')"))
    }
  }

  # Initialize plot based on type
  if (plot_type == "map") {
    # Choropleth map
    p <- ggplot2::ggplot(data, aes_mappings) +
      ggplot2::geom_sf(color = "gray", size = 0.3, ...) +
      scale_fill_pophive_map(legend_title = legend_title) +
      theme_pophive_map()

  } else if (plot_type == "line") {
    # Line graph
    p <- ggplot2::ggplot(data, aes_mappings) +
      ggplot2::geom_line(linewidth = line_width, ...) +
      scale_color_pophive_line() +
      scale_linetype_pophive_line() +
      theme_pophive_line()

    # Add date formatting if specified
    if (!is.null(date_breaks) || !is.null(date_labels)) {
      p <- p + ggplot2::scale_x_date(
        date_breaks = date_breaks,
        date_labels = date_labels
      )
    }

    # Add y-axis formatting
    scale_fun <- switch(
      y_scale_type,
      "comma" = scales::comma,
      "percent" = scales::percent,
      "dollar" = scales::dollar,
      scales::comma  # default
    )
    p <- p + ggplot2::scale_y_continuous(labels = scale_fun)

  } else if (plot_type == "dot") {
    # Dot plot
    p <- ggplot2::ggplot(data, aes_mappings) +
      ggstar::geom_star(
        starshape = "hexagon",
        color = dot_color,
        size = dot_size,
        fill = dot_color,
        ...
      ) +
      theme_pophive_dot()

  } else if (plot_type == "bar") {
    # Bar/column chart
    p <- ggplot2::ggplot(data, aes_mappings) +
      ggplot2::geom_col(position = position, width = bar_width, ...) +
      scale_fill_pophive_col() +
      theme_pophive_col()
  }

  # Add labels
  p <- p + ggplot2::labs(
    title = title,
    subtitle = subtitle,
    caption = caption,
    x = x_label,
    y = y_label
  )

  return(p)
}
