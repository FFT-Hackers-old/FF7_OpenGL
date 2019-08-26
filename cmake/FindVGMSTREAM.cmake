include(FindPackageHandleStandardArgs)

if (NOT VGMSTREAM_FOUND)
	find_package(FFMPEG REQUIRED)

	find_library(
		VGMSTREAM_LIBRARY
		vgmstream
		PATH_SUFFIXES
		lib
	)

	find_path(
		VGMSTREAM_INCLUDE_DIR
		vgmstream.h
		PATH_SUFFIXES
		include/libvgmstream
	)

	add_library(VGMSTREAM::VGMSTREAM STATIC IMPORTED)

	set_target_properties(
		VGMSTREAM::VGMSTREAM
		PROPERTIES
		IMPORTED_LOCATION
		"${VGMSTREAM_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${VGMSTREAM_INCLUDE_DIR}"
		INTERFACE_LINK_LIBRARIES
      FFMPEG::SWResample
	    FFMPEG::AVCodec
	    FFMPEG::AVFormat
	)

	find_package_handle_standard_args(VGMSTREAM DEFAULT_MSG VGMSTREAM_LIBRARY VGMSTREAM_INCLUDE_DIR)
endif()