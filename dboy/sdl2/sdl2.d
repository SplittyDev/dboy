import std.stdio;
extern (C) nothrow:

// SDL.h defines
enum SDL_INIT_TIMER             = 0x00000001;
enum SDL_INIT_AUDIO             = 0x00000010;
enum SDL_INIT_VIDEO             = 0x00000020;
enum SDL_INIT_JOYSTICK          = 0x00000200;
enum SDL_INIT_HAPTIC            = 0x00001000;
enum SDL_INIT_GAMECONTROLLER    = 0x00002000;
enum SDL_INIT_EVENTS            = 0x00004000;
enum SDL_INIT_EVERYTHING        = 0x0
                                | SDL_INIT_TIMER
                                | SDL_INIT_AUDIO
                                | SDL_INIT_VIDEO
                                | SDL_INIT_HAPTIC
                                | SDL_INIT_GAMECONTROLLER
                                | SDL_INIT_EVENTS;

// SDL.h functions
int SDL_Init (uint flags);
int SDL_InitSubSystem (uint flags);
void SDL_QuitSubSystem (uint flags);
uint SDL_WasInit (uint flags);
void SDL_Quit ();

// SDL_main.h functions
void SDL_SetMainReady ();
int SDL_RegisterApp (char *name, uint style, void *hInst);
void SDL_UnregisterApp ();

// SDL_stdinc.h types
enum SDL_bool {
    SDL_FALSE   = 0,
    SDL_TRUE    = 1,
}

// SDL_video.h defines
enum SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000;
int SDL_WINDOWPOS_UNDEFINED_DISPLAY (int x) {
    return SDL_WINDOWPOS_UNDEFINED_MASK | x;
}
enum SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_DISPLAY (0);
bool SDL_WINDOWPOS_ISUNDEFINED (int x) {
    return (x & 0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK;
}
enum SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000;
int SDL_WINDOWPOS_CENTERED_DISPLAY (int x) {
    return SDL_WINDOWPOS_CENTERED_MASK | x;
}
enum SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_DISPLAY (0);
bool SDL_WINDOWPOS_ISCENTERED (int x) {
    return (x & 0xFFFF0000) == SDL_WINDOWPOS_CENTERED_MASK;
}

// SDL_pixels.h defines
enum SDL_ALPHA_OPAQUE = 255;
enum SDL_ALPHA_TRANSPARENT = 0;

// SDL_pixels.h types
struct SDL_Color {
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a;
}

struct SDL_Palette {
    int ColorCount;
    SDL_Color *Colors;
    uint Version;
    int RefCount;
}

struct SDL_PixelFormat {
    uint format;
    SDL_Palette *palette;
    ubyte BitsPerPixel;
    ubyte BytesPerPixel;
    ubyte [2] padding;
    uint Rask;
    uint Gmask;
    uint Bmask;
    uint Amask;
    ubyte Rloss;
    ubyte Gloss;
    ubyte Bloss;
    ubyte Aloss;
    ubyte Rshift;
    ubyte Gshift;
    ubyte Bshift;
    ubyte Ashift;
    int refcount;
    SDL_PixelFormat *next;
}

enum {
    SDL_PIXELTYPE_UNKNOWN,
    SDL_PIXELTYPE_INDEX1,
    SDL_PIXELTYPE_INDEX4,
    SDL_PIXELTYPE_INDEX8,
    SDL_PIXELTYPE_PACKED8,
    SDL_PIXELTYPE_PACKED16,
    SDL_PIXELTYPE_PACKED32,
    SDL_PIXELTYPE_ARRAYU8,
    SDL_PIXELTYPE_ARRAYU16,
    SDL_PIXELTYPE_ARRAYU32,
    SDL_PIXELTYPE_ARRAYF16,
    SDL_PIXELTYPE_ARRAYF32,
}

enum {
    SDL_BITMAPORDER_NONE,
    SDL_BITMAPORDER_4321,
    SDL_BITMAPORDER_1234
}

enum {
    SDL_PACKEDORDER_NONE,
    SDL_PACKEDORDER_XRGB,
    SDL_PACKEDORDER_RGBX,
    SDL_PACKEDORDER_ARGB,
    SDL_PACKEDORDER_RGBA,
    SDL_PACKEDORDER_XBGR,
    SDL_PACKEDORDER_BGRX,
    SDL_PACKEDORDER_ABGR,
    SDL_PACKEDORDER_BGRA
}

enum {
    SDL_ARRAYORDER_NONE,
    SDL_ARRAYORDER_RGB,
    SDL_ARRAYORDER_RGBA,
    SDL_ARRAYORDER_ARGB,
    SDL_ARRAYORDER_BGR,
    SDL_ARRAYORDER_BGRA,
    SDL_ARRAYORDER_ABGR
}

enum {
    SDL_PACKEDLAYOUT_NONE,
    SDL_PACKEDLAYOUT_332,
    SDL_PACKEDLAYOUT_4444,
    SDL_PACKEDLAYOUT_1555,
    SDL_PACKEDLAYOUT_5551,
    SDL_PACKEDLAYOUT_565,
    SDL_PACKEDLAYOUT_8888,
    SDL_PACKEDLAYOUT_2101010,
    SDL_PACKEDLAYOUT_1010102
}

alias SDL_Colour = SDL_Color;

// SDL_pixels.h functions
immutable (char *) SDL_GetPixelFormatName (uint format);
SDL_bool SDL_PixelFormatEnumToMasks (uint format,
                                     int *bpp,
                                     uint *Rmask,
                                     uint *Gmask,
                                     uint *Bmask,
                                     uint *Amask);
uint SDL_MasksToPixelFormatEnum (int bpp,
                                 uint Rmask,
                                 uint Gmask,
                                 uint Bmask,
                                 uint Amask);
SDL_PixelFormat *SDL_AllocFormat (uint pixel_format);
void SDL_FreeFormat (SDL_PixelFormat *format);
SDL_Palette *SDL_AllocPalette (int ncolors);
int SDL_SetPixelFormatPalette (SDL_PixelFormat *format,
                               SDL_Palette *palette);
int SDL_SetPaletteColors (SDL_Palette *palette,
                          const SDL_Color *colors,
                          int firstcolor,
                          int ncolors);
void SDL_FreePalette (SDL_Palette *palette);
uint SDL_MapRGB (const SDL_PixelFormat *format,
                 ubyte r,
                 ubyte g,
                 ubyte b);
uint SDL_MapRGBA (const SDL_PixelFormat *format,
                  ubyte r,
                  ubyte g,
                  ubyte b,
                  ubyte a);
void SDL_GetRGB (uint pixel,
                 const SDL_PixelFormat *format,
                 ubyte *r,
                 ubyte *g,
                 ubyte *b);
void SDL_GetRGBA (uint pixel,
                  const SDL_PixelFormat *format,
                  ubyte *r,
                  ubyte *g,
                  ubyte *b,
                  ubyte *a);
void SDL_CalculateGammaRamp (float gamma,
                             ushort ramp);

// SDL_rect.h types
struct SDL_Point {
    int x;
    int y;
}

struct SDL_Rect {
    int x;
    int y;
    int w;
    int h;
}

// SDL_rect.h function implementations
SDL_bool SDL_PointInRect (const SDL_Point *p, const SDL_Rect *r) {
    return ((p.x >= r.x) && (p.x < (r.x + r.w)) &&
            (p.y >= r.y) && (p.y < (r.y + r.h))
           ) ? SDL_bool.SDL_TRUE : SDL_bool.SDL_FALSE;
}

SDL_bool SDL_RectEmpty (const SDL_Rect *r) {
    return (!r || r.w <= 0 || r.h <= 0) ? SDL_bool.SDL_TRUE : SDL_bool.SDL_FALSE;
}

SDL_bool SDL_RectEquals (const SDL_Rect *a, const SDL_Rect *b) {
    return (a && b &&
            (a.x == b.x) &&
            (a.y == b.y) &&
            (a.w == b.w) &&
            (a.h == b.h)
           ) ? SDL_bool.SDL_TRUE : SDL_bool.SDL_FALSE;
}

// SDL_rect.h functions
SDL_bool SDL_HasIntersection (const SDL_Rect *A,
                              const SDL_Rect *B);
SDL_bool SDL_IntersectRect (const SDL_Rect *A,
                            const SDL_Rect *B,
                            SDL_Rect *result);
void SDL_UnionRect (const SDL_Rect *A,
                    const SDL_Rect *B,
                    SDL_Rect *result);
SDL_bool SDL_EnclosePoints (const SDL_Point *points,
                            int count,
                            const SDL_Rect *clip,
                            SDL_Rect *result);
SDL_bool SDL_IntersectRectAndLine (const SDL_Rect *rect,
                                   int *X1,
                                   int *Y1,
                                   int *X2,
                                   int *Y2);

// SDL_blendmode.h types
enum SDL_BlendMode {
    SDL_BLENDMODE_NONE  = 0x00000000,
    SDL_BLENDMODE_BLEND = 0x00000001,
    SDL_BLENDMODE_ADD   = 0x00000002,
    SDL_BLENDMODE_MOD   = 0x00000004,
}

// SDL_rwops.h defines
enum SDL_RWOPS_UNKNOWN      = 0;
enum SDL_RWOPS_WINFILE      = 1;
enum SDL_RWOPS_STDFILE      = 2;
enum SDL_RWOPS_JNIFILE      = 3;
enum SDL_RWOPS_MEMORY       = 4;
enum SDL_RWOPS_MEMORY_RO    = 5;

// SDL_rwops.h types
struct SDL_RWops {
    alias size = byte function (SDL_RWops *context);
    alias seek = byte function (SDL_RWops *context,
                                byte offset,
                                int whence);
    alias read = uint function (SDL_RWops *context,
                                void *ptr,
                                uint size,
                                uint maxnum);
    alias write = uint function (SDL_RWops *context,
                                 const void *ptr,
                                 uint size,
                                 uint num);
    alias close = int function (SDL_RWops *context);
    uint type;
    union hidden {
        // #if defined (__WIN32__)
        struct _windowsio {
            SDL_bool append;
            void *h;
            struct _buffer {
                void *data;
                uint size;
                uint left;
            }
            _buffer buffer;
        }
        _windowsio windowsio;
        // #ifdef HAVE_STDIO_H
        struct _stdio {
            SDL_bool autoclose;
            FILE *fp;
        }
        _stdio stdio;
        struct _mem {
            ubyte *base;
            ubyte *here;
            ubyte *stop;
        }
        _mem mem;
        struct _unknown {
            void *data1;
            void *data2;
        }
        _unknown unknown;
    }
}

// SDL_surface.h defines
enum {
    SDL_SWSURFACE   = 0,
    SDL_PREALLOC    = 0x00000001,
    SDL_RLEACCEL    = 0x00000002,
    SDL_DONTFREE    = 0x00000004,
}

SDL_bool SDL_MUSTLOCK (SDL_Surface surface) {
    return cast (SDL_bool) ((surface.flags & SDL_RLEACCEL) != 0);
}

// SDL_surface.h types
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

alias SDL_blit = int function (SDL_Surface *src,
                               SDL_Rect *srcrect,
                               SDL_Surface *dst,
                               SDL_Rect *dstrect);

alias SDL_BlitSurface = SDL_UpperBlit;
alias SDL_BlitScaled = SDL_UpperBlitScaled;

// SDL_surface.h functions
SDL_Surface *SDL_CreateRGBSurface (uint flags,
                                   int width,
                                   int height,
                                   int depth,
                                   uint Rmask,
                                   uint Gmask,
                                   uint Bmask,
                                   uint Amask);
SDL_Surface *SDL_CreateRGBSurfaceFrom (void *pixels,
                                       int width,
                                       int height,
                                       int depth,
                                       int pitch,
                                       uint Rmask,
                                       uint Gmask,
                                       uint Bmask,
                                       uint Amask);
void SDL_FreeSurface (SDL_Surface *surface);
int SDL_SetSurfacePalette (SDL_Surface *surface,
                           SDL_Palette *palette);
int SDL_LockSurface (SDL_Surface *surface);
void SDL_UnlockSurface (SDL_Surface *surface);
SDL_Surface *SDL_LoadBMP_RW (SDL_RWops *src,
                             int freesrc);
int SDL_SaveBMP_RW (SDL_Surface *surface,
                    SDL_RWops *dst,
                    int freedst);
int SDL_SetSurfaceRLE (SDL_Surface *surface,
                       int flag);
int SDL_SetColorKey (SDL_Surface *surface,
                     int flag,
                     uint key);
int SDL_GetColorKey (SDL_Surface *surface,
                     uint key);
int SDL_SetSurfaceColorMod (SDL_Surface *surface,
                            ubyte r,
                            ubyte g,
                            ubyte b);
int SDL_GetSurfaceColorMod (SDL_Surface *surface,
                            ubyte *r,
                            ubyte *g,
                            ubyte *b);
int SDL_SetSurfaceAlphaMod (SDL_Surface *surface,
                            ubyte alpha);
int SDL_GetSurfaceAlphaMod (SDL_Surface *surface,
                            ubyte *alpha);
int SDL_SetSurfaceBlendMode (SDL_Surface *surface,
                             SDL_BlendMode blendMode);
int SDL_GetSurfaceBlendMode (SDL_Surface *surface,
                             SDL_BlendMode *blendMode);
SDL_bool SDL_SetClipRect (SDL_Surface *surface,
                          const SDL_Rect *rect);
void SDL_GetClipRect (SDL_Surface *surface,
                      SDL_Rect *rect);
int SDL_ConvertPixels (int width,
                       int height,
                       uint src_format,
                       const void *src,
                       int src_pitch,
                       uint dst_format,
                       void *dst,
                       int dst_pitch);
int SDL_UpperBlit (SDL_Surface *src,
                   const SDL_Rect *srcrect,
                   SDL_Surface *dst,
                   SDL_Rect *dstrect);
int SDL_LowerBlit (SDL_Surface *src,
                   SDL_Rect *srcrect,
                   SDL_Surface *dst,
                   SDL_Rect *dstrect);
int SDL_SoftStretch (SDL_Surface *src,
                     const SDL_Rect *srcrect,
                     SDL_Surface *dst,
                     const SDL_Rect *dstrect);
int SDL_UpperBlitScaled (SDL_Surface *src,
                         const SDL_Rect *srcrect,
                         SDL_Surface *dst,
                         SDL_Rect *dstrect);
int SDL_LowerBlitScaled (SDL_Surface *src,
                         SDL_Rect *srcrect,
                         SDL_Surface *dst,
                         SDL_Rect *dstrect);

// SDL_video.h types
struct SDL_DisplayMode {
    uint format;
    int w;
    int h;
    int refresh_rate;
    void *driverdata;
}

enum SDL_WindowFlags {
    SDL_WINDOW_NOFLAGS              = 0x00000000,
    SDL_WINDOW_FULLSCREEN           = 0x00000001,
    SDL_WINDOW_OPENGL               = 0x00000002,
    SDL_WINDOW_SHOWN                = 0x00000004,
    SDL_WINDOW_HIDDEN               = 0x00000008,
    SDL_WINDOW_BORDERLESS           = 0x00000010,
    SDL_WINDOW_RESIZABLE            = 0x00000020,
    SDL_WINDOW_MINIMIZED            = 0x00000040,
    SDL_WINDOW_MAXIMIZED            = 0x00000080,
    SDL_WINDOW_INPUT_GRABBED        = 0x00000100,
    SDL_WINDOW_INPUT_FOCUS          = 0x00000200,
    SDL_WINDOW_MOUSE_FOCUS          = 0x00000400,
    SDL_WINDOW_FULLSCREEN_DESKTOP   = (SDL_WINDOW_FULLSCREEN | 0x00001000),
    SDL_WINDOW_FOREIGN              = 0x00000800,
    SDL_WINDOW_ALLOW_HIGHDPI        = 0x00002000,
    SDL_WINDOW_MOUSE_CAPTURE        = 0x00004000,
}

enum SDL_WindowEventID {
    SDL_WINDOWEVENT_NONE,
    SDL_WINDOWEVENT_SHOWN,
    SDL_WINDOWEVENT_HIDDEN,
    SDL_WINDOWEVENT_EXPOSED,
    SDL_WINDOWEVENT_MOVED,
    SDL_WINDOWEVENT_RESIZED,
    SDL_WINDOWEVENT_SIZE_CHANGED,
    SDL_WINDOWEVENT_MINIMIZED,
    SDL_WINDOWEVENT_MAXIMIZED,
    SDL_WINDOWEVENT_RESTORED,
    SDL_WINDOWEVENT_ENTER,
    SDL_WINDOWEVENT_LEAVE,
    SDL_WINDOWEVENT_FOCUS_GAINED,
    SDL_WINDOWEVENT_FOCUS_LOST,
    SDL_WINDOWEVENT_CLOSE,
}

enum SDL_GLattr {
    SDL_GL_RED_SIZE,
    SDL_GL_GREEN_SIZE,
    SDL_GL_BLUE_SIZE,
    SDL_GL_ALPHA_SIZE,
    SDL_GL_BUFFER_SIZE,
    SDL_GL_DOUBLEBUFFER,
    SDL_GL_DEPTH_SIZE,
    SDL_GL_STENCIL_SIZE,
    SDL_GL_ACCUM_RED_SIZE,
    SDL_GL_ACCUM_GREEN_SIZE,
    SDL_GL_ACCUM_BLUE_SIZE,
    SDL_GL_ACCUM_ALPHA_SIZE,
    SDL_GL_STEREO,
    SDL_GL_MULTISAMPLEBUFFERS,
    SDL_GL_MULTISAMPLESAMPLES,
    SDL_GL_ACCELERATED_VISUAL,
    SDL_GL_RETAINED_BACKING,
    SDL_GL_CONTEXT_MAJOR_VERSION,
    SDL_GL_CONTEXT_MINOR_VERSION,
    SDL_GL_CONTEXT_EGL,
    SDL_GL_CONTEXT_FLAGS,
    SDL_GL_CONTEXT_PROFILE_MASK,
    SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
    SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR
}

enum SDL_GLprofile {
    SDL_GL_CONTEXT_PROFILE_CORE             = 0x0001,
    SDL_GL_CONTEXT_PROFILE_COMPATIBILITY    = 0x0002,
    SDL_GL_CONTEXT_PROFILE_ES               = 0x0004,
}

enum SDL_GLcontextFlag {
    SDL_GL_CONTEXT_DEBUG_FLAG               = 0x0001,
    SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG  = 0x0002,
    SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG       = 0x0004,
    SDL_GL_CONTEXT_RESET_ISOLATION_FLAG     = 0x0008,
}

enum SDL_GLcontextReleaseFlag {
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE    = 0x0000,
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH   = 0x0001,
}

enum SDL_HitTestResult {
    SDL_HITTEST_NORMAL,
    SDL_HITTEST_DRAGGABLE,
    SDL_HITTEST_RESIZE_TOPLEFT,
    SDL_HITTEST_RESIZE_TOP,
    SDL_HITTEST_RESIZE_TOPRIGHT,
    SDL_HITTEST_RESIZE_RIGHT,
    SDL_HITTEST_RESIZE_BOTTOMRIGHT,
    SDL_HITTEST_RESIZE_BOTTOM,
    SDL_HITTEST_RESIZE_BOTTOMLEFT,
    SDL_HITTEST_RESIZE_LEFT,
}

alias SDL_GLContext = void *;
alias SDL_Window = void *;

alias SDL_HitTest = SDL_HitTestResult function (SDL_Window *win,
                                                const SDL_Point *area,
                                                void *data);

// SDL_video.h functions
int SDL_GetNumVideoDrivers ();
char *SDL_GetVideoDriver (int index);
int SDL_VideoInit (const char *driver_name);
void SDL_VideoQuit ();
immutable (char *) SDL_GetCurrentVideoDriver ();
int SDL_GetNumVideoDisplays ();
immutable (char *) SDL_GetDisplayName (int displayIndex);
int SDL_GetDisplayBounds (int displayIndex,
                          SDL_Rect *rect);
int SDL_GetDisplayDPI (int displayIndex,
                       float *ddpi,
                       float *hdpi,
                       float *vdpi);
int SDL_GetNumDisplayModes (int displayIndex);
int SDL_GetDisplayMode (int displayIndex, int modeIndex,
                        SDL_DisplayMode *mode);
int SDL_GetDesktopDisplayMode (int displayIndex,
                               SDL_DisplayMode *mode);
int SDL_GetCurrentDisplayMode (int displayIndex,
                               SDL_DisplayMode *mode);
SDL_DisplayMode *SDL_GetClosestDisplayMode (int displayIndex,
                                            const SDL_DisplayMode *mode,
                                            SDL_DisplayMode *closest);
int SDL_GetWindowDisplayIndex (SDL_Window *window);
int SDL_SetWindowDisplayMode (SDL_Window *window,
                              const SDL_DisplayMode *mode);
int SDL_GetWindowDisplayMode (SDL_Window *window,
                              SDL_DisplayMode *mode);
uint SDL_GetWindowPixelFormat (SDL_Window *window);
SDL_Window *SDL_CreateWindow (const char *title,
                              int x,
                              int y,
                              int w,
                              int h,
                              uint flags);
SDL_Window *SDL_CreateWindowFrom (const void *data);
uint SDL_GetWindowID (SDL_Window *window);
SDL_Window *SDL_GetWindowFromID (uint id);
uint SDL_GetWindowFlags (SDL_Window *window);
void SDL_SetWindowTitle (SDL_Window *window,
                         const char *title);
immutable (char *) SDL_GetWindowTitle (SDL_Window *window);
void SDL_SetWindowIcon (SDL_Window *window,
                        SDL_Surface *icon);
void *SDL_SetWindowData (SDL_Window *window,
                         const char *name,
                         void *userdata);
void *SDL_GetWindowData (SDL_Window *window,
                         const char *name);
void SDL_SetWindowPosition (SDL_Window *window,
                            int x,
                            int y);
void SDL_GetWindowPosition (SDL_Window *window,
                            int *x,
                            int *y);
void SDL_SetWindowSize (SDL_Window *window,
                        int w,
                        int h);
void SDL_GetWindowSize (SDL_Window *window,
                        int *w,
                        int *h);
void SDL_SetWindowMinimumSize (SDL_Window *window,
                               int min_w,
                               int min_h);
void SDL_GetWindowMinimumSize (SDL_Window *window,
                               int *w,
                               int *h);
void SDL_SetWindowMaximumSize (SDL_Window *window,
                               int max_w,
                               int max_h);
void SDL_GetWindowMaximumSize (SDL_Window *window,
                               int *w,
                               int *h);
void SDL_SetWindowBordered (SDL_Window *window,
                            SDL_bool bordered);
void SDL_ShowWindow (SDL_Window *window);
void SDL_HideWindow (SDL_Window *window);
void SDL_RaiseWindow (SDL_Window *window);
void SDL_MaximizeWindow (SDL_Window *window);
void SDL_MinimizeWindow (SDL_Window *window);
void SDL_RestoreWindow (SDL_Window *window);
void SDL_SetWindowFullscreen (SDL_Window *window,
                              uint flags);
SDL_Surface *SDL_GetWindowSurface (SDL_Window *window);
int SDL_UpdateWindowSurface (SDL_Window *window);
int SDL_UpdateWindowSurfaceRects (SDL_Window *window,
                                  const SDL_Rect *rects,
                                  int numrects);
void SDL_SetWindowGrab (SDL_Window *window,
                        SDL_bool grabbed);
SDL_bool SDL_GetWindowGrab (SDL_Window *window);
int SDL_SetWindowBrightness (SDL_Window *window,
                             float brightness);
float SDL_GetWindowBrightness (SDL_Window *window);
int SDL_SetWindowGammaRamp (SDL_Window *window,
                            const ushort *red,
                            const ushort *green,
                            const ushort *blue);
int SDL_GetWindowGammaRamp (SDL_Window *window,
                            ushort *red,
                            ushort *green,
                            ushort *blue);
int SDL_SetWindowHitTest (SDL_Window *window,
                          SDL_HitTest callback,
                          void *callback_data );
void SDL_DestroyWindow (SDL_Window *window);
SDL_bool SDL_IsScreenSaverEnabled ();
void SDL_EnableScreenSaver ();
void SDL_DisableScreenSaver ();
int SDL_GL_LoadLibrary (const char *path);
void SDL_GL_GetProcAddress (const char *proc);
void SDL_GL_UnloadLibrary ();
SDL_bool SDL_GL_ExtensionSupported (const char *extension);
void SDL_GL_ResetAttributes ();
int SDL_GL_SetAttribute (SDL_GLattr attr,
                         int value);
int SDL_GL_GetAttribute (SDL_GLattr attr,
                         int *value);
SDL_GLContext SDL_GL_CreateContext (SDL_Window *window);
int SDL_GL_MakeCurrent (SDL_Window *window,
                        SDL_GLContext context);
SDL_Window *SDL_GL_GetCurrentWindow ();
SDL_GLContext SDL_GL_GetCurrentContext ();
void SDL_GL_GetDrawableSize (SDL_Window *window,
                             int *w,
                             int *h);
int SDL_GL_SetSwapInterval (int interval);
int SDL_GL_GetSwapInterval ();
void SDL_GL_SwapWindow (SDL_Window *window);
void SDL_GL_DeleteContext (SDL_GLContext context);