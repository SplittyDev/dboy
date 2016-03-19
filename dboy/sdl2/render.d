module sdl2.render;
import sdl2.stdinc;
import sdl2.rect;
import sdl2.blendmode;
import sdl2.surface;
import sdl2.video;
extern (C):

/// SDL Renderer Flags
enum SDL_RendererFlags {
    SDL_RENDER_SOFTWARE         = 0x00000001,
    SDL_RENDER_ACCELERATED      = 0x00000002,
    SDL_RENDER_PRESENTVSYNC     = 0x00000004,
    SDL_RENDER_TARGETTEXTURE    = 0x00000008,
}

/// SDL Texture Access
enum SDL_TextureAccess {
    SDL_TEXTUREACCESS_STATIC,
    SDL_TEXTUREACCESS_STREAMING,
    SDL_TEXTUREACCESS_TARGET,
}

/// SDL Texture Modulate
enum SDL_TextureModulate {
    SDL_TEXTUREMODULATE_NONE    = 0x00000000,
    SDL_TEXTUREMODULATE_COLOR   = 0x00000001,
    SDL_TEXTUREMODULATE_ALPHA   = 0x00000002,
}

/// SDL Renderer Flip
enum SDL_RendererFlip {
    SDL_FLIP_NONE       = 0x00000000,
    SDL_FLIP_HORIZONTAL = 0x00000001,
    SDL_FLIP_VERTICAL   = 0x00000002,
}

/// SDL Renderer Info
struct SDL_RendererInfo {
    const char *name;
    uint flags;
    uint num_texture_formats;
    uint [16] texture_formats;
    int max_texture_width;
    int max_texture_height;
}

/// SDL Renderer (kinda hacky)
alias SDL_Renderer = void *;

/// SDL Renderer (kinda hacky)
alias SDL_Texture = void *;

nothrow:
int SDL_GetNumRenderDrivers ();
int SDL_GetRenderDriverInfo (int index, SDL_RendererInfo *info);
int SDL_CreateWindowAndRenderer (int width, int height, uint window_flags, SDL_Window **window, SDL_Renderer **renderer);
SDL_Renderer *SDL_CreateRenderer (SDL_Window *window, int index, uint flags);
SDL_Renderer *SDL_CreateSoftwareRenderer (SDL_Surface *surface);
SDL_Renderer *SDL_GetRenderer (SDL_Window *window);
int SDL_GetRendererInfo (SDL_Renderer *renderer, SDL_RendererInfo *info);
int SDL_GetRendererOutputSize (SDL_Renderer *renderer, int *w, int *h);
SDL_Texture *SDL_CreateTexture (SDL_Renderer *renderer, uint format, int access, int w, int h);
SDL_Texture *SDL_CreateTextureFromSurface (SDL_Renderer *renderer, SDL_Surface *surface);
int SDL_QueryTexture (SDL_Texture *texture, uint *format, int *access, int *w, int *h);
int SDL_SetTextureColorMod (SDL_Texture *texture, ubyte r, ubyte g, ubyte b);
int SDL_GetTextureColorMod (SDL_Texture *texture, ubyte *r, ubyte *g, ubyte *b);
int SDL_SetTextureAlphaMod (SDL_Texture *texture, ubyte alpha);
int SDL_GetTextureAlphaMod (SDL_Texture *texture, ubyte *alpha);
int SDL_SetTextureBlendMode (SDL_Texture *texture, SDL_BlendMode blendMode);
int SDL_GetTextureBlendMOde (SDL_Texture *texture, SDL_BlendMode *blendMode);
int SDL_UpdateTexture (SDL_Texture *texture, const SDL_Rect *rect, const void *pixels, int pitch);
int SDL_UpdateYUVTexture (SDL_Texture *texture, const SDL_Rect *rect, const ubyte *Yplane, int Ypitch, const ubyte *Uplane, int Upitch, const ubyte *Vplane, int Vpitch);
int SDL_LockTexture (SDL_Texture *texture, const SDL_Rect *rect, void **pixels, int *pitch);
int SDL_UnlockTexture (SDL_Texture *texture);
SDL_bool SDL_RenderTargetSupported (SDL_Renderer *renderer);
int SDL_SetRenderTarget (SDL_Renderer *renderer, SDL_Texture *texture);
SDL_Texture *SDL_GetRenderTarget (SDL_Renderer *renderer);
int SDL_RenderSetLogicalSize (SDL_Renderer *renderer, int w, int h);
int SDL_RenderGetLogicalSize (SDL_Renderer *renderer, int *w, int *h);
int SDL_RenderSetViewport (SDL_Renderer *renderer, const SDL_Rect *rect);
void SDL_RenderGetViewport (SDL_Renderer *renderer, SDL_Rect * rect);
int SDL_RenderSetClipRect (SDL_Renderer *renderer, const SDL_Rect *rect);
void SDL_RenderGetClipRect (SDL_Renderer *renderer, SDL_Rect *rect);
int SDL_RenderSetScale (SDL_Renderer *renderer, float scaleX, float scaleY);
void SDL_RenderGetScale (SDL_Renderer *renderer, float *scaleX, float *scaleY);
int SDL_SetRenderDrawColor (SDL_Renderer *renderer, ubyte r, ubyte g, ubyte b, ubyte a);
int SDL_GetRenderDrawColor (SDL_Renderer *renderer, ubyte *r, ubyte *g, ubyte *b, ubyte *a);
int SDL_SetRenderDrawBlendMode (SDL_Renderer *renderer, SDL_BlendMode blendMode);
int SDL_GetRenderDrawBlendMode (SDL_Renderer *renderer, SDL_BlendMode *blendMode);
int SDL_RenderClear (SDL_Renderer *renderer);
int SDL_RenderDrawPoint (SDL_Renderer *renderer, int x, int y);
int SDL_RenderDrawPoints (SDL_Renderer *renderer, const SDL_Point *points, int count);
int SDL_RenderDrawLine (SDL_Renderer *renderer, int x1, int y1, int x2, int y2);
int SDL_RenderDrawLines (SDL_Renderer *renderer, const SDL_Point *points, int count);
int SDL_RenderDrawRect (SDL_Renderer *renderer, const SDL_Rect *rect);
int SDL_RenderDrawRects (SDL_Renderer *renderer, const SDL_Rect *rects, int count);
int SDL_RenderFillRect (SDL_Renderer *renderer, const SDL_Rect *rect);
int SDL_RenderFillRects (SDL_Renderer *renderer, const SDL_Rect *rects, int count);
int SDL_RenderCopy (SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect *srcrect, const SDL_Rect *dstrect);
int SDL_RenderCopyEx (SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect *srcrect, const SDL_Rect *dstrect, const double angle, const SDL_Point *center, const SDL_RendererFlip flip);
int SDL_RenderReadPixels (SDL_Renderer *renderer, const SDL_Rect *rect, uint format, void *pixels, int pitch);
void SDL_RenderPresent (SDL_Renderer *renderer);
void SDL_DestroyTexture (SDL_Texture *texture);
void SDL_DestroyRenderer (SDL_Renderer *renderer);
int SDL_GL_BindTexture (SDL_Texture *texture, float *texw, float *texh);
int SDL_GL_UnbindTexture (SDL_Texture *texture);