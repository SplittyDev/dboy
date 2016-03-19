module gameboy.window;
import sdl2.sdl;
import sdl2.extra;

class Window {

    SDL_Window window;

    this (string title) {
        SDL_Init (SDL_INIT_EVERYTHING);
        window = DSDL_CreateWindow (title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, 0);
    }
}