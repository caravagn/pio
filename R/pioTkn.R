#' Tokenizer.
#' 
#' @description This function tokenizes each one of
#' a set of ellipsis parameters, and creates a
#' concatenated output string with spaces. Each input
#' value will be tokenized as follows: if the value is
#' `NA` or `NULL`, a red background is reported with
#' white text; if the value is logical, true values will
#' be green and false value will be red. In all other cases
#' the output and the input match.
#'
#' @param ... A list of parameters to tokenize and collapse.
#' @param no_color If `TRUE`, avaoids tokenizing and returns
#' just the collapsed output string.
#'
#' @return A collapsed output strong with tokenized inputs.
#' @export pioTkn
#' 
#' @import crayon
#'
#' @examples
#' # Takenize different types of variables 
#' cat(pioTkn(4, 5, "banana", TRUE, NULL, FALSE, NA))
#' 
#' # assemble without tokenizing 
#' cat(pioTkn(4, 5, FALSE, NA, no_color = TRUE))
pioTkn = function(..., no_color = FALSE)
{
  # Tokenizer function
  tkz = function(x) 
  {
    # NA or NULL cases
    if(is.null(x)) return(crayon::bgRed(' NULL '))
    if(is.na(x)) return(crayon::bgRed(' NA '))
    
    # Logical
    if(class(x) == 'logical' && x) return(crayon::green(x))
    if(class(x) == 'logical' && !x) return(crayon::red(x))
    
    # All the rest is plain
    x
  }
  
  # Tokens to print, coloured only if required
  input = list(...)
  if(!no_color) input = sapply(input, tkz)

  # Collapsed
  paste(sapply(input, paste), collapse = ' ')
}