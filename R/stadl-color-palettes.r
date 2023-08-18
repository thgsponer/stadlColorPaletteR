library(ggplot2)
library(scales)
library(ggpubr)

#STADL base colors
stadl_colors <- c(`white` = '#F2F0F0',
  `red` = '#BE427B',
  `green` = '#BEA742',
  `brown` = '#85752E',
  `turquise` = '#42B6BE',
  `grey` = '#2E7F85'
)

#funtion to extract hex code
stadlcols <- function(...) {
  cols <- c(...)
  if (is.null(cols))
    return (stadl_colors)
  stadl_colors[cols]
}

# test
stadlcols("red")
stadlcols("green", "blue")
ggplot(iris, aes(Sepal.Width, Sepal.Length)) +
  geom_point(color = stadlcols("red"),
             size = 1.5, alpha =1)+
  theme_test()

# palettes based on all combinations of 2 colors
stadlpalette2 <- combn(stadlcols(),2)
colnames(stadlpalette2) <- paste('pal',1:ncol(stadlpalette2), sep = '')
stadlpalette2 <- as.list(
  as.data.frame(stadlpalette2)
)

# palettes based on all combinations of 3 colors
stadlpalette3 <- combn(stadlcols(),3)
colnames(stadlpalette3) <- paste('pal',1:ncol(stadlpalette3), sep = '')
stadlpalette3 <- as.list(
  as.data.frame(stadlpalette3)
)

# palettes based on all combinations of 4 colors
stadlpalette4 <- combn(stadlcols(),4)
colnames(stadlpalette4) <- paste('pal',1:ncol(stadlpalette4), sep = '')
stadlpalette4 <- as.list(
  as.data.frame(stadlpalette4)
)

# palettes based on all combinations of 5 colors
stadlpalette5 <- combn(stadlcols(),5)
colnames(stadlpalette5) <- paste('pal',1:ncol(stadlpalette5), sep = '')
stadlpalette5 <- as.list(
  as.data.frame(stadlpalette5)
)

#access and interpolate colors
stadl_pal <- function(palette = "pal1", palettes = stadlpalette5, reverse = FALSE, ...) {
  pal <- palettes[[palette]]
  if (reverse) pal <- rev(pal)
  colorRampPalette(pal, ...)
}


# scales for ggplot
scale_color_stadl <- function(palette = "main", palettes = stadlpalette2,
                              discrete = TRUE, reverse = FALSE, ...) {
  pal <- stadl_pal(palette = palette, reverse = reverse, palettes = palettes)

  if (discrete) {
    discrete_scale("colour", paste0("stadl_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


scale_fill_stadl <- function(palette = "main", palettes = stadlpalette2, 
                             discrete = TRUE, reverse = FALSE, ...) {
  pal <- stadl_pal(palette = palette, reverse = reverse, palettes = palettes)

  if (discrete) {
    discrete_scale("fill", paste0("stadl_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}


ggplot(iris, 
       aes(Sepal.Width, Sepal.Length, color = Species)) +
  geom_point(size = 2, alpha = 1) +
  scale_color_stadl(discrete = TRUE, palette = "pal6",palettes = stadlpalette5)+ 
  ggtitle("stadl")+theme_minimal()

