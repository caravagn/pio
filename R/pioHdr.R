#' Print a title. 
#' 
#' @description Print a header, plus some optional parameters.
#'
#' @param ... A list of parameters that will be concatenated to
#' create the header.
#' @param toPrint A named vector of arguments, that will be print in the format `n=v`
#' where `n` is a name and `v` a value using function \code{\link{pioStr}}.
#' @param prefix A prefix for each one of the strings in `toPrint`, passed to \code{\link{pioStr}}.
#'
#' @return None
#' @export pioHdr
#'
#' @examples
#' # A simple header
#' pioHdr("My new cool tool")
#' 
#' # A header with also some parameters, if the parameters
#' # are not part of a named vector, automatic names are generated
#' 
#' x = 12345
#' y = TRUE
#' z = NA
#' 
#' pioHdr("My new cool function", toPrint = c(x, y, z))
#' 
#' # If names are available, they are used
#' params = c(x, y, z)
#' names(params) = c("Input = ", "Test = ", "Plot = ")
#' 
#' pioHdr("My new cool function", toPrint = params)
#' 
#' # Using extra formats
#' pioHdr("My new cool function", toPrint = params, prefix = '\t- ')
#' 
#' # Change colours -- blak text on orange background
#' colorscheme_orange_black()
#' pioHdr("My new cool function", toPrint = params)
pioHdr = function(...,
                  toPrint = NULL,
                  prefix = '')
{
  colors = getColors()
  
  # =-=-=-=-=-=-=-=-
  # Header print
  # =-=-=-=-=-=-=-=-
  
  # Header unrolling
  header = pioTkn(..., no_color = TRUE)
  
  # Header print
  cat(
    colors$header_bg_colour(
      colors$header_fg_colour(
        paste(" [", header, "] \n")
        )
      )
    )
  
  # =-=-=-=-=-=-=-=-
  # Extra parameters
  # =-=-=-=-=-=-=-=-
  
  if (!all(is.null(toPrint)))
  {
    toPrint = consolidate_names(toPrint)
    
    for (l in seq_along(toPrint))
      pioStr(
        names(toPrint)[l], 
        toPrint[l],
        suffix = '\n',
        prefix = prefix
        )
  }
  
  invisible(NULL)
}

