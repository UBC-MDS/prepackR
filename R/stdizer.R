#' Standardize features within a dataframe.
#'
#' Accepts a tbl_df, df, or data.frame and returns a tbl_df with standardized features
#'
#' @param X tbl_df, df, data.frame
#' @param col_index vector of strings or integers
#' @param method string
#' @param method_args vector
#'
#' @return tbl_df
#' @export
#'
#' @examples
#' df <- tibble::tibble(feat1 = c(1:100), feat2 = runif(100, min = 0, max = 5000))
#'
#' df_stdized <- stdizer(X = df, col_index = c(1, 2), method = 'mean_sd')
#'

stdizer <- function(X, col_index=NULL, method='mean_sd', method_args) {

  if (is.null(col_index)) {
    col_index <- names(X)
  }

  assertthat::assert_that(nrow(X) > 1, msg = "Must have more than one observation.")
  assertthat::assert_that(is.data.frame(X) | tibble::is_tibble(X), msg = "X not of type dataframe or tibble")
  assertthat::assert_that(method %in% c("mean_sd", "mean", "sd", "min_max", "own"), msg = "Invalid method argument")

  if (method == "mean_sd") {
    for (i in col_index) {
      mn <- mean(X[[i]])
      std <- sd(X[[i]]) * sqrt((nrow(X) - 1) / nrow(X))
      X[i] <- (X[[i]] - mn)/std
    }
  } else if (method == "mean") {
    for (i in col_index) {
      mn <- mean(X[[i]])
      X[i] <- X[[i]] - mn
    }
  } else if (method == "sd") {
    for (i in col_index) {
      std <- sd(X[[i]]) * sqrt((nrow(X) - 1) / nrow(X))
      X[i] <- X[[i]]/std
    }
  } else if (method == "min_max") {
    for (i in col_index) {
      min_val <- min(X[[i]])
      max_val <- max(X[[i]])
      X[i] <- (X[[i]] - min_val)/max_val
    }
  } else if (method == "own") {
    for (i in col_index) {
      mn <- method_args[1]
      std <- method_args[2]
      X[i] <- (X[[i]] - mn)/std
    }
  }

  return(X)

}
