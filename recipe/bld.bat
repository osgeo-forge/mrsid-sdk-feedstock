
pushd Raster_DSDK

  :: Skip tbb.dll, as it conflicts with conda tbb pkg
  copy /y lib\lti_dsdk_9.5.dll "%LIBRARY_BIN%\" || exit 1
  copy /y lib\lti_dsdk_cdll_9.5.dll "%LIBRARY_BIN%\" || exit 1
  copy /y "lib\\*.lib" "%LIBRARY_LIB%\" || exit 1

  if not exist "%LIBRARY_INC%\mrsid" mkdir "%LIBRARY_INC%\mrsid"
  xcopy /s /y /i include "%LIBRARY_INC%\mrsid" || exit 1

  copy /y "bin\\*.exe" "%LIBRARY_BIN%\" || exit 1

popd

pushd Lidar_DSDK

  copy /y lib\lti_lidar_dsdk_1.1.dll "%LIBRARY_BIN%\" || exit 1
  copy /y lib\lti_lidar_dsdk.lib "%LIBRARY_LIB%\" || exit 1

  if not exist "%LIBRARY_INC%\lidar" mkdir "%LIBRARY_INC%\lidar"
  xcopy /s /y /i include\lidar "%LIBRARY_INC%\lidar" || exit 1

  :: TODO: figure out if pdal, laszip, laslib, gdal 2.4+ conda pkgs satisfy these .exes
  :: copy /y "bin\\*.exe" "%LIBRARY_BIN%\" || exit 1

popd