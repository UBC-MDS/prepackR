#' Split data into train and test sets.
#'
#'
#' Takes in a tbl_df, df, or data.frame and returns a tbl_df for each of X_train, X_test, y_train, y_test.
#'
#' @param X tbl_df, tbl, data.frame
#' @param target_index integer
#' @param split_size numeric
#' @param seed integer
#'
#' @return tbl_df
#' @export
#'
#' @examples
#' df <- tibble::tibble(X = c(1:10), y = rbinom(10, 1, 0.5))
#'
#' split_data <- splitter(df, target_index, split_size = 0.8, seed=42)
#'

splitter <- function(X, target_index, split_size, seed) {
  
  # input type check
  if (!is.data.frame(X) | !is.tibble(X)){
    stop("TypeError: X must be of tbl_df, tbl, or data.frame")
  }
  if (!is.numeric(target_index)){
    stop("TypeError: target_index must be of numeric")
  }
  if (!is.numeric(split_size)){
    stop("TypeError: split_size must be of numeric")
  }
  if (!is.numeric(seed)){
    stop("TypeError: seed must be of numeric")
  }
  
  # input value check
  if (dim(X)[1] < 2 | dim(X)[2] < 2){
    stop("ValueError: X must contains at least two observations and at least two columns")
  }
  if (target_index > dim(X)[2]){
    stop("ValueError: target_index cannot exceed the number of columns")
  }
  if (split_size <= 0 | split_size >= 1){
    stop("ValueError: split_size must be within 0 and 1")
  }
  if (seed < 0 | seed > .Machine$integer.max){
    stop("ValueeError: seed must be between 0 and 2147483647")
  }
  
  if (is.data.frame(X)){
    X <- as.tibble(X)
  }
  
  # split dataset into features and target
  y <- X[target_index]
  
  features <- X[-c(target_index)]
 
  # set random seed
  set.seed(seed)
  
  # generate train/test indices by random sampling 
  row_index <- seq(1, dim(X)[1], 1)
  test_index <- sample(1:dim(X)[1], round(dim(X)[1] * split_size), replace=FALSE)
  train_index <- row_index[-c(test_index)]
  
  # generate X_train, y_train, X_test, y_test
  X_train <- features[c(train_index),]
  y_train <- y[c(train_index),]
  X_test <- features[c(test_index),]
  y_test <- y[c(test_index),]
  
  # add result into a list
  result <- list(Xtrain = X_train, ytrain = y_train, 
                 Xtest = X_test, ytest = y_test)
  return(result)
}

