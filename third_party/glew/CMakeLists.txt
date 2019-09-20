include(ExternalProject)

ExternalProject_Add(
    glew
    URL                 "https://download.sourceforge.net/glew/2.1.0/glew-2.1.0.tgz"
    URL_HASH            "SHA256=04DE91E7E6763039BC11940095CD9C7F880BABA82196A7765F727AC05A993C95"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
    PATCH_COMMAND       "${CMAKE_COMMAND}" -E copy "${CMAKE_SOURCE_DIR}/third_party/glew/CMakeLists.txt.in" "<SOURCE_DIR>/CMakeLists.txt"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
        "-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
        "-DCMAKE_SH=CMAKE_SH-NOTFOUND"
)
