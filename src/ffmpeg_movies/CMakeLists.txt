file(GLOB ffmpeg_movies_source_files "*.h" "*.c")

target_sources(ffmpeg_movies PRIVATE ${ffmpeg_movies_source_files})
