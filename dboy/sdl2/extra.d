module sdl2.extra;
import sdl2.video;
import std.string;

SDL_Window *DSDL_CreateWindow (string filename, int x, int y, int width, int height, uint flags) {
    return SDL_CreateWindow (toStringz (filename), x, y, width, height, flags);
}