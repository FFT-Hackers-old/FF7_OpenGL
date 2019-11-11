include(FindPackageHandleStandardArgs)

find_package(OpenGL REQUIRED)

if(NOT GLEW_FOUND)
	find_library(
		GLEW_LIBRARY
		glew glew32 glew32s
		PATH_SUFFIXES
		lib
	)

	find_path(
		GLEW_INCLUDE_DIR
		GL/glew.h
		PATH_SUFFIXES
		include
	)

	add_library(GLEW::GLEW STATIC IMPORTED)

	set_target_properties(
		GLEW::GLEW
		PROPERTIES
		IMPORTED_LOCATION
		"${GLEW_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${GLEW_INCLUDE_DIR}"
		INTERFACE_COMPILE_DEFINITIONS
		GLEW_STATIC=1
		INTERFACE_LINK_LIBRARIES
		"OpenGL::GL"
	)

	find_package_handle_standard_args(GLEW DEFAULT_MSG GLEW_LIBRARY GLEW_INCLUDE_DIR)
endif()