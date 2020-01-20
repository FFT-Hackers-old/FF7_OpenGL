find_package(GLEW REQUIRED)
find_package(ZLib REQUIRED)
find_package(PNG REQUIRED)
find_package(CONFUSE REQUIRED)
find_package(FFMPEG REQUIRED)
find_package(VGMSTREAM REQUIRED)

if(CMAKE_BUILD_TYPE STREQUAL "Debug" OR CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
	set(RELEASE_TYPE "DEBUG")
else()
	set(RELEASE_TYPE "RELEASE")
endif()

# Include all the source code files
file(GLOB source_files "*.h" "*.c")

add_library(ff7_opengl SHARED ${source_files})
add_subdirectory(ff7)
add_subdirectory(gl)

target_include_directories(ff7_opengl PRIVATE "${CMAKE_SOURCE_DIR}/src")
target_link_libraries(ff7_opengl
	dbghelp
	GLEW::GLEW
	PNG::PNG
	CONFUSE::CONFUSE
)
target_compile_options(ff7_opengl
	PRIVATE /D_CRT_SECURE_NO_WARNINGS
	PRIVATE /D${RELEASE_TYPE}
)
target_link_options(ff7_opengl PRIVATE /PDBALTPATH:ff7_opengl.pdb)
if(_DLL_VERSION)
	target_compile_options(ff7_opengl PRIVATE /DVERSION="${_DLL_VERSION}")
endif()
set_target_properties(ff7_opengl PROPERTIES PREFIX "")
set_target_properties(ff7_opengl PROPERTIES SUFFIX ".fgd")

add_library(ffmpeg_movies SHARED)
target_include_directories(ffmpeg_movies PRIVATE "${CMAKE_BINARY_DIR}/vendor/include")
add_subdirectory(ffmpeg_movies)
target_link_libraries(ffmpeg_movies
	dbghelp
	GLEW::GLEW
	FFMPEG::AVUtil
	FFMPEG::SWResample
	FFMPEG::AVCodec
	FFMPEG::AVFormat
	FFMPEG::SWScale
)
target_compile_options(ffmpeg_movies
	PRIVATE /D_CRT_SECURE_NO_WARNINGS
	PRIVATE /D${RELEASE_TYPE}
)
target_link_options(ffmpeg_movies PRIVATE /PDBALTPATH:ffmpeg_movies.pdb)
set_target_properties(ffmpeg_movies PROPERTIES PREFIX "")
set_target_properties(ffmpeg_movies PROPERTIES SUFFIX ".fgp")

add_library(vgmstream_music SHARED)
target_include_directories(vgmstream_music PRIVATE "${CMAKE_BINARY_DIR}/vendor/include")
add_subdirectory(vgmstream_music)
target_link_libraries(vgmstream_music
	VGMSTREAM::VGMSTREAM
)
target_compile_options(vgmstream_music
	PRIVATE /D_CRT_SECURE_NO_WARNINGS
	PRIVATE /D${RELEASE_TYPE}
)
target_link_options(vgmstream_music PRIVATE /PDBALTPATH:vgmstream_music.pdb)
set_target_properties(vgmstream_music PROPERTIES PREFIX "")
set_target_properties(vgmstream_music PROPERTIES SUFFIX ".fgp")

add_library(ff7music SHARED)
target_include_directories(ff7music PRIVATE "${CMAKE_BINARY_DIR}/vendor/include")
add_subdirectory(ff7music)
target_compile_options(ff7music
	PRIVATE /D_CRT_SECURE_NO_WARNINGS
	PRIVATE /D${RELEASE_TYPE}
)
target_link_options(ff7music PRIVATE /PDBALTPATH:ff7music.pdb)
set_target_properties(ff7music PROPERTIES PREFIX "")
set_target_properties(ff7music PROPERTIES SUFFIX ".fgp")

install(TARGETS ff7_opengl RUNTIME DESTINATION bin)
install(TARGETS ffmpeg_movies RUNTIME DESTINATION bin/plugins)
install(TARGETS vgmstream_music RUNTIME DESTINATION bin/plugins)
install(TARGETS ff7music RUNTIME DESTINATION bin/plugins)

if(CMAKE_BUILD_TYPE STREQUAL "Debug" OR CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
	install(FILES $<TARGET_PDB_FILE:ff7_opengl> DESTINATION bin OPTIONAL)
	install(FILES $<TARGET_PDB_FILE:ffmpeg_movies> DESTINATION bin/plugins OPTIONAL)
	install(FILES $<TARGET_PDB_FILE:vgmstream_music> DESTINATION bin/plugins OPTIONAL)
	install(FILES $<TARGET_PDB_FILE:ff7music> DESTINATION bin/plugins OPTIONAL)
endif()

install(FILES ../misc/ff7_opengl_${RELEASE_TYPE}.cfg DESTINATION bin OPTIONAL RENAME ff7_opengl.cfg)
install(FILES ../misc/ff7_opengl.reg DESTINATION bin OPTIONAL)
