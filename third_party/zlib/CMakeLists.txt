include(ExternalProject)

ExternalProject_Add(
    zlib
    URL                 "https://download.sourceforge.net/libpng/zlib-1.2.11.tar.gz"
    URL_HASH            "SHA256=c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
		"-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
		"-DCMAKE_SH=CMAKE_SH-NOTFOUND"
)
