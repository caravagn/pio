#' Preset yellow and black color scheme.
#'
#' @return Nothing
#' @export colorscheme_purple_ivory
#'
#' @examples
#' colorscheme_purple_ivory()
#' pioHdr("Example")
#' pioStr("Example", 'Test')
colorscheme_purple_ivory = function()
{
  # Header 
  options('pio.header_bg_colour' = make_style("darkorchid4", bg = TRUE))
  options('pio.header_fg_colour' = make_style("ivory"))
  
  # Title
  options('pio.title_sep_colour' = make_style("darkorchid4"))
  options('pio.title_fg_colour' = make_style("darkorchid4"))
  
  # String
  options('pio.string_bg_colour' = crayon::bgWhite)
  options('pio.string_fg_colour' = make_style("darkorchid4"))
}

