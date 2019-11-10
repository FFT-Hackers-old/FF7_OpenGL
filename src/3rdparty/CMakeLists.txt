file(GLOB 3rdparty_source_files "*.h" "*.c")

target_sources(ff7_opengl PRIVATE ${3rdparty_source_files})
