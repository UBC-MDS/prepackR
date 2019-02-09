context("Test splitter function")

library(prepackR)
library(tibble)

TOY_X <- tibble(x = c(1,3,5,4), y = c(2,4,6,3), z=c(3,3,3,2))

# test splitter <- function(X, target_index, split_size, seed)

test_that("Test that the type of input parameters is correct",{
  expect_error(splitter(X=c(1,2,3), target=1, split_size=0.2, seed=1), "TypeError: X must be of tbl_df, tbl, or data.frame")
  expect_error(splitter(X=3.5, target=1, split_size=0.2, seed=1), "TypeError: X must be of tbl_df, tbl, or data.frame")
  expect_error(splitter(X="X", target=1, split_size=0.2, seed=1), "TypeError: X must be of tbl_df, tbl, or data.frame")
  expect_error(splitter(X=TOY_X, target_index="1", split_size=0.2, seed=1), "TypeError: target_index must be of numeric")
  expect_error(splitter(X=TOY_X, target_index=1, split_size="0.2", seed=1), "TypeError: split_size must be of numeric")
  expect_error(splitter(X=TOY_X, target_index=1, split_size=c(0.2, 0.3), seed=1), "TypeError: split_size must be of numeric")
  expect_error(splitter(X=TOY_X, target_index=1, split_size=0.2, seed="1"), "TypeError: seed must be of numeric")
})

test_that("Test that the values of input parameters is valid", {
  expect_error(splitter(X=tibble(c(1)), target_index=1, split_size=0.2, seed=1), "ValueError: X should contains at least two observations")
  expect_error(splitter(X=TOY_X, target_index=5, split_size=0.2, seed=1), "ValueError: target_index is out of bound")
  expect_error(splitter(X=TOY_X, target_index=1, split_size=1.5, seed=1), "ValueError: split_size is out of bound")
  expect_error(splitter(X=TOY_X, target_index=1, split_size=-1.5, seed=1), "ValueError: split_size is out of bound")
})

test_that("Test that split proportions for each output for is valid", {
  result <- splitter(X=TOY_X, target_index=5, split_size=0.25, seed=1)
  expect_equal(dim(result[[1]])[1] == 3, "size of X_train doesn't match")
  expect_equal(dim(result[[1]])[2] == 3, "size of y_train doesn't match")
  expect_equal(dim(result[[1]])[3] == 1, "size of X_test doesn't match")
  expect_equal(dim(result[[1]])[4] == 1, "size of y_test doesn't match")
})

