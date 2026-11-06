# stadlColorPaletteR 0.1.0

* The five STADL brand colors (`stadl_base_colors`, `stadl_colors()`) with a
  tint/shade scale from 50 to 900 for each (`stadl_shade_table`).
* Sequential and diverging palettes (`stadl_palettes`, `stadl_pal()`,
  `stadl_pal_fun()`, `stadl_palette_names()`, `show_stadl_palettes()`).
* ggplot2 scales `scale_colour_stadl()` / `scale_color_stadl()` and
  `scale_fill_stadl()` for discrete and continuous data. Their arguments
  changed: they now take a palette name.
* plotly colorscales with `stadl_colorscale()`.
* Fixed `color_palette()` ignoring a `subset` that includes the last color.
* `inst/mycolors.csv` now holds the STADL brand colors.
* Removed the template functions `my_median()` and `my_other_median()`.

# stadlColorPaletteR 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
