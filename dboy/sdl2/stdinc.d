module sdl2.stdinc;
extern (C) nothrow:

pragma (inline, true) {

    /// SDL boolean
    enum SDL_bool {

        /// SDL false boolean
        SDL_FALSE   = 0,

        /// SDL true boolean
        SDL_TRUE    = 1,
    }
}