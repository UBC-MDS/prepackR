context("Test splitter function")

library(prepackR)

TOY_X <- tibble::tibble(x = c(1,3,5,4), y = c(2,4,6,3), z=c(3,3,3,2))

# test splitter <- function(X, target_index, split_size, seed)

test_that("Test that the type of input parameters is correct",{
  expect_error(splitter(X=c(1,2,3), target_index=1, split_size=0.2, seed=1), "TypeError: X must be of tbl_df, tbl, or data.frame")
  expect_error(splitter(X=3.5, target_index=1, split_size=0.2, seed=1), "TypeError: X must be of tbl_df, tbl, or data.frame")
  expect_error(splitter(X="X", target_index=1, split_size=0.2, seed=1), "TypeError: X must be of tbl_df, tbl, or data.frame")
  expect_error(splitter(X=TOY_X, target_index="1", split_size=0.2, seed=1), "TypeError: target_index must be of numeric")
  expect_error(splitter(X=TOY_X, target_index=1, split_size="0.2", seed=1), "TypeError: split_size must be of numeric")
  expect_error(splitter(X=TOY_X, target_index=1, split_size=0.2, seed="1"), "TypeError: seed must be of numeric")
})

test_that("Test that the values of input parameters is valid", {
  expect_error(splitter(X=tibble::tibble(c(1)), target_index=1, split_size=0.2, seed=1), "ValueError: X must contains at least two observations and at least two columns")
  expect_error(splitter(X=TOY_X, target_index=5, split_size=0.2, seed=1), "ValueError: target_index cannot exceed the number of columns")
  expect_error(splitter(X=TOY_X, target_index=1, split_size=1.5, seed=1), "ValueError: split_size must be within 0 and 1")
  expect_error(splitter(X=TOY_X, target_index=1, split_size=0.2, seed=-1), "ValueeError: seed must be between 0 and 2147483647")
})

test_that("Test that split proportions for each output is valid", {
  result <- splitter(X=TOY_X, target_index=1, split_size=0.25, seed=1)
  expect_true(dim(result$Xtrain)[1] == 3, "size of X_train doesn't match")
  expect_true(dim(result$ytrain)[1] == 3, "size of y_train doesn't match")
  expect_true(dim(result$Xtest)[1] == 1, "size of X_test doesn't match")
  expect_true(dim(result$ytest)[1] == 1, "size of y_test doesn't match")
})

test_that("Test that split result for each output is valid", {
  result <- splitter(X=TOY_X, target_index=1, split_size=0.25, seed=1)
  expected_Xtrain <- tibble::tibble(y=c(2,6,3), z=c(3,3,2))
  expected_ytrain <- tibble::tibble(x=c(1,5,4))
  expected_Xtest <- tibble::tibble(y=c(4), z=c(3))
  expected_ytest <- tibble::tibble(x=c(3))
  expect_equal(result$Xtrain, expected_Xtrain)
  expect_equal(result$ytrain, expected_ytrain)
  expect_equal(result$Xtest, expected_Xtest)
  expect_equal(result$ytest, expected_ytest)
})
