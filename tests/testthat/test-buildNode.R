test_that("buildNode format check", {
  # too long

  # id
  expect_error(buildNode())
  expect_error(buildNode(TRUE))

  # shape
  expect_error(buildNode("abc", shape = "myshape"))
})

test_that("buildNode default check", {
  # too long, just check member and length is fine
  testNode <- buildNode("testID")
  expect_equal(typeof(testNode), "list")
  expect_equal(length(testNode), 3) # consist with group, data, position
  expect_equal(testNode$group, "nodes")
  expect_equal(length(testNode$data), 61) # data with 61 attributes
})

test_that("textWrap check", {
  expect_no_error(
    buildNode("testID", textWrap = "wrap")
  )

  expect_error(
    buildNode("testID", textWrap = "warp")
  )
})

test_that("textAlign check", {
  expect_no_error(
    buildNode("testID", textAlign = "center")
  )

  expect_error(
    buildNode("testID", textAlign = "middle")
  )
})
