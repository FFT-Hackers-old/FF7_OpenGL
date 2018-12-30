include(ExternalProject)

ExternalProject_Add(
    glew_ep
    URL                 "${CMAKE_SOURCE_DIR}/vendor/glew/glew-2.1.0.tar.gz"
    URL_HASH            "SHA256=04DE91E7E6763039BC11940095CD9C7F880BABA82196A7765F727AC05A993C95"
    PATCH_COMMAND       "${CMAKE_COMMAND}" -E copy "${CMAKE_SOURCE_DIR}/vendor/glew/CMakeLists.txt.in" "${CMAKE_BINARY_DIR}/ep/Source/glew_ep/CMakeLists.txt"
	CMAKE_ARGS			"-DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/ep/Install/glew_ep"
)
