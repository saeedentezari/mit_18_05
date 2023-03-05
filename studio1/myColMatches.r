# File: myColMatches.r

myColMatchesHelp = function()
{
  cat("#---------------------------------------\n")
  cat("Usage: myColMatches(A, szmatch)\n")
  cat("Description: for each column at array A, checks if at least\n")
  cat("one entry repeated at least szmatch times.\n")
  cat("A: an array \"or\" a vector of length n which will be considered\n")
  cat("as a n x 1 array\n")
  cat("szmatch: the number of matches to check, default is set to 2\n")
  cat("\n")
  cat("Returns: a vector of TRUE's and FALSE's\n")
  cat("in size of number of columns of A\n")
  cat("TRUE means at least one entry was repeated at least szmatch times\n")
  cat("otherwise it would be FALSE.\n")
  cat("#---------------------------------------\n")
}

myColMatches = function(A, szmatch=2)
{
  # RED_FLAG: We assume that A is a vector "or" a 2 dimensional array
  A.dim = dim(A)
  if (is.null(A.dim))
  {
    # then A is a vector
    nrows = length(A)
    ncols = 1
    # sort vector A
    # and transform vector A into a matrix with 1 column, for compatibility
    Asorted = matrix(sort(A), nrow=nrows, ncol=ncols)
  }
  else
  {
    # so A should be a 2 dimensional array, concluded from RED_FLAG
    nrows = A.dim[1]
    ncols = A.dim[2]
    # sort A in each column
    # to sort A in each row, you can use apply(A, 1, sort) instead
    Asorted = apply(A, 2, sort)
  }
  # RED_FLAG: We don't check that szmatch > 0
  if (szmatch > nrows)
  {
    # can't possibly have more matches than number of rows
    # so return a vector of 0's, ncols times
    return(rep(0, times=ncols))
  }
  else
  {
    # compare each row i by row i+szmatch
    shifted_compar = Asorted[1:(nrows-szmatch+1),] == Asorted[szmatch:nrows,]
    if (ncols == 1)
    {
      # Note: any operation (like slicing) on arrays which its result is a
      # 1d array or a strip (a row or a column), will output a vector
      # In this case, slicing a n x 1 matrix (or array) by Asorted[*,]
      # will return us a vector, so colSums() function returns an error
      # because colSums operates on  arrays only
      # therefore we use sum() function
      return(sum(shifted_compar) > 0)
    }
    if (szmatch == nrows)
    {
      # shifted_compar would be a vector if szmatch == nrows
      # and colSums function doesn't work on vectors
      # it is sufficient to return same shifted_compar in this case
      return(shifted_compar)
    }
    else
    {
      # colSums checks if there is any repetitive element in each column
      return(colSums(shifted_compar) > 0)
    }
  }
}