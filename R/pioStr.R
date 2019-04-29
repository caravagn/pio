#' Print a pair of values.
#' 
#' @description This function can print a pair of values
#' which are thought to represent a description followed by
#' a value. For instance `P-value = 0.05` would be print by
#' passing the string `"P-value ="` together with `0.05`.
#' The function is thought to colour the first of the two
#' parameters via options `pio.string_bg_colour` and
#' `pio.string_fg_colour`, and the second string according to
#' the tokenizer function \code{\link{pioTkn}}.
#' The function can also add a prefix and a suffix to the output,
#' which allows easily to indent the output message, or add
#' a newline at the end of it.
#' 
#' @param str First string to print, the description that can
#' be coloured.
#' @param ... A list of parameters that will be concatenated to
#' create the seconf value. These will be tokenized with \code{\link{pioTkn}}.
#' @param suffix Suffix to add as tail of the string.
#' @param prefix Suffix to add as head of the string.
#' 
#' @return None
#' @export
#'
#' @examples
#' pioStr("My string", 12345)
#' pioStr("My string", TRUE)
pioStr =  function(str, ..., suffix = '', prefix = '')
{
  colors = getColors()
  
  # Tokenizer
  tokens  = pioTkn(...)
  
  # Print
  cat(
    colors$string_bg_colour(colors$string_fg_colour(paste0(prefix, str))),
    tokens,
    colors$string_bg_colour(colors$string_fg_colour(paste0(suffix)))
  )
  
  invisible(NULL)
}
