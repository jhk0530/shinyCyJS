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
