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
#' na_counter(X=df, col_index = c("feat1"))
#'
na_counter <- function(X, col_index) {

}
