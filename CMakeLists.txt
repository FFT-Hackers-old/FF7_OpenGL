cmake_minimum_required(VERSION 3.12)
project(FF7_OpenGL)

add_library(AaliGL SHARED cfg.h cfg.c common.h common.c common_imports.h compile_cfg.h
	crashdump.c crashdump.h ctx.h ctx.c externals_102_de.h externals_102_fr.h externals_102_sp.h externals_102_us.h
	fake_dd.h fake_dd.c ff7.h ff7_data.h ff7_opengl.c ff8.h ff8_data.h ff8_opengl.c gl.h globals.h log.c log.h
	macro.h matrix.c matrix.h movies.c movies.h music.c music.h patch.c patch.h png.c png.h saveload.c saveload.h types.h
)

add_subdirectory(vendor)
add_subdirectory(3rdparty)
add_subdirectory(gl)


add_dependencies(AaliGL, glew)

target_link_libraries(AaliGL
	kernel32.lib user32.lib Advapi32.lib gdi32.lib glew32s.lib
    opengl32.lib libpng16.lib zlib.lib, glew
)

