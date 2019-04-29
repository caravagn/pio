#' Preset yellow and black color scheme.
#'
#' @return Nothing
#' @export colorscheme_orange_black
#'
#' @examples
#' colorscheme_orange_black()
#' pioHdr("Example")
#' pioStr("Example", 'Test')
colorscheme_orange_black = function()
{
  # Header 
  options('pio.header_bg_colour' = crayon::bgYellow)
  options('pio.header_fg_colour' = crayon::black)
  
  # Title
  options('pio.title_sep_colour' = crayon::yellow)
  options('pio.title_fg_colour' = crayon::yellow)
  
  # String
  options('pio.string_bg_colour' = crayon::bgBlack)
  options('pio.string_fg_colour' = crayon::yellow)
}
