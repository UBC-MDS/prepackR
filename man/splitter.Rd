% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/splitter.R
\name{splitter}
\alias{splitter}
\title{Split data into train and test sets.}
\usage{
splitter(X, target_index, split_size, seed)
}
\arguments{
\item{X}{tbl_df, tbl, data.frame, input dataset}

\item{target_index}{numeric, the column index of target variable}

\item{split_size}{numeric, proportion of the dataset to include in the test split}

\item{seed}{numeric, random state that will make code reproducible}
}
\value{
result, list, a list contains four tbl_df including Xtrain, ytrain, Xtest, ytest
}
\description{
Takes in a tbl_df, df, or data.frame and returns a tbl_df for each of X_train, X_test, y_train, y_test.
}
\examples{
df <- tibble::tibble(X = c(1:10), y = rbinom(10, 1, 0.5))

split_data <- splitter(df, target_index = 1, split_size = 0.8, seed=42)

}
