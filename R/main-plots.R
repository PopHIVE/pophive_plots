#' PopHIVE Theme for Choropleth Maps
#'
#' @description
#' Applies the PopHIVE brand styling to choropleth maps. This theme is based
#' on `theme_void()` and includes customized title, subtitle, caption, and
#' legend styling consistent with PopHIVE brand guidelines.
#'
#' @return A ggplot2 theme object.
#'
#' @keywords internal
#' @noRd
theme_pophive_map <- function() {
  ggplot2::theme_void() +
    ggplot2::theme(
      # Title styling
      plot.title = ggplot2::element_text(
        family = "source_serif",
        color = "#00356b",
        size = 18,
        face = "plain",
        margin = ggplot2::margin(b = 5),
        hjust = 0
      ),
      plot.title.position = "plot",

      # Subtitle styling
      plot.subtitle = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        hjust = 0,
        margin = ggplot2::margin(b = 10)
      ),

      # Caption styling
      plot.caption = ggplot2::element_text(
        family = "rubik",
        color = "gray",
        size = 10,
        hjust = 0,
        margin = ggplot2::margin(t = 10)
      ),

      # Margins
      plot.margin = ggplot2::margin(20, 10, 10, 10, "pt"),

      # Legend positioning and styling
      legend.position = c(0.95, 0.05),
      legend.justification = c(1, 0),
      legend.direction = "horizontal",

      # Legend title
      legend.title = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10
      ),

      # Legend box styling
      legend.background = ggplot2::element_rect(
        fill = "white",
        color = "gray",
        linewidth = 0.5
      ),

      # Legend key styling for horizontal bar
      legend.key.width = grid::unit(1.5, "cm"),
      legend.key.height = grid::unit(0.3, "cm"),

      # Legend margins
      legend.margin = ggplot2::margin(5, 5, 5, 5),

      # Transparent background
      plot.background = ggplot2::element_rect(fill = "transparent", color = NA),
      panel.background = ggplot2::element_rect(fill = "transparent", color = NA)
    )
}


#' PopHIVE Fill Scale for Choropleth Maps
#'
#' @description
#' Applies a continuous fill scale suitable for choropleth maps using the
#' viridis "magma" color palette (reversed). Includes customized legend styling
#' consistent with PopHIVE brand guidelines.
#'
#' @param legend_title Character string for the legend title. Default is "legend title".
#' @param ... Additional arguments passed to `scale_fill_viridis_c()`.
#'
#' @return A ggplot2 scale object (technically a list containing the scale).
#'
#' @keywords internal
#' @noRd
scale_fill_pophive_map <- function(legend_title = "legend title", ...) {
  list(
    ggplot2::scale_fill_viridis_c(
      option = "magma",
      direction = -1,
      name = legend_title,
      na.value = "transparent",
      guide = ggplot2::guide_colorbar(
        title.position = "top",
        title.hjust = 0.5,
        barwidth = grid::unit(4, "cm"),
        barheight = grid::unit(0.4, "cm"),
        frame.colour = "gray",
        ticks.colour = "gray"
      ),
      ...
    )
  )
}


#' PopHIVE Theme for Line Graphs
#'
#' @description
#' Applies the PopHIVE brand styling to line graphs. This theme is based on
#' `theme_minimal()` and includes customized axis, grid, legend, and text styling
#' consistent with PopHIVE brand guidelines.
#'
#' @return A ggplot2 theme object.
#'
#' @keywords internal
#' @noRd
theme_pophive_line <- function() {
  ggplot2::theme_minimal() +
    ggplot2::theme(
      # Title styling
      plot.title = ggplot2::element_text(
        family = "source_serif",
        color = "#00356b",
        size = 18,
        face = "plain",
        margin = ggplot2::margin(b = 5),
        hjust = 0
      ),
      plot.title.position = "plot",

      # Subtitle styling
      plot.subtitle = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        hjust = 0,
        size = 10,
        margin = ggplot2::margin(b = 10)
      ),

      # Caption styling
      plot.caption = ggplot2::element_text(
        family = "rubik",
        color = "gray",
        size = 10,
        hjust = 0,
        margin = ggplot2::margin(t = 10)
      ),
      plot.caption.position = "plot",

      # White background
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),

      # Margins
      plot.margin = ggplot2::margin(20, 10, 10, 10, "pt"),

      # Panel grid styling - dashed horizontal lines only
      panel.grid.major.y = ggplot2::element_line(color = "gray", linetype = "dashed", linewidth = 0.2),
      panel.grid.minor.y = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),

      # Y axis styling
      axis.text.y = ggplot2::element_text(
        family = "rubik",
        color = "#00356b",
        size = 10,
        hjust = 0,
        margin = ggplot2::margin(r = 5)
      ),
      axis.title.y = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        angle = 90,
        margin = ggplot2::margin(r = 10)
      ),
      axis.line.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),

      # X axis styling
      axis.text.x = ggplot2::element_text(
        family = "rubik",
        color = "#00356b",
        size = 10,
        margin = ggplot2::margin(t = 5)
      ),
      axis.title.x = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        margin = ggplot2::margin(t = 10)
      ),
      axis.line.x = ggplot2::element_line(color = "gray", linewidth = 0.5),
      axis.ticks.x = ggplot2::element_line(color = "gray"),

      # Legend styling - top position, horizontal
      legend.position = "top",
      legend.justification = "left",
      legend.direction = "horizontal",
      legend.title = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(
        family = "rubik",
        color = "#00356b",
        size = 10,
        margin = ggplot2::margin(r = 15)
      ),
      legend.key = ggplot2::element_blank(),
      legend.key.width = grid::unit(1.5, "cm"),
      legend.margin = ggplot2::margin(b = 5)
    )
}


#' PopHIVE Color Scale for Line Graphs
#'
#' @description
#' Applies the PopHIVE color palette to line graphs. Uses 6 colors from the
#' viridis "magma" color scheme.
#'
#' @param ... Additional arguments passed to `scale_color_manual()`.
#'
#' @return A ggplot2 scale object.
#'
#' @keywords internal
#' @noRd
scale_color_pophive_line <- function(...) {
  ggplot2::scale_color_manual(
    values = pophive_line_colors(),
    ...
  )
}


#' PopHIVE Line Type Scale for Line Graphs
#'
#' @description
#' Applies the PopHIVE line type pattern to line graphs. Alternates between
#' solid and dashed lines for up to 6 categories.
#'
#' @param ... Additional arguments passed to `scale_linetype_manual()`.
#'
#' @return A ggplot2 scale object.
#'
#' @keywords internal
#' @noRd
scale_linetype_pophive_line <- function(...) {
  ggplot2::scale_linetype_manual(
    values = pophive_line_types(),
    ...
  )
}


#' PopHIVE Theme for Dot Plots
#'
#' @description
#' Applies the PopHIVE brand styling to horizontal dot plots. This theme is
#' based on `theme_minimal()` and includes customized axis, grid, and text
#' styling consistent with PopHIVE brand guidelines.
#'
#' @return A ggplot2 theme object.
#'
#' @keywords internal
#' @noRd
theme_pophive_dot <- function() {
  ggplot2::theme_minimal() +
    ggplot2::theme(
      # Title styling
      plot.title = ggplot2::element_text(
        family = "source_serif",
        color = "#00356b",
        size = 18,
        face = "plain",
        margin = ggplot2::margin(b = 5),
        hjust = 0
      ),
      plot.title.position = "plot",

      # Subtitle styling
      plot.subtitle = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        hjust = 0,
        margin = ggplot2::margin(b = 10)
      ),

      # Caption styling
      plot.caption = ggplot2::element_text(
        family = "rubik",
        color = "gray",
        size = 10,
        hjust = 0,
        margin = ggplot2::margin(t = 10)
      ),
      plot.caption.position = "plot",

      # White background
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),

      # Margins
      plot.margin = ggplot2::margin(20, 10, 10, 10, "pt"),

      # Panel grid styling - dotted horizontal lines only
      panel.grid.major.y = ggplot2::element_line(color = "gray", linetype = "dotted", linewidth = 0.5),
      panel.grid.minor.y = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),

      # Y axis styling (categories)
      axis.text.y = ggplot2::element_text(
        family = "rubik",
        color = "#00356b",
        size = 12,
        hjust = 1,
        margin = ggplot2::margin(r = 10)
      ),
      axis.title.y = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        angle = 90,
        margin = ggplot2::margin(r = 10)
      ),
      axis.line.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),

      # X axis styling (values)
      axis.text.x = ggplot2::element_text(
        family = "rubik",
        color = "#00356b",
        size = 12,
        margin = ggplot2::margin(t = 5)
      ),
      axis.title.x = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        margin = ggplot2::margin(t = 10)
      ),
      axis.line.x = ggplot2::element_blank(),
      axis.ticks.x = ggplot2::element_line(color = "gray"),

      # No legend for basic dot plot
      legend.position = "none"
    )
}


#' PopHIVE Theme for Bar and Column Charts
#'
#' @description
#' Applies the PopHIVE brand styling to bar and column charts. This theme is
#' based on `theme_minimal()` and includes customized axis, grid, legend, and
#' text styling consistent with PopHIVE brand guidelines.
#'
#' @return A ggplot2 theme object.
#'
#' @keywords internal
#' @noRd
theme_pophive_col <- function() {
  ggplot2::theme_minimal() +
    ggplot2::theme(
      # Title styling
      plot.title = ggplot2::element_text(
        family = "source_serif",
        color = "#00356b",
        size = 18,
        face = "plain",
        margin = ggplot2::margin(b = 5),
        hjust = 0
      ),
      plot.title.position = "plot",

      # Subtitle styling
      plot.subtitle = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        hjust = 0,
        margin = ggplot2::margin(b = 10)
      ),

      # Caption styling
      plot.caption = ggplot2::element_text(
        family = "rubik",
        color = "gray",
        size = 10,
        hjust = 0,
        margin = ggplot2::margin(t = 10)
      ),
      plot.caption.position = "plot",

      # White background
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),

      # Margins
      plot.margin = ggplot2::margin(20, 10, 10, 10, "pt"),

      # Panel grid styling - dotted horizontal lines only
      panel.grid.major.y = ggplot2::element_line(color = "gray", linetype = "dotted", linewidth = 0.5),
      panel.grid.minor.y = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),

      # Y axis styling
      axis.text.y = ggplot2::element_text(
        family = "rubik",
        color = "#00356b",
        size = 12,
        hjust = 0,
        margin = ggplot2::margin(r = 5)
      ),
      axis.title.y = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        angle = 90,
        margin = ggplot2::margin(r = 10)
      ),
      axis.line.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),

      # X axis styling
      axis.text.x = ggplot2::element_text(
        family = "rubik",
        color = "#00356b",
        size = 12,
        margin = ggplot2::margin(t = 5)
      ),
      axis.title.x = ggplot2::element_text(
        family = "rubik",
        color = "gray30",
        size = 10,
        margin = ggplot2::margin(t = 10)
      ),
      axis.line.x = ggplot2::element_line(color = "gray", linewidth = 0.5),
      axis.ticks.x = ggplot2::element_line(color = "gray"),

      # Legend styling - top position, horizontal
      legend.position = "top",
      legend.justification = "left",
      legend.direction = "horizontal",
      legend.title = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(
        family = "rubik",
        color = "#00356b",
        size = 12,
        margin = ggplot2::margin(r = 15)
      ),
      legend.key = ggplot2::element_blank(),
      legend.key.width = grid::unit(1.5, "cm"),
      legend.margin = ggplot2::margin(b = 5)
    )
}


#' PopHIVE Fill Scale for Bar and Column Charts
#'
#' @description
#' Applies the PopHIVE color palette to bar and column charts. Uses 5 colors
#' from the viridis "magma" color scheme.
#'
#' @param ... Additional arguments passed to `scale_fill_manual()`.
#'
#' @return A ggplot2 scale object.
#'
#' @keywords internal
#' @noRd
scale_fill_pophive_col <- function(...) {
  ggplot2::scale_fill_manual(
    values = pophive_col_colors(),
    ...
  )
}
