module sdl2.extra;
import sdl2.video;
import std.string;

/// D friendly SDL_CreateWindow wrapper
SDL_Window *DSDL_CreateWindow (string filename, int x, int y, int width, int height, uint flags) {
    return SDL_CreateWindow (toStringz (filename), x, y, width, height, flags);
}

/// D friendly SDL_SetWindowTitle wrapper
void DSDL_SetWindowTitle (SDL_Window *window, string title) {
    SDL_SetWindowTitle (window, toStringz (title));
}