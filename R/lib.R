# Add Args names to x
consolidate_names = function(x)
{
  n = length(x)
  
  if (is.null(names(x)))
    names(x) = paste0('Arg. #', 1:n)
  
  x
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

