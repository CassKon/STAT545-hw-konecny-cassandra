#' Calculate the difference between two numbers
#'

#' @param x The number that \code{y} is subtracted from.
#'
#' @param y The number that is substracted from \code{x}.
#'
#' @return The difference between \code{x} and \code{y}.
#'
#' @details
#'
#' This function caluculated the diffence between two numbers that are inputted by the user (\code{x},\code{y}).
#'
#' @examples
#' diff(1,5)
#' diff(100,3)
#' @export

diff <- function(x,y) {
  if (!is.numeric(x))
    stop("x should be numeric.")
  if (!is.numeric(y))
    stop("y should be numeric.")
  return(x-y)
}
