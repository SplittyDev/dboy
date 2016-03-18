module sdl2.surface;
import sdl2.stdinc;
import sdl2.rwops;
import sdl2.rect;
import sdl2.blendmode;
import sdl2.pixels;
extern (C):

enum {
    SDL_SWSURFACE   = 0,
    SDL_PREALLOC    = 0x00000001,
    SDL_RLEACCEL    = 0x00000002,
    SDL_DONTFREE    = 0x00000004,
}

/// SDL Surface
struct SDL_Surface {
    private uint flags;
    SDL_PixelFormat *format;
    int w;
    int h;
    int pitch;
    void *pixels;
    void *userdata;
    private int locked;
    private void *lock_data;
    SDL_Rect clip_rect;
    private void *map; // SDL_BlitMap *
    int refcount;
}

pragma (inline, true) nothrow {

    // SDL_MUSTLOCK define
    SDL_bool SDL_MUSTLOCK (SDL_Surface surface) {
        return cast (SDL_bool) ((surface.flags & SDL_RLEACCEL) != 0);
    }
}

/// SDL blit function pointer
alias SDL_blit =
int function (SDL_Surface *src, SDL_Rect *srcrect,
              SDL_Surface *dst, SDL_Rect *dstrect);

/// SDL_UpperBlit alias
alias SDL_BlitSurface = SDL_UpperBlit;

/// SDL_UpperBlitScaled alias
alias SDL_BlitScaled = SDL_UpperBlitScaled;

nothrow:
SDL_Surface *SDL_CreateRGBSurface (uint flags, int width, int height, int depth, uint Rmask, uint Gmask, uint Bmask, uint Amask);
SDL_Surface *SDL_CreateRGBSurfaceFrom (void *pixels, int width, int height, int depth, int pitch, uint Rmask, uint Gmask, uint Bmask, uint Amask);
void SDL_FreeSurface (SDL_Surface *surface);
int SDL_SetSurfacePalette (SDL_Surface *surface, SDL_Palette *palette);
int SDL_LockSurface (SDL_Surface *surface);
void SDL_UnlockSurface (SDL_Surface *surface);
SDL_Surface *SDL_LoadBMP_RW (SDL_RWops *src, int freesrc);
int SDL_SaveBMP_RW (SDL_Surface *surface, SDL_RWops *dst, int freedst);
int SDL_SetSurfaceRLE (SDL_Surface *surface, int flag);
int SDL_SetColorKey (SDL_Surface *surface, int flag, uint key);
int SDL_GetColorKey (SDL_Surface *surface, uint key);
int SDL_SetSurfaceColorMod (SDL_Surface *surface, ubyte r, ubyte g, ubyte b);
int SDL_GetSurfaceColorMod (SDL_Surface *surface, ubyte *r, ubyte *g, ubyte *b);
int SDL_SetSurfaceAlphaMod (SDL_Surface *surface, ubyte alpha);
int SDL_GetSurfaceAlphaMod (SDL_Surface *surface, ubyte *alpha);
int SDL_SetSurfaceBlendMode (SDL_Surface *surface, SDL_BlendMode blendMode);
int SDL_GetSurfaceBlendMode (SDL_Surface *surface, SDL_BlendMode *blendMode);
SDL_bool SDL_SetClipRect (SDL_Surface *surface, const SDL_Rect *rect);
void SDL_GetClipRect (SDL_Surface *surface, SDL_Rect *rect);
int SDL_ConvertPixels (int width, int height, uint src_format, const void *src, int src_pitch, uint dst_format, void *dst, int dst_pitch);
int SDL_UpperBlit (SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect);
int SDL_LowerBlit (SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect);
int SDL_SoftStretch (SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect);
int SDL_UpperBlitScaled (SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect);
int SDL_LowerBlitScaled (SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect);