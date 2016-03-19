module sdl2.error;
import sdl2.stdinc;
extern (C):

/// SDL Error Code
enum SDL_errorcode {
    SDL_ENOMEM,
    SDL_EFREAD,
    SDL_EFWRITE,
    SDL_EFSEEK,
    SDL_UNSUPPORTED,
    SDL_LASTERROR,
}

pragma (inline, true) nothrow {
    
    int SDL_OutOfMemory () {
        return SDL_Error (SDL_errorcode.SDL_ENOMEM);
    }

    int SDL_Unsupported () {
        return SDL_Error (SDL_errorcode.SDL_UNSUPPORTED);
    }

    int SDL_InvalidParamError (char *param) {
        return SDL_SetError ("Parameter '%s' is invalid", param);
    }
}

nothrow:
int SDL_SetError (const char *fmt, ...);
immutable (char *) SDL_GetError ();
void SDL_ClearError ();
int SDL_Error (SDL_errorcode code);