#' PopHIVE Color Palette
#'
#' @description
#' Returns the PopHIVE brand color palette. This includes main brand colors
#' (navy, white, light blue) and secondary colors (lime green, orange, pink, purple).
#'
#' @param type Character string specifying which palette to return.
#'   Options are "main", "secondary", or "all" (default).
#'
#' @return A named character vector of hex color codes.
#'
#' @keywords internal
#' @noRd
pophive_colors <- function(type = "all") {
  main_colors <- c(
    navy = "#00356b",
    white = "#ffffff",
    light_blue = "#bedeff"
  )

  secondary_colors <- c(
    lime_green = "#d6ef4a",
    orange = "#ffc232",
    pink = "#fecdd0",
    purple = "#eadafa"
  )

  if (type == "main") {
    return(main_colors)
  } else if (type == "secondary") {
    return(secondary_colors)
  } else {
    return(c(main_colors, secondary_colors))
  }
}


#' Setup PopHIVE Fonts
#'
#' @description
#' Loads and registers PopHIVE brand fonts (Source Serif 4 and Rubik) from
#' Google Fonts using the sysfonts and showtext packages. This function MUST be called
#' at the beginning of your R session before creating any plots with pophive_plot().
#'
#' @return NULL (invisible). Fonts are loaded as a side effect.
#'
#' @details
#' This function requires the `showtext` and `sysfonts` packages to be installed.
#' The fonts are registered with the following names:
#' - "source_serif" for Source Serif 4 (used for plot titles)
#' - "rubik" for Rubik (used for axis labels, subtitles, and captions)
#'
#' After calling this function, `showtext_auto()` is enabled, which allows
#' the fonts to be used in ggplot2 graphics.
#'
#' @examples
#' \dontrun{
#' library(pophive)
#' # Call this at the start of your R session
#' setup_pophive_fonts()
#'
#' # Then create plots
#' pophive_plot(data, plot_type = "map", aes(fill = value))
#' }
#'
#' @export
setup_pophive_fonts <- function() {
  if (!requireNamespace("showtext", quietly = TRUE)) {
    stop("Package 'showtext' is required. Please install it with: install.packages('showtext')")
  }
  if (!requireNamespace("sysfonts", quietly = TRUE)) {
    stop("Package 'sysfonts' is required. Please install it with: install.packages('sysfonts')")
  }

  # Load Google Fonts
  sysfonts::font_add_google(
    "Source Serif 4",  # name in fonts.google.com
    "source_serif"     # name in session
  )

  sysfonts::font_add_google(
    "Rubik",           # name in fonts.google.com
    "rubik"            # name in session
  )

  # Enable showtext
  showtext::showtext_auto()

  invisible(NULL)
}


#' Get PopHIVE Line Colors
#'
#' @description
#' Returns the color palette used for line graphs in the PopHIVE style.
#' This is a 6-color palette derived from the viridis "magma" color scheme.
#'
#' @return A character vector of 6 hex color codes.
#'
#' @keywords internal
#' @noRd
pophive_line_colors <- function() {
  c("#000004", "#29125a", "#6b1d80", "#ad347c", "#e95661", "#fe9e6d")
}


#' Get PopHIVE Column/Bar Colors
#'
#' @description
#' Returns the color palette used for column and bar charts in the PopHIVE style.
#' This is a 5-color palette derived from the viridis "magma" color scheme.
#'
#' @return A character vector of 5 hex color codes.
#'
#' @keywords internal
#' @noRd
pophive_col_colors <- function() {
  c("#29125a", "#6b1d80", "#ad347c", "#e95661", "#fe9e6d")
}


#' Get PopHIVE Line Types
#'
#' @description
#' Returns the line type pattern used for line graphs in the PopHIVE style.
#' Alternates between solid and dashed lines for up to 6 categories.
#'
#' @return A character vector of 6 line type specifications.
#'
#' @keywords internal
#' @noRd
pophive_line_types <- function() {
  c("solid", "dashed", "solid", "dashed", "solid", "dashed")
}
