#' Print a title. 
#' 
#' @description Print a title to screen, surrounded by lines created
#' from a separator (e.g., `=-`). A title has a newline both before
#' and after the title is print.
#'
#' @param ... A list of parameters that will be concatenated to
#' create the title.
#' @param prefix A prefix to the string and dashes (e.g. some indentation
#' char like `\\t`), nothing by default.
#' @param separator_motif The separator motif, default is `=-`.
#'
#' @return None
#' @export pioTit
#'
#' @import crayon
#' 
#' @examples
#' pioTit('We now perform some long computation') # A title can be a long string
#'
#' # Can contain variables
#' x = 12345
#' y = "myFun"
#' pioTit('We now call', y, 'with', x, "as inoput")
#' 
#' # A title can be indented
#' pioTit('To the right', prefix = '\t')
#' 
#' # Or even have more complex layouts
#' pioTit('To the right', prefix = '>--\\/\\/\\/-->>')
#' 
#' # The separator can be customized
#' pioTit('We now perform some long computation', separator_motif = '|-=__=-|')
pioTit =  function(...,
                   prefix = '',
                   separator_motif = '=-')
{
  colors = getColors()
  
  # Title to print
  title = pioTkn(..., no_color = TRUE)
  
  # Border line (separator)
  ncharT = ceiling(nchar(title) / nchar(separator_motif)) + 1
  
  line = paste(rep(separator_motif, ncharT), collapse = '')
  line = colors$title_sep_colour(paste0(prefix, line))
  
  # Actual title is wrapped within separators
  cat(paste('\n', line, '\n', sep = ''))
  cat(colors$title_bg_colour(colors$title_fg_colour(prefix, title)))
  cat(paste('\n', line, '\n', sep = ''))
  
  invisible(NULL)
}