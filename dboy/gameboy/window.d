module gameboy.window;
import sdl2.sdl;
import sdl2.extra;

class Window {

    SDL_Window *window;
    SDL_Renderer *renderer;
    bool closeRequested;

    this (string title) {
        SDL_Init (SDL_INIT_EVERYTHING);
        window = DSDL_CreateWindow (title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, 0);
        renderer = SDL_CreateRenderer (window, -1, 0);
    }

    void SetSize (int width, int height) {
        SDL_RenderSetLogicalSize (renderer, width, height);
    }

    void Update (void function () callback) {
        SDL_Event e;
        while (SDL_PollEvent (&e)) {
            if (e.type == SDL_EventType.SDL_QUIT)
                closeRequested = true;
        }
        callback ();
    }
}