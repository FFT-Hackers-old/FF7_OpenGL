find_package(GLEW REQUIRED)
find_package(ZLib REQUIRED)
find_package(PNG REQUIRED)

add_library(ff7_opengl SHARED cfg.h cfg.c common.h common.c common_imports.h compile_cfg.h
	crashdump.c crashdump.h ctx.h ctx.c externals_102_de.h externals_102_fr.h externals_102_sp.h externals_102_us.h
	fake_dd.h fake_dd.c ff7.h ff7_data.h ff7_opengl.c ff8.h ff8_data.h ff8_opengl.c gl.h globals.h "log.c" "log.h"
	"macro.h" matrix.c matrix.h movies.c movies.h music.c music.h patch.c patch.h pngcustom.c pngcustom.h saveload.c saveload.h types.h
)
add_subdirectory(3rdparty)
add_subdirectory(ff7)
add_subdirectory(gl)

target_include_directories(ff7_opengl PRIVATE "${CMAKE_SOURCE_DIR}/src")
target_link_libraries(ff7_opengl GLEW::GLEW ZLib::ZLib PNG::PNG)
target_compile_definitions(ff7_opengl PRIVATE -D_CRT_SECURE_NO_WARNINGS=1 -DUNICODE=1 -D_UNICODE=1)
install(TARGETS ff7_opengl RUNTIME DESTINATION bin)
