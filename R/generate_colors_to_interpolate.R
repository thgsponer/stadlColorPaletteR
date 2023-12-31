# WARNING - Generated by {fusen} from dev/flat_full.Rmd: do not edit by hand

#' Generate all possible combination of n colors from the total number N of colors provided. Will be used later for interpolation. 
#'
#' @param colors A tibble with color_names and hex_codes as columns. 
#' @param n An integer between 1 and number of colors provided.
#'
#' @return
#' A list of length C(N,n), each element containing n colors, where C(N,n) denotes the number of n-combination from a set of N elements. 
#' 
#' @export
#'
#' @examples
#' datafile <- system.file("mycolors.csv", 
#'                         package = "stadlColorPaletteR")
#' mycolors <- readr::read_csv(datafile)
#'
#' # combinations with 2 colors
#' generate_colors_to_interpolate(mycolors, 2)
#'
#' #combinations with all colors
#' generate_colors_to_interpolate(mycolors, nrow(mycolors))
#'
generate_colors_to_interpolate <- function(colors, n){
  if(n<1) {
    stop("n must be greater than 1")
  }
  pal <- combn(get_color_hex_code(base_colors = colors),n)
  colnames(pal) <- paste('pal',1:ncol(pal), sep = '')
  as.list(
    as.data.frame(pal)
  )
}
