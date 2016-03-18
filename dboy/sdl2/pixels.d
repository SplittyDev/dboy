module sdl2.pixels;
import sdl2.stdinc;
extern (C):

/// Opaque alpha value
enum SDL_ALPHA_OPAQUE = 255;

/// Transparent alpha value
enum SDL_ALPHA_TRANSPARENT = 0;

/// SDL Pixel Types
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

/// SDL Bitmap Order
enum {
    SDL_BITMAPORDER_NONE,
    SDL_BITMAPORDER_4321,
    SDL_BITMAPORDER_1234
}

/// SDL Package Order
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

/// SDL Array Order
enum {
    SDL_ARRAYORDER_NONE,
    SDL_ARRAYORDER_RGB,
    SDL_ARRAYORDER_RGBA,
    SDL_ARRAYORDER_ARGB,
    SDL_ARRAYORDER_BGR,
    SDL_ARRAYORDER_BGRA,
    SDL_ARRAYORDER_ABGR
}

/// SDL Packed Layout
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

/// SDL Color (RGBA)
struct SDL_Color {
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a;
}

/// SDL Palette
struct SDL_Palette {
    int ColorCount;
    SDL_Color *Colors;
    uint Version;
    int RefCount;
}

/// SDL Pixel Format
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

/// SDL_Color alias
alias SDL_Colour = SDL_Color;

nothrow:
immutable (char *) SDL_GetPixelFormatName (uint format);
SDL_bool SDL_PixelFormatEnumToMasks (uint format, int *bpp, uint *Rmask, uint *Gmask, uint *Bmask, uint *Amask);
uint SDL_MasksToPixelFormatEnum (int bpp, uint Rmask, uint Gmask, uint Bmask, uint Amask);
SDL_PixelFormat *SDL_AllocFormat (uint pixel_format);
void SDL_FreeFormat (SDL_PixelFormat *format);
SDL_Palette *SDL_AllocPalette (int ncolors);
int SDL_SetPixelFormatPalette (SDL_PixelFormat *format, SDL_Palette *palette);
int SDL_SetPaletteColors (SDL_Palette *palette, const SDL_Color *colors, int firstcolor, int ncolors);
void SDL_FreePalette (SDL_Palette *palette);
uint SDL_MapRGB (const SDL_PixelFormat *format, ubyte r, ubyte g, ubyte b);
uint SDL_MapRGBA (const SDL_PixelFormat *format, ubyte r, ubyte g, ubyte b, ubyte a);
void SDL_GetRGB (uint pixel, const SDL_PixelFormat *format, ubyte *r, ubyte *g, ubyte *b);
void SDL_GetRGBA (uint pixel, const SDL_PixelFormat *format, ubyte *r, ubyte *g, ubyte *b, ubyte *a);
void SDL_CalculateGammaRamp (float gamma, ushort ramp);