#' Preset blue and cyan color scheme (default)
#'
#' @return Nothing
#' @export colorscheme_default
#'
#' @examples
#' colorscheme_default()
#' pioHdr("Example")
#' pioStr("Example", FALSE)
colorscheme_default = function()
{
  # Header 
  options('pio.header_bg_colour' = crayon::bgBlue)
  options('pio.header_fg_colour' = crayon::white)
  
  # Title
  options('pio.title_sep_colour' = crayon::cyan)
  options('pio.title_fg_colour' = crayon::cyan)
  
  # String
  options('pio.string_bg_colour' = crayon::bgBlack)
  options('pio.string_fg_colour' = crayon::cyan)
}