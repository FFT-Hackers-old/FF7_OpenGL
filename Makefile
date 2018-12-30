objects =\
cfg.obj\
common.obj\
crashdump.obj\
ctx.obj\
fake_dd.obj\
ff7_opengl.obj\
ff8_opengl.obj\
log.obj\
matrix.obj\
movies.obj\
music.obj\
patch.obj\
png.obj\
saveload.obj\
3rdparty\confuse.obj\
3rdparty\lexer.obj\
ff7\battle.obj\
ff7\field.obj\
ff7\file.obj\
ff7\graphics.obj\
ff7\loaders.obj\
ff7\misc.obj\
gl\deferred.obj\
gl\gl.obj\
gl\shader.obj\
gl\special_case.obj\
gl\texture.obj

CFLAGS = /O1 /DYY_NO_UNISTD_H /DGLEW_STATIC
CFLAGS_DEBUG = /Zi
LDFLAGS = /DLL
LDFLAGS_DEBUG = /debug
LDLIBS = kernel32.lib user32.lib Advapi32.lib gdi32.lib glew32s.lib\
         opengl32.lib libpng16.lib zlib.lib

!IFDEF DEBUG
CFLAGS = $(CFLAGS) $(CFLAGS_DEBUG)
LDFLAGS = $(LDFLAGS) $(LDFLAGS_DEBUG)
!ENDIF 

ff7_opengl.fgd: $(objects)
	link /OUT:$@ $(LDFLAGS) $** $(LDLIBS)

{3rdparty/}.c{3rdparty/}.obj:
	cl $(CFLAGS) /c /Fo$@ $**

{ff7/}.c{ff7/}.obj:
	cl $(CFLAGS) /c /Fo$@ $**

{gl/}.c{gl/}.obj:
	cl $(CFLAGS) /c /Fo$@ $**

clean:
	del *.fgd *.fgp *.lib *.exp $(objects) *.pdb
