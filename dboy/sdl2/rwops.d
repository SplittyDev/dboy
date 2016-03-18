module sdl2.rwops;
import sdl2.stdinc;
import std.stdio : FILE;
extern (C):

enum SDL_RWOPS_UNKNOWN      = 0;
enum SDL_RWOPS_WINFILE      = 1;
enum SDL_RWOPS_STDFILE      = 2;
enum SDL_RWOPS_JNIFILE      = 3;
enum SDL_RWOPS_MEMORY       = 4;
enum SDL_RWOPS_MEMORY_RO    = 5;

/// SDL Read/Write Operations
struct SDL_RWops {

    alias size =
        byte function (SDL_RWops *context);
    alias seek =
        byte function (SDL_RWops *context, byte offset, int whence);
    alias read =
        uint function (SDL_RWops *context, void *ptr, uint size, uint maxnum);
    alias write =
        uint function (SDL_RWops *context, const void *ptr, uint size, uint num);
    alias close =
        int function (SDL_RWops *context);

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