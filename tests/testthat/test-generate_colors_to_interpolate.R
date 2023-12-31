# WARNING - Generated by {fusen} from dev/flat_full.Rmd: do not edit by hand


  set.seed(123)
  myc <- tibble(color_names = sample(colors(),5), 
                     hex_code = colorRampPalette(color_names)(length(color_names)))
  
  p2 <- combn(get_color_hex_code(base_colors = myc),2)
  colnames(p2) <- paste('pal',1:ncol(p2), sep = '')
  p2 <- as.list(
    as.data.frame(p2)
  )

  p1 <- generate_colors_to_interpolate(colors = myc, 2)
  
  testthat::expect_true(
    identical(p1, p2)
  )
  
  testthat::expect_error(generate_colors_to_interpolate(colors = myc, 0), 
               "n must be greater than 1")

  testthat::expect_error(generate_colors_to_interpolate(colors = myc, 0))
  
