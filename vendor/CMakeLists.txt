project(glew32)

include(ExternalProject)

ExternalProject_Add(
    glew32
    PREFIX ${CMAKE_BINARY_DIR}/vendor
    GIT_REPOSITORY git@github.com:nigels-com/glew.git
    TIMEOUT 30
    UPDATE_COMMAND ${GIT_EXECUTABLE} pull
    CONFIGURE_COMMAND ""
    BUILD_COMMAND make
    INSTALL_COMMAND ""
)

add_library(glew STATIC IMPORTED)
set_property(TARGET glew
	PROPERTY IMPORTED_LOCATION ${CMAKE_BINARY_DIR}/vendor
)
add_dependencies (glew glew32)

target_include_directories (glew INTERFACE include)