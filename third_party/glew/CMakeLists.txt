include(ExternalProject)

ExternalProject_Add(
    glew
    URL                 "https://github.com/Perlmint/glew-cmake/archive/master.zip"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
        "-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
		"-Dglew-cmake_BUILD_SHARED=0"
		"-Dglew-cmake_BUILD_MULTI_CONTEXT=0"
		"-DONLY_LIBS=1"
)
