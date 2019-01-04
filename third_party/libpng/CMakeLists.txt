include(ExternalProject)

ExternalProject_Add(
    libpng
    URL                 "${CMAKE_SOURCE_DIR}/third_party/libpng/libpng-1.6.36.tar.gz"
    URL_HASH            "SHA256=ca13c548bde5fb6ff7117cc0bdab38808acb699c0eccb613f0e4697826e1fd7d"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
		"-DCMAKE_PREFIX_PATH=<INSTALL_DIR>"
		"-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
	DEPENDS
	zlib
)
