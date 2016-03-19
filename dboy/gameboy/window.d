module gameboy.window;
import sdl2.sdl;
import sdl2.extra;

alias UpdateCallback = void function ();
alias RenderCallback = void function (SDL_Renderer *);

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

    void SetTitle (string title) {
         DSDL_SetWindowTitle (window, title);
    }

    void Run (UpdateCallback updateCallback, RenderCallback renderCallback) {
        while (!closeRequested) {
            Update (updateCallback);
            Render (renderCallback);
        }
    }

    void Update (UpdateCallback callback) {
        SDL_Event e;
        while (SDL_PollEvent (&e)) {
            if (e.type == SDL_EventType.SDL_QUIT)
                closeRequested = true;
        }
        callback ();
    }

    void Render (RenderCallback callback) {
        Clear ();
        callback (renderer);
        Present ();
    }

    ~this () {
        SDL_DestroyRenderer (renderer);
        SDL_DestroyWindow (window);
        SDL_Quit ();
    }

    pragma (inline, true) private:
    void Clear () {
        SDL_RenderClear (renderer);
    }

    void Present () {
        SDL_RenderPresent (renderer);
    }
}