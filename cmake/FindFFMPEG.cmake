include(FindPackageHandleStandardArgs)

if (NOT FFMPEG_FOUND)
	# avcodec
	find_file(
		FFMPEG_AVCODEC_LIBRARY
		libavcodec.dll.a
		PATH_SUFFIXES
		lib
	)

	find_path(
		FFMPEG_AVCODEC_INCLUDE_DIR
		libavcodec/avcodec.h
		PATH_SUFFIXES
		include
	)

	find_file(
		FFMPEG_AVCODEC_DLL
		avcodec-58.dll
		PATH_SUFFIXES
		bin
	)

	add_library(FFMPEG::AVCodec SHARED IMPORTED)

	set_target_properties(
		FFMPEG::AVCodec
		PROPERTIES
		IMPORTED_LOCATION
		"${FFMPEG_AVCODEC_DLL}"
		IMPORTED_IMPLIB
		"${FFMPEG_AVCODEC_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${FFMPEG_AVCODEC_INCLUDE_DIR}"
	)

	# avformat
	find_file(
		FFMPEG_AVFORMAT_LIBRARY
		libavformat.dll.a
		PATH_SUFFIXES
		lib
	)

	find_path(
		FFMPEG_AVFORMAT_INCLUDE_DIR
		libavformat/avformat.h
		PATH_SUFFIXES
		include
	)

	find_file(
		FFMPEG_AVFORMAT_DLL
		avformat-58.dll
		PATH_SUFFIXES
		bin
	)

	add_library(FFMPEG::AVFormat SHARED IMPORTED)

	set_target_properties(
		FFMPEG::AVFormat
		PROPERTIES
		IMPORTED_LOCATION
		"${FFMPEG_AVFORMAT_DLL}"
		IMPORTED_IMPLIB
		"${FFMPEG_AVFORMAT_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${FFMPEG_AVFORMAT_INCLUDE_DIR}"
	)

	# avutil
	find_file(
		FFMPEG_AVUTIL_LIBRARY
		libavutil.dll.a
		PATH_SUFFIXES
		lib
	)

	find_path(
		FFMPEG_AVUTIL_INCLUDE_DIR
		libavutil/avutil.h
		PATH_SUFFIXES
		include
	)

	find_file(
		FFMPEG_AVUTIL_DLL
		avutil-56.dll
		PATH_SUFFIXES
		bin
	)

	add_library(FFMPEG::AVUtil SHARED IMPORTED)

	set_target_properties(
		FFMPEG::AVUtil
		PROPERTIES
		IMPORTED_LOCATION
		"${FFMPEG_AVUTIL_DLL}"
		IMPORTED_IMPLIB
		"${FFMPEG_AVUTIL_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${FFMPEG_AVUTIL_INCLUDE_DIR}"
	)

	# swscale
	find_file(
		FFMPEG_SWSCALE_LIBRARY
		libswscale.dll.a
		PATH_SUFFIXES
		lib
	)

	find_path(
		FFMPEG_SWSCALE_INCLUDE_DIR
		libswscale/swscale.h
		PATH_SUFFIXES
		include
	)

	find_file(
		FFMPEG_SWSCALE_DLL
		swscale-5.dll
		PATH_SUFFIXES
		bin
	)

	add_library(FFMPEG::SWScale SHARED IMPORTED)

	set_target_properties(
		FFMPEG::SWScale
		PROPERTIES
		IMPORTED_LOCATION
		"${FFMPEG_SWSCALE_DLL}"
		IMPORTED_IMPLIB
		"${FFMPEG_SWSCALE_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${FFMPEG_SWSCALE_INCLUDE_DIR}"
	)

	find_package_handle_standard_args(FFMPEG DEFAULT_MSG FFMPEG_AVCODEC_LIBRARY FFMPEG_AVFORMAT_LIBRARY FFMPEG_AVUTIL_LIBRARY FFMPEG_SWSCALE_LIBRARY)
endif()
