include(ExternalProject)

ExternalProject_Add(
	ffmpeg
	URL                 "https://github.com/FFT-Hackers/ffmpeg-msvc-build/releases/download/4.2.1/ffmpeg-4.2.1-1529dfb7-gpl3-v142-static-mt-release-x86.zip"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CONFIGURE_COMMAND	""
	BUILD_COMMAND		""
	INSTALL_COMMAND		"${CMAKE_COMMAND}" -E copy_directory "<SOURCE_DIR>" "<INSTALL_DIR>"
	DEPENDS
	x264
)
