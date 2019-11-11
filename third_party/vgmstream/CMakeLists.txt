include(ExternalProject)

ExternalProject_Add(
	vgmstream
	URL				"https://github.com/FFT-Hackers/vgmstream/archive/feature/FF7_OpenGL.zip"
	INSTALL_DIR		"${CMAKE_BINARY_DIR}/vendor"
	PATCH_COMMAND   "${CMAKE_COMMAND}" -E copy "${CMAKE_SOURCE_DIR}/third_party/vgmstream/CMakeLists.txt.in" "<SOURCE_DIR>/CMakeLists.txt"
	CMAKE_ARGS
		"-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
		"-DCMAKE_PREFIX_PATH=<INSTALL_DIR>"
		"-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
		"-DUSE_FFMPEG=ON"
		"-DUSE_FDKAAC=OFF"
		"-DUSE_MPEG=OFF"
		"-DUSE_VORBIS=OFF"
		"-DUSE_MAIATRAC3PLUS=OFF"
		"-DUSE_G7221=OFF"
		"-DUSE_G719=OFF"
		"-DUSE_ATRAC9=OFF"
		"-DUSE_CELT=OFF"
		"-DBUILD_CLI=OFF"
		"-DBUILD_FB2K=OFF"
		"-DBUILD_WINAMP=OFF"
		"-DBUILD_XMPLAY=OFF"
		"-DBUILD_AUDACIOUS=OFF"
	DEPENDS
	ffmpeg
)
