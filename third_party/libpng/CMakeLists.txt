include(ExternalProject)

ExternalProject_Add(
    libpng
    URL                 "${CMAKE_SOURCE_DIR}/third_party/libpng/libpng-1.6.37.tar.gz"
    URL_HASH            "SHA256=daeb2620d829575513e35fecc83f0d3791a620b9b93d800b763542ece9390fb4"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
		"-DCMAKE_PREFIX_PATH=<INSTALL_DIR>"
		"-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
	DEPENDS
	zlib
)
