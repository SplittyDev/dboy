module sdl2.sdl;
public import sdl2.stdinc;
public import sdl2.error;
public import sdl2.rwops;
public import sdl2.rect;
public import sdl2.pixels;
public import sdl2.surface;
public import sdl2.video;
public import sdl2.render;
public import sdl2.events;
public import sdl2.quit;
extern (C):

enum SDL_INIT_TIMER             = 0x00000001;
enum SDL_INIT_AUDIO             = 0x00000010;
enum SDL_INIT_VIDEO             = 0x00000020;
enum SDL_INIT_JOYSTICK          = 0x00000200;
enum SDL_INIT_HAPTIC            = 0x00001000;
enum SDL_INIT_GAMECONTROLLER    = 0x00002000;
enum SDL_INIT_EVENTS            = 0x00004000;
enum SDL_INIT_EVERYTHING        = SDL_INIT_TIMER
                                | SDL_INIT_AUDIO
                                | SDL_INIT_VIDEO
                                | SDL_INIT_HAPTIC
                                | SDL_INIT_GAMECONTROLLER
                                | SDL_INIT_EVENTS;

nothrow:
int SDL_Init (uint flags);
int SDL_InitSubSystem (uint flags);
void SDL_QuitSubSystem (uint flags);
uint SDL_WasInit (uint flags);
void SDL_Quit ();