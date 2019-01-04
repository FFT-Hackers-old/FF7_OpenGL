cmake_minimum_required(VERSION 3.12)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
option(SUPERBUILD "Build the project using a superbuild" ON)

if (SUPERBUILD)
	project(SUPERBUILD NONE)
	set_directory_properties(PROPERTIES EP_BASE "${CMAKE_BINARY_DIR}/ep")
	add_subdirectory(third_party)
	include(ExternalProject)
	ExternalProject_Add(
		ff7_opengl
		SOURCE_DIR	"${CMAKE_SOURCE_DIR}"
		CMAKE_ARGS
			"-DSUPERBUILD=OFF"
			"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
			"-DCMAKE_PREFIX_PATH=${CMAKE_BINARY_DIR}/vendor"
			"-DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}"
		DEPENDS
		glew
		zlib
		libpng
	)
	ExternalProject_Add_Step(
		ff7_opengl
		reconfigure
		COMMAND ${CMAKE_COMMAND} -E echo "Forcing a superbuild reconfigure"
		DEPENDEES download
		DEPENDERS configure
		ALWAYS ON
	)
	return()
endif()

project(FF7_OpenGL)
add_subdirectory(src)
