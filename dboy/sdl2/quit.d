module sdl2.quit;
import sdl2.stdinc;
import sdl2.error;
import sdl2.events;

extern (C) pragma (inline, true) nothrow:
bool SDL_QuitRequested () {
    SDL_PumpEvents ();
    return SDL_PeepEvents (cast (SDL_Event *) null, 0,
                           cast (uint) SDL_eventaction.SDL_PEEKEVENT,
                           cast (uint) SDL_EventType.SDL_QUIT,
                           cast (uint) SDL_EventType.SDL_QUIT) > 0;
}