target_sources(ff7_opengl
    PRIVATE
		${CMAKE_CURRENT_LIST_DIR}/deferred.c
		${CMAKE_CURRENT_LIST_DIR}/gl.c
		${CMAKE_CURRENT_LIST_DIR}/shader.c
		${CMAKE_CURRENT_LIST_DIR}/special_case.c
		${CMAKE_CURRENT_LIST_DIR}/texture.c
) 
