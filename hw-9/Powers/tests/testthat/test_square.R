context("Squaring non-numerics")

test_that("At least numeric values work.", {
  x <- c(0, -4.6, 3.4)
  y <- c(2,3.4,5)
  expect_identical(square(x), x^2)
  expect_identical(cube(x), x^3)
  expect_identical(reciprocal(x), 1/x)
  expect_identical(diff(x,y), x-y)
  expect_equal(regress(x,y), summary(lm(y~x)))
})

test_that("Logicals automatically convert to numeric.", {
  logic_vec <- c(TRUE, TRUE, FALSE)
  logic_vec_2 <- c(FALSE, TRUE, FALSE)
  expect_error(square(logic_vec), "x should be numeric.")
  expect_error(cube(logic_vec), "x should be numeric.")
  expect_error(reciprocal(logic_vec), "x should be numeric.")
  expect_error(diff(logic_vec,logic_vec_2), "x should be numeric.")
  expect_error(regress(logic_vec,logic_vec_2), "x should be numeric.")

})

test_that("String Data.", {
  string_vec <- c("A", "B", "C")
  string_vec_2 <- c("F", "B", "J")
  expect_error(square(string_vec), "x should be numeric.")
  expect_error(cube(string_vec), "x should be numeric.")
  expect_error(reciprocal(string_vec), "x should be numeric.")
  expect_error(diff(string_vec,string_vec_2), "x should be numeric.")
  expect_error(regress(string_vec,string_vec_2), "x should be numeric.")


})
