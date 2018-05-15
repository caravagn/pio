#' Print a header, and optional parameters
#'
#' @param header A string
#' @param toPrint A named vector of arguments, that will be print in the format `n=v`
#' where `n` is a name and `v` a value.
#' @param prefix A prefix for each one of the strings in `toPrint`
#' @param suffix A suffix for each one of the strings in `toPrint`
#'
#' @return None
#' @export
#'
#' @examples
#' pioHdr("My new cool function",
#'  toPrint = c(
#'   `Cutoff for significance` = 0.05,
#'   `Statistical test` = "Fisher",
#'   `Multiple Hypothesis Correction` = TRUE,
#'   `Plots` = NA
#'  ),
#'  prefix = '\t-')
#'
#'  # Change colours -- balck text on orange background
#'  options('pio.header_bg_colour' = crayon::bgYellow)
#'  options('pio.header_fg_colour' = crayon::black)
#'  pioHdr("My new cool function")
pioHdr = function(header,
                  toPrint = NULL,
                  prefix = '',
                  suffix = '')
{
  hfcol = getOption('pio.header_bg_colour', default = crayon::bgBlue)
  htfcol = getOption('pio.header_fg_colour', default = crayon::white)

  afcol = getOption('pio.args_colour', default = crayon::cyan)

  cat(hfcol(htfcol(paste(" [", header, "] \n"))))

  if (!is.null(toPrint))
  {
    ntoPrint = length(toPrint)

    if (is.null(names(toPrint)))
      names(toPrint) = paste('Arg #', 1:ntoPrint, sep = '')

    for (l in seq(toPrint))
      cat(afcol(prefix, names(toPrint)[l], '='),
          pioTkn(toPrint[l]),
          afcol(suffix),
          '\n')
  }

  invisible(NULL)
}

#' A one-line title print to screen, surrounded by dashes
#'
#' @param title The title to print.
#' @param prefix A prefix to the string and dashes.
#'
#' @return None
#' @export
#'
#' @examples
#' pioTit('We now perform some long computation')
pioTit =  function(title, prefix = '')
{
  tfcol = getOption('pio.title_fg_colour', default = crayon::cyan)

  ncharT = nchar(title)

  line = tfcol(paste(prefix, paste(rep('-', ncharT), collapse = ''), sep = ''))

  cat(paste('\n', line, '\n', sep = ''))
  cat(paste(prefix, tfcol(title), sep = ''))
  cat(paste('\n', line, '\n', sep = ''))

  invisible(NULL)
}

#' A simple string value print, with colour over string
#'
#' @param str First string.
#' @param val Second string.
#'
#' @return None
#' @export
#'
#' @examples
#' pioStr("My string", 12345)
pioStr =  function(str, val, suffix = '', prefix = '')
{
  tfcol = getOption('pio.string_fg_colour', default = crayon::cyan)

  cat(paste(prefix, tfcol(str), val, suffix))
  invisible(NULL)
}


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
