#' Linear regression between two vectors
#'
#' @param x The independant variable
#'
#' @param y The dependant variable.
#'
#' @param plot_it Display a plot of \code{x} vs \code{y} Use logical.
#'
#' @return The summary of the linear regression between \code{x} and \code{y}.
#'
#' @details
#'
#' This function performs a linear regression of \code{y} as a function of \code{x}, plots the results and returns a summary.
#'
#' @examples
#' a <- c(1:10)
#' b <- c(1:10)
#' regress(a,b,TRUE)
#' @export
regress <- function(x,y,plot_it=FALSE) {
  if (!is.numeric(x))
    stop("x should be numeric.")
  if (!is.numeric(y))
    stop("y should be numeric.")
  res <- lm(y ~ x)
  if (plot_it) print(ggplot2::qplot(x, y))
  return(summary(res))
}

