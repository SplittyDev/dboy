module sdl2.main;
extern (C) nothrow:

void SDL_SetMainReady ();
int SDL_RegisterApp (char *name, uint style, void *hInst);
void SDL_UnregisterApp ();