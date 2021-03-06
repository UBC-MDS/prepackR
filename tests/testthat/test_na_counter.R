context("NA_counter function")

library(prepackR)

test_that("Test that input type is of tbl_df or data.frame",{

  expect_error(na_counter(c(1,2,3,4)))
  expect_error(na_counter(1))
  expect_error(na_counter("string"))

})

test_that("Test that the function works correctly",{

  # create toy dataset 1
  df <- tibble::tibble(x = c(0,NA,1,1), y = c(0,NA,1,NA))
  df_return <- tibble::tibble(x = as.integer(c(1)), y = as.integer(c(2)))
  # create toy dataset 2
  df_2 <- tibble::tibble(x = c(0,1,1,1), y = c(NA,NA,NA,NA))
  df_return_2 <- tibble::tibble(x = as.integer(c(0)), y = as.integer(c(4)))
  # create toy dataset 3
  df_3 <- tibble::tibble(x = character(), y = character())
  df_return_3 <- tibble::tibble(x = as.integer(c(0)), y = as.integer(c(0)))
  # test each method
  expect_equal(na_counter(df), df_return)
  expect_equal(na_counter(df_2), df_return_2)
  expect_equal(na_counter(df_3), df_return_3)
  expect_equal(na_counter(df, col_index=c()), df_return)

})

test_that("Test that the columns argument is working",{

  # create toy dataset 1
  df <- tibble::tibble(x = c(0,NA,1,1), y = c(0,NA,1,NA))
  expect_error(na_counter(df, col_index = c(1, 4)))

})
