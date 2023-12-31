% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color_palette.R
\name{color_palette}
\alias{color_palette}
\title{Create a function that allows to interpolate and acces colors.}
\usage{
color_palette(
  colors_to_interpolate,
  base_colors_set,
  subset = as.vector(NULL),
  reverse = FALSE,
  ...
)
}
\arguments{
\item{colors_to_interpolate}{Name of the colors to interpolate. It is the name of a list element as generated by the function \code{\link[=generate_colors_to_interpolate]{generate_colors_to_interpolate()}}.}

\item{base_colors_set}{A list of colors to interplotate. Output from \code{\link[=generate_colors_to_interpolate]{generate_colors_to_interpolate()}}.}

\item{subset}{A numeric vector indicating the color's position you want to keep.}

\item{reverse}{Boolean indicating whether or not to reverse the order of the colors.}

\item{...}{Other arguments to \link[grDevices:colorRamp]{grDevices::colorRampPalette}}
}
\value{
A function interpolating colors.
}
\description{
Create a function that allows to interpolate and acces colors.
}
\examples{
datafile <- system.file("mycolors.csv", 
                        package = "stadlColorPaletteR")
mycolors <- readr::read_csv(datafile)

# combinations with 2 colors
base_cols <- generate_colors_to_interpolate(mycolors, 2)

# interpolate first element of base_cols
mycolors_interpolated <- color_palette(
  colors_to_interpolate = 'pal1',
  base_colors = base_cols
)
}
