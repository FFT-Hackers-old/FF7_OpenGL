include(ExternalProject)

ExternalProject_Add(
    vgmstream
    URL             "${CMAKE_SOURCE_DIR}/third_party/vgmstream/vgmstream-win32.zip"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CONFIGURE_COMMAND	""
	BUILD_COMMAND		""
	INSTALL_COMMAND		"${CMAKE_COMMAND}" -E copy_directory "<SOURCE_DIR>" "<INSTALL_DIR>"
)
