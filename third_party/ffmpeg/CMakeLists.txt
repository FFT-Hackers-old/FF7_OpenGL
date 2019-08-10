include(ExternalProject)

ExternalProject_Add(
    ffmpeg
    URL                 "${CMAKE_SOURCE_DIR}/third_party/ffmpeg/ffmpeg-4.2-bin-win32.zip"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CONFIGURE_COMMAND	""
	BUILD_COMMAND		""
	INSTALL_COMMAND		"${CMAKE_COMMAND}" -E copy_directory "<SOURCE_DIR>" "<INSTALL_DIR>"
)
