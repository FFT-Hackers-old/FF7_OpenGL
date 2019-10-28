include(ExternalProject)

ExternalProject_Add(
    zlib
    URL                 "https://github.com/madler/zlib/archive/v1.2.11.tar.gz"
    URL_HASH            "SHA256=629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
		"-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
)
