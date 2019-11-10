include(ExternalProject)

ExternalProject_Add(
	x264
	URL                 "https://github.com/FFT-Hackers/x264-msvc-build/releases/download/20190306.0.0/x264-20190306.0.0-d4099dd-v142-static-mt-release-x86.zip"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CONFIGURE_COMMAND	""
	BUILD_COMMAND		""
	INSTALL_COMMAND		"${CMAKE_COMMAND}" -E copy_directory "<SOURCE_DIR>" "<INSTALL_DIR>"
)
