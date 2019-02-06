# prepackR

## Team
1. Jingyun Chen: [jchen9314](https://github.com/jchen9314)
2. Anthony Chiodo: [apchiodo](https://github.com/apchiodo)
3. Sarah Watts: [smwatts](https://github.com/smwatts)

## Topic:

A common rule of thumb for data scientist is that the data preparation process will take approximately 80% of the total time on a project. Not only is this process time consuming, but it is also considered one of the less enjoyable components of a project ([Forbes, 2016](https://www.forbes.com/sites/gilpress/2016/03/23/data-preparation-most-time-consuming-least-enjoyable-data-science-task-survey-says/#3d12fbbf6f63)). To help address this problem, we have decided to build a package that will help improve some of the common techniques used in data preparation. This includes a function that will streamline the process of splitting a dataset into testing and training data (and provide a model ready output!), a function that incorporates more standardization methods then a data scientist could ever want _and_ a function that will allow data scientist to quickly understand the columns and quantity with `NA` values in a dataset. 

## Function Descriptions:

## Relationship to the R ecosystem

### `splitter`

This function does not currently exist in R. However, the function [sample](https://www.rdocumentation.org/packages/base/versions/3.5.2/topics/sample) from the [base R](https://www.rdocumentation.org/packages/base/versions/3.5.2) package will be relevant. Specifically, it returns a random subset of an input vector based on a specified size. In order apply a random split to the training/testing data based on a specified percentage, we will need to leverage this function.

### `stdizer`

The function [scale](https://www.rdocumentation.org/packages/base/versions/3.5.2/topics/scale) exists in the [base R](https://www.rdocumentation.org/packages/base/versions/3.5.2) package. It allows you to standardize by:
1. Subtracting mean and dividing by standard deviation
2. Subtracting mean
3. Dividing by standard deviation

However, this function is not a one-stop shop to scale by:
1. Subtracting a first value, then dividing by second (a user specified mean and standard deviation)
2. Making a range from a start to end value (to linearly transform the data from a user specified minimum to maximum)

As a result, this function will allow users more options for their method of standardization.

These standardization techniques are based on the [Minitab documentation](https://support.minitab.com/en-us/minitab/18/help-and-how-to/calculations-data-generation-and-matrices/standardize/standardize-columns-of-data/).

### `na_counter`

This function does not currently exist in R. However, the function [is.na()](https://www.rdocumentation.org/packages/base/versions/3.5.2/topics/NA) from the [base R](https://www.rdocumentation.org/packages/base/versions/3.5.2) package is relevant because it allows users to identify `NA` values. Specifically, it returns a logical vector of the same length as the argument `x`, where the vector will contain TRUE for `NA` elements and FALSE otherwise. To count the number of `NA` values in each column, we will need to leverage this existing function.