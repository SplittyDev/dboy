module sdl2.blendmode;
extern (C):

/// SDL Blend Mode
enum SDL_BlendMode {
    SDL_BLENDMODE_NONE  = 0x00000000,
    SDL_BLENDMODE_BLEND = 0x00000001,
    SDL_BLENDMODE_ADD   = 0x00000002,
    SDL_BLENDMODE_MOD   = 0x00000004,
}