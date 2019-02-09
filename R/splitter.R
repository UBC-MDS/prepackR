#' Split data into train and test sets.
#'
#' Takes in a tbl_df, df, or data.frame and returns a tbl_df for each of X_train, X_test, y_train, y_test.
#'
#' @param X tbl_df, tbl, data.frame
#' @param target_index numeric
#' @param split_size numeric
#' @param seed numeric
#'
#' @return tbl_df
#' @export
#'
#' @examples
#' df <- tibble::tibble(X = c(1:10), y = rbinom(10, 1, 0.5))
#'
#' split_data <- splitter(df, target_index = "y", split_size = 0.8, seed=42)
splitter <- function(X, target_index, split_size, seed) {

}

