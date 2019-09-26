file(GLOB vgmstream_music_source_files "*.h" "*.c")

target_sources(vgmstream_music PRIVATE ${vgmstream_music_source_files})
