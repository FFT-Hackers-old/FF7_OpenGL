include(ExternalProject)

ExternalProject_Add(
    libconfuse
    URL                 "https://github.com/FFT-Hackers/libconfuse/releases/download/v3.2.3/confuse-3.2.3.0.zip"
    URL_HASH			"SHA256=d2b070a1dd8a62eabe3fb84410ac2091dddda6b74853d0e156ad8943ee1e05fd"
	INSTALL_DIR			"${CMAKE_BINARY_DIR}/vendor"
	PATCH_COMMAND		"${CMAKE_COMMAND}" -E copy "${CMAKE_SOURCE_DIR}/third_party/libconfuse/CMakeLists.txt.in" "<SOURCE_DIR>/CMakeLists.txt"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
		"-DCMAKE_PREFIX_PATH=<INSTALL_DIR>"
		"-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
		"-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}"
		"-DCMAKE_MSVC_RUNTIME_LIBRARY=${CMAKE_MSVC_RUNTIME_LIBRARY}"
		"-DCMAKE_SHARED_LINKER_FLAGS=${CMAKE_SHARED_LINKER_FLAGS}"
)
