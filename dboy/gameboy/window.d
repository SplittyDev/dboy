module gameboy.window;
import sdl2.sdl;
import sdl2.extra;

alias UpdateCallback = void function ();
alias RenderCallback = void function (SDL_Renderer *);

class Window {

    /// The window
    SDL_Window *window;

    /// The renderer
    SDL_Renderer *renderer;

    /// Constructor
    this (string title) {
        SDL_Init (SDL_INIT_EVERYTHING);
        window = DSDL_CreateWindow (title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, 0);
        renderer = SDL_CreateRenderer (window, -1, 0);
    }

    /// Destructor
    ~this () {
        SDL_DestroyRenderer (renderer);
        SDL_DestroyWindow (window);
        SDL_Quit ();
    }

    /// Set the window size
    void SetSize (int width, int height) {
        SDL_RenderSetLogicalSize (renderer, width, height);
    }

    /// Set the window title
    void SetTitle (string title) {
         DSDL_SetWindowTitle (window, title);
    }

    /// Run the window
    void Run (UpdateCallback updateCallback, RenderCallback renderCallback) {
        while (!closeRequested) {
            Update (updateCallback);
            Render (renderCallback);
        }
    }

    private:
    bool closeRequested;

    /// Update the scene
    void Update (UpdateCallback callback) {
        SDL_Event e;
        while (SDL_PollEvent (&e)) {
            if (e.type == SDL_EventType.SDL_QUIT)
                closeRequested = true;
        }
        callback ();
    }

    /// Render the scene
    void Render (RenderCallback callback) {
        Clear ();
        callback (renderer);
        Present ();
    }

    // Small helper functions
    // Inlined for performance
    pragma (inline, true) {

        /// Clear the screen
        void Clear () {
            SDL_RenderClear (renderer);
        }

        /// Present the scene
        void Present () {
            SDL_RenderPresent (renderer);
        }
    }
}