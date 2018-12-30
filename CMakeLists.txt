cmake_minimum_required(VERSION 3.12)
project(FF7_OpenGL_SuperBuild)

include(ExternalProject)
set_directory_properties(PROPERTIES EP_BASE "${CMAKE_BINARY_DIR}/ep")

add_subdirectory(vendor)

ExternalProject_Add(
	ff7_opengl_ep
	SOURCE_DIR	"${CMAKE_SOURCE_DIR}/ff7_opengl"
	CMAKE_ARGS
	"-DGLEW_DIR=${CMAKE_BINARY_DIR}/ep/Install/glew_ep"
	"-DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}"
	DEPENDS
	glew_ep
)
