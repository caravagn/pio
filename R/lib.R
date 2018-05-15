
pioTkn = function(x)
{
  if(is.null(x)) return(crayon::bgRed(' NULL '))
  if(is.na(x)) return(crayon::bgRed(' N/A '))

  # if(is.character(x))
  # {
  #   return(crayon::blue(paste("\"", x, "\"", sep = '')))
  # }

  if(is.logical(x) ||
    (
       is.character(x) && (x == 'FALSE' || x == 'TRUE')

  ))
  {
    x = as.logical(x)

    if(x) return(crayon::green(x))
    else return(crayon::red(x))
  }

  return(x)
}


# set x's values to be the names of y
nmfy = function(x, y)
{
  names(y) = x
  y
}


# Convert matrix to df
m2df = function(matr) {
  dfedges = data.frame(stringsAsFactors = F)

  for(i in 1:nrow(matr)) {
    for(j in 1:ncol(matr)) {
        dfedges = rbind(dfedges, data.frame(
          entry.row = rownames(matr)[i],
          entry.col = colnames(matr)[j],
          value = matr[i, j],
          stringsAsFactors = FALSE))

    }
  }

  dfedges = dfedges[order(m2df$value, decreasing = TRUE), , drop = FALSE]

  return(dfedges)
}

