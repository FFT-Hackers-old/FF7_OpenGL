file(GLOB gl_source_files "*.h" "*.c")

target_sources(ff7_opengl PRIVATE ${gl_source_files})
