



#' Display some content. We try to convert almost everything to tibbles
#' as they have a nice layout function.
#'
#' @param x Content to display
#'
#' @return None
#' @export
#'
#' @examples
#' M = matrix(1:100, ncol = 10)
#' M[1,4] = NA
#' pioDisp(M)
pioDisp = function(x)
{
  if (is.data.frame(x))
    print(tibble::as.tibble(x))

  if (is.vector(x)) {
    if (is.null(names(x)))
      names(x) = paste('Entry #', 1:length(x), sep = '')

    df = data.frame(entry = names(x),
                    value = x,
                    stringsAsFactors = FALSE)
    print(tibble::as.tibble(df))
  }

  if (is.matrix(x))
  {
    print(tibble::as.tibble(x))
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
