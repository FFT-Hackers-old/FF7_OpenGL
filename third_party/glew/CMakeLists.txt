include(ExternalProject)

ExternalProject_Add(
    glew
    URL                 "https://github.com/nigels-com/glew/releases/download/glew-2.1.0/glew-2.1.0.tgz"
    URL_HASH            "SHA256=04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
    PATCH_COMMAND       "${CMAKE_COMMAND}" -E copy "${CMAKE_SOURCE_DIR}/third_party/glew/CMakeLists.txt.in" "<SOURCE_DIR>/CMakeLists.txt"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
		"-DCMAKE_PREFIX_PATH=<INSTALL_DIR>"
        "-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
)