getColors = function()
{
  return(
    list(
      # Header 
      header_bg_colour = getOption('pio.header_bg_colour', default = crayon::bgBlue),
      header_fg_colour = getOption('pio.header_fg_colour', default = crayon::white),
      # Title
      title_sep_colour = getOption('pio.title_sep_colour', default = crayon::cyan),
      title_bg_colour = getOption('pio.title_bg_colour', default = crayon::black),
      title_fg_colour = getOption('pio.title_fg_colour', default = crayon::cyan),
      # String
      string_bg_colour = getOption('pio.string_bg_colour', default = crayon::black),
      string_fg_colour = getOption('pio.string_fg_colour', default = crayon::cyan)
    )
  )
}