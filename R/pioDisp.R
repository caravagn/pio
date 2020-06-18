



#' Display some content. 
#' 
#' @description 
#' 
#' This function tries to convert almost everything to `tibble`
#' data structure, so that we can exploit their nice layout functions.
#'
#' @param x Content to display
#'
#' @return Nothing.
#' 
#' @import tibble
#' 
#' @export
#'
#' @examples
#' M = matrix(1:100, ncol = 10)
#' M[1,4] = NA
#' pioDisp(M)
pioDisp = function(x)
{
  if (is.data.frame(x))
    print(tibble::as_tibble(x))

  if (is.vector(x)) {
    if (is.null(names(x)))
      names(x) = paste('Entry #', 1:length(x), sep = '')

    df = data.frame(entry = names(x),
                    value = x,
                    stringsAsFactors = FALSE)
    print(tibble::as_tibble(df))
  }

  if (is.matrix(x))
  {
    print(tibble::as_tibble(x))
  }

  invisible(NULL)
}



# myFun = function(x, y, z, w, ...) {
#   # Call to the header function
#   pioHdr("My new cool function to do this and that",
#          toPrint = c(
#            `Significance (alpha)` = x,
#            `Statistical test` = y,
#            `Multiple Hypothesis Correction` = z,
#            `Plots` = w
#          ),
#          prefix = '\t-')
# 
# 
#   return(1234)
# }
# 
# myFun(0.05, "Fisher", TRUE, NA)
# 
# options('pio.header_bg_colour' = crayon::bgYellow)
# options('pio.header_fg_colour' = crayon::black)
# 
# myFun(0.05, "Fisher", TRUE, NA)
