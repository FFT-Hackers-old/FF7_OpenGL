include(FindPackageHandleStandardArgs)

add_library(GLEW::GLEW STATIC IMPORTED)
set(GLEW_LIBRARY "${GLEW_DIR}/lib/glew.lib")
set(GLEW_INCLUDE_DIR "${GLEW_DIR}/include")

set_target_properties(
    GLEW::GLEW
    PROPERTIES
    IMPORTED_LOCATION
    "${GLEW_LIBRARY}"
    INTERFACE_INCLUDE_DIRECTORIES
    "${GLEW_INCLUDE_DIR}"
    INTERFACE_COMPILE_DEFINITIONS
    "-DGLEW_STATIC=1"
)

add_dependencies(GLEW::GLEW glew_ep)

find_package_handle_standard_args(GLEW DEFAULT_MSG GLEW_LIBRARY GLEW_INCLUDE_DIR)
