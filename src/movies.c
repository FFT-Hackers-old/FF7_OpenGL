/* 
 * ff7_opengl - Complete OpenGL replacement of the Direct3D renderer used in 
 * the original ports of Final Fantasy VII and Final Fantasy VIII for the PC.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * movies.c - replacements routines for FMV player
 */

#include <windows.h>
#include <stdio.h>

#include "types.h"
#include "gl.h"
#include "movies.h"
#include "patch.h"
#include "globals.h"
#include "log.h"
#include "common.h"
#include "cfg.h"

HMODULE movie_lib;

struct movie_plugin *movies;

void movie_init()
{
	replace_function(common_externals.prepare_movie, ff7_prepare_movie);
	replace_function(common_externals.release_movie_objects, ff7_release_movie_objects);
	replace_function(common_externals.start_movie, ff7_start_movie);
	replace_function(common_externals.update_movie_sample, ff7_update_movie_sample);
	replace_function(common_externals.stop_movie, ff7_stop_movie);
	replace_function(common_externals.get_movie_frame, ff7_get_movie_frame);

	movie_lib = LoadLibraryA(movie_plugin);

	movies = driver_calloc(1, sizeof(*movies));

	movies->movie_init = (void *)GetProcAddress(movie_lib, "movie_init");
	movies->prepare_movie = (void *)GetProcAddress(movie_lib, "prepare_movie");
	movies->release_movie_objects = (void *)GetProcAddress(movie_lib, "release_movie_objects");
	movies->update_movie_sample = (void *)GetProcAddress(movie_lib, "update_movie_sample");
	movies->loop = (void *)GetProcAddress(movie_lib, "loop");
	movies->stop_movie = (void *)GetProcAddress(movie_lib, "stop_movie");
	movies->get_movie_frame = (void *)GetProcAddress(movie_lib, "get_movie_frame");

	if(!(movies->movie_init && 
		movies->prepare_movie && 
		movies->release_movie_objects && 
		movies->update_movie_sample && 
		movies->loop && 
		movies->stop_movie &&
		movies->get_movie_frame))
	{
		MessageBoxA(hwnd, "Error loading movie plugin, cannot continue.", "Error", 0);
		error("could not load movie plugin: %s\n", movie_plugin);
		exit(1);
	}

	movies->movie_init(plugin_trace, plugin_info, plugin_glitch, plugin_error, gl_draw_movie_quad_bgra, gl_draw_movie_quad_yuv, common_externals.directsound, skip_frames, movie_sync_debug);
}

bool ff7_prepare_movie(char *name, uint loop, struct dddevice **dddevice, uint dd2interface)
{
	if(trace_all || trace_movies) trace("prepare_movie %s\n", name);

	ff7_externals.movie_object->loop = loop;
	ff7_externals.movie_sub_415231(name);

	ff7_externals.movie_object->field_1F8 = 1;
	ff7_externals.movie_object->is_playing = 0;
	ff7_externals.movie_object->movie_end = 0;
	ff7_externals.movie_object->global_movie_flag = 0;
	ff7_externals.movie_object->field_E0 = !((struct ff7_game_obj *)common_externals.get_game_object())->field_968;

	movies->prepare_movie(name);

	ff7_externals.movie_object->global_movie_flag = 1;

	return true;
}

void ff7_release_movie_objects()
{
	if(trace_all || trace_movies) trace("release_movie_objects\n");

	ff7_stop_movie();

	movies->release_movie_objects();

	ff7_externals.movie_object->global_movie_flag = 0;
}

bool ff7_start_movie()
{
	if(trace_all || trace_movies) trace("start_movie\n");

	if(ff7_externals.movie_object->is_playing) return true;

	ff7_externals.movie_object->is_playing = 1;

	return ff7_update_movie_sample(0);
}

bool ff7_stop_movie()
{
	if(trace_all || trace_movies) trace("stop_movie\n");

	if(ff7_externals.movie_object->is_playing)
	{
		ff7_externals.movie_object->is_playing = 0;
		ff7_externals.movie_object->movie_end = 0;

		movies->stop_movie();
	}

	return true;
}

bool ff7_update_movie_sample(LPDIRECTDRAWSURFACE surface)
{
	bool movie_end;

	ff7_externals.movie_object->movie_end = 0;

	if(!ff7_externals.movie_object->is_playing) return false;

retry:
	movie_end = !movies->update_movie_sample();

	if(movie_end)
	{
		if(trace_all || trace_movies) trace("movie end\n");
		if(ff7_externals.movie_object->loop)
		{
			movies->loop();
			goto retry;
		}

		ff7_externals.movie_object->movie_end = 1;
		return true;
	}

	return true;
}

void draw_current_frame()
{
	movies->draw_current_frame();
}

uint ff7_get_movie_frame()
{
	if(!ff7_externals.movie_object->is_playing) return 0;

	return movies->get_movie_frame();
}
