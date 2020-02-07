test_that('buildIoptions format check',{
  expect_error(buildIOptions(minZoom = 'minimal'))
  expect_error(buildIOptions(maxZoom = ''))
  expect_error(buildIOptions(autolock = 'True'))
  expect_error(buildIOptions(zoomingEnabled = 'TRUE'))
})

test_that('buildIoptions default check',{
  expect_equal(buildIOptions(), list(
    minZoom = 1e-50,
    maxZoom = 1e50,
    zoomingEnabled=TRUE,
    userZoomingEnabled = TRUE,
    panningEnabled= TRUE,
    userPanningEnabled = TRUE,
    boxSelectionEnabled = TRUE,
    selectionType = 'single',
    autolock = FALSE,
    autoungrabify = FALSE,
    autounselectify = FALSE
  ))
})

test_that('buildRoptions default check',{
  expect_equal(buildROptions(),list(
    headless = FALSE,
    styleEnabled = TRUE,
    hideEdgesOnViewport = FALSE,
    textureOnViewport = FALSE,
    motionBlur = FALSE,
    motionBlurOpacity = 0.2,
    wheelSensitivity = 1,
    pixelRatio = 'auto'
  ))
})

test_that('buildRoptions format check',{
  expect_error(buildROptions(headless = 'headless'))
  expect_error(buildROptions(motionBlurOpacity = 2))
  expect_error(buildROptions(wheelSensitivity = 'wheelsensitivity'))
})

test_that('buildNode format check',{
  # too long

  # id
  expect_error(buildNode())
  expect_error(buildNode(TRUE))

  # shape
  expect_error(buildNode('abc', shape = 'myshape'))

})

test_that('buildEdge format check',{
  expect_error(buildEdge()) # source, target
  expect_error(buildEdge('S','T', lineStyle = 'myLine')) # linestyle
  expect_error(buildEdge('S','T', curveStyle = 'myCurve')) # linestyle
  expect_error(buildEdge('S','T',opacity = 2)) # opacity
})

test_that('buildNode default check', {
  # too long, just check member and length is fine
  testNode = buildNode('testID')
  expect_equal(typeof(testNode), 'list')
  expect_equal(length(testNode), 2) # consist with group, data
  expect_equal(testNode$group, 'nodes')
  expect_equal(length(testNode$data), 59) # data with 59 attributes
})

