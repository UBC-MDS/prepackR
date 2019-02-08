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
#' df_stdized <- stdizer(X = df, col_index = c(1, 2), method = 'mean_std')
stdizer <- function(X, col_index, method, method_args) {

}
