find_package(GLEW REQUIRED)
find_package(ZLib REQUIRED)
find_package(PNG REQUIRED)
find_package(FFMPEG REQUIRED)
find_package(VGMSTREAM REQUIRED)

string(TOUPPER ${CMAKE_BUILD_TYPE} RELEASE_TYPE)
add_compile_definitions(${RELEASE_TYPE})

file(GLOB source_files "*.h" "*.c")
add_library(ff7_opengl SHARED ${source_files})
add_subdirectory(3rdparty)
add_subdirectory(ff7)
add_subdirectory(gl)

target_include_directories(ff7_opengl PRIVATE "${CMAKE_SOURCE_DIR}/src")
target_link_libraries(ff7_opengl GLEW::GLEW ZLib::ZLib PNG::PNG)
target_compile_definitions(ff7_opengl PRIVATE -D_CRT_SECURE_NO_WARNINGS=1)
install(TARGETS ff7_opengl RUNTIME DESTINATION bin)

add_library(ffmpeg_movies SHARED)
target_include_directories(ffmpeg_movies PRIVATE "${CMAKE_BINARY_DIR}/vendor/include")
add_subdirectory(ffmpeg_movies)
target_link_libraries(ffmpeg_movies
	GLEW::GLEW
	FFMPEG::AVUtil
	FFMPEG::SWResample
	FFMPEG::AVCodec
	FFMPEG::AVFormat
	FFMPEG::SWScale
)
target_compile_definitions(ffmpeg_movies PRIVATE -D_CRT_SECURE_NO_WARNINGS=1)

add_library(vgmstream_music SHARED)
target_include_directories(vgmstream_music PRIVATE "${CMAKE_BINARY_DIR}/vendor/include")
add_subdirectory(vgmstream_music)
target_link_libraries(vgmstream_music
    VGMSTREAM::VGMSTREAM
	FFMPEG::AVUtil
	FFMPEG::SWResample
	FFMPEG::AVCodec
	FFMPEG::AVFormat
	FFMPEG::SWScale
)
target_compile_definitions(vgmstream_music PRIVATE -D_CRT_SECURE_NO_WARNINGS=1)

add_library(ff7music SHARED)
target_include_directories(ff7music PRIVATE "${CMAKE_BINARY_DIR}/vendor/include")
add_subdirectory(ff7music)
target_compile_definitions(ff7music PRIVATE -D_CRT_SECURE_NO_WARNINGS=1)

install(TARGETS ffmpeg_movies RUNTIME DESTINATION bin)
install(TARGETS vgmstream_music RUNTIME DESTINATION bin)
install(TARGETS ff7music RUNTIME DESTINATION bin)
install(FILES "${FFMPEG_AVUTIL_DLL}" "${FFMPEG_SWRESAMPLE_DLL}" "${FFMPEG_AVCODEC_DLL}" "${FFMPEG_AVFORMAT_DLL}" "${FFMPEG_SWSCALE_DLL}" DESTINATION bin)