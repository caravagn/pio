#' Print a string `A = ...`.
#' 
#' @description 
#' 
#' This function prints a string `A = ...`. thought to represent a 
#' description `A` followed by one or more values `...`.
#' 
#' For instance `P-value = 0.05` can be print by
#' passing the string `"P-value ="` together with `0.05`.
#' 
#' The function colours the first of the two
#' parameters via options `pio.string_bg_colour` and
#' `pio.string_fg_colour`, and the second string according to
#' the tokenizer function \code{\link{pioTkn}}.
#' 
#' The function can also add a prefix and a suffix to the output,
#' which allows easily to indent the output message, or add
#' a newline at the end of it.
#' 
#' @param str First string to print, the description that is to
#' be coloured.
#' @param ... A list of parameters that will be concatenated to
#' create the second, non coloured, value. 
#' These will be tokenized with \code{\link{pioTkn}}.
#' @param suffix Suffix to add as tail of the string.
#' @param prefix Suffix to add as head of the string.
#' 
#' @return None
#' @export
#'
#' @examples
#' pioStr("My string", 12345)
#' pioStr("My variable", TRUE, 'for some reason')
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
