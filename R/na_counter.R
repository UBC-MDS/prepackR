#' Summarize the missing values that exist in a dataframe
#'
#' @param X tbl_df, df, data.frame
#' @param col_index vector of columns
#'
#' @return tbl_df
#' @export
#'
#' @examples
#'
#' df <- tibble::tibble(feat1 = c(1:3, NA, 5:7, NA, NA, NA))
#'
#' na_data <- na_counter(X=df, col_index = c("feat1"))
#'

na_counter <- function(X, col_index=c()) {
  assertthat::assert_that(is.vector(col_index) | is.null(col_index), msg = "col_index must be a vector")
  assertthat::assert_that(is.data.frame(X), msg = "X must be a dataframe")
  X <- tibble::as_tibble(X)
  if (length(col_index)!=0){
    X <- dplyr::select(X, col_index)
  }
  na_count <- dplyr::summarise_all(X, dplyr::funs(sum(is.na(.))))
  return(na_count)
}
