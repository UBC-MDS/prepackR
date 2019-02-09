context("Standardizer function")

library(prepackR)
library(tibble)

test_that("Test that input type is of tbl_df or data.frame",{

  expect_error(stdizer(c(1,2,3,4)))
  expect_error(stdizer(1))
  expect_error(stdizer("string"))

})

test_that("Test that length of column is at least 2", {

  expect_error(stdizer(tibble(col = c(1))))
  expect_success(stdizer(tibble(col = c(1, 2))))

})

test_that("Test that each method works",{

  # create toy dataset
  df <- tibble(x = c(0,0,1,1), y = c(0,0,1,1))

  # create result for each method
  result_mean_sd <- tibble(x = c(-1, -1, 1, 1), y = c(-1, -1, 1, 1))
  result_mean <- tibble(x = c(-0.5, -0.5, 0.5, 0.5), y = c(-0.5, -0.5, 0.5, 0.5))
  result_sd <- tibble(x = c(0, 0, 2, 2), y = c(0, 0, 2, 2))
  result_min_max <- tibble(x = c(-2, -2, -1.5, -1.5), y = c(-0.75, -0.75, -0.5 -0.5))
  result_own <- tibble(x = c(0,0,1,1), y = c(0,0,1,1))

  # test each method
  expect_equal(stdizer(df, method="mean_sd"), result_mean_sd)
  expect_equal(stdizer(df, method="mean"), result_mean)
  expect_equal(stdizer(df, method="sd"), result_sd)
  expect_equal(stdizer(df, method="min_max"), result_min_max)
  expect_equal(stdizer(df, method="own", method_args = list(c(4, 2), c(3,4))), result_own)


})

test_that("Test that method argument is valid", {

  expect_error(stdizer(tibble(col = c(1, 2), method="not a method")))

  expect_success(stdizer(tibble(col = c(1, 2), method="mean_sd")))
  expect_success(stdizer(tibble(col = c(1, 2), method="mean")))
  expect_success(stdizer(tibble(col = c(1, 2), method="sd")))
  expect_success(stdizer(tibble(col = c(1, 2), method="min_max", method_args = c(0, 1))))
  expect_success(stdizer(tibble(col = c(1, 2), method="own", method_args = c(2, 4))))

})
