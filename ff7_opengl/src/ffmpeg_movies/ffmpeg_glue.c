#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <windows.h>
#include <float.h>
#include <fcntl.h>
#include <io.h>

// this glue is necessary to make FFMpeg work with MSVCRT

int strncasecmp(const char *a, const char *b, size_t n) { return _strnicmp(a, b, n); }
int strcasecmp(const char *a, const char *b) { return _stricmp(a, b); }
int usleep(int t) { Sleep(t / 1000); return 0; }

// ffmpeg needs these symbols, but they're not really used
void gettimeofday() {}

int *__errno()
{
	return _errno();
}

int __fpclassifyd(double a)
{
	if(_isnan(a)) return FP_NAN;
	if(!_finite(a)) return FP_INFINITE;
	if(a == 0.0) return FP_ZERO;

	return FP_NORMAL;
}

static float CBRT2 = 1.25992104989487316477f;
static float CBRT4 = 1.58740105196819947475f;

int ffmpeg_open(char *name, int access, int mode)
{
	access &= 0xFFF;

	access |= O_BINARY;

	return _open(name, access);
}

int ffmpeg_lseek(int fd, int pos, int whence)
{
	return _lseek(fd, pos, whence);
}
