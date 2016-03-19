module sdl2.events;
import sdl2.stdinc;
import sdl2.error;
import sdl2.video;
//import sdl2.keyboard;
//import sdl2.mouse;
//import sdl2.joystick;
//import sdl2.gamecontroller;
import sdl2.quit;
//import sdl2.gesture;
//import sdl2.touch;

/*
 * TODO:
 * Implement the rest.
 *
 * INFO:
 * This module is currently very incomplete
 */

extern (C):

enum SDL_RELEASED   = 0;
enum SDL_PRESSED    = 1;

enum SDL_QUERY      = -1;
enum SDL_IGNORE     = 0;
enum SDL_DISABLE    = 0;
enum SDL_ENABLE     = 1;

enum SDL_TEXTEDITINGEVENT_TEXT_SIZE    = 32;
enum SDL_TEXTINPUTEVENT_TEXT_SIZE      = 32;

/// SDL Event Type
enum SDL_EventType {
    SDL_FIRSTEVENT = 0,

    // Application events
    SDL_QUIT = 0x100,
    SDL_APP_TERMINATING,
    SDL_APP_LOWMEMORY,
    SDL_APP_WILLENTERBACKGROUND,
    SDL_APP_DIDENTERBACKGROUND,
    SDL_APP_WILLENTERFOREGROUND,
    SDL_APP_DIDENTERGOREGROUND,

    // Window events
    SDL_WINDOWEVENT = 0x200,
    SDL_SYSWMEVENT,

    // Keyboard events
    SDL_KEYDOWN = 0x300,
    SDL_KEYUP,
    SDL_TEXTEDITING,
    SDL_TEXTINPUT,

    // Mouse events
    SDL_MOUSEMOTION = 0x400,
    SDL_MOUSEBUTTONDOWN,
    SDL_MOUSEBUTTONUP,
    SDL_MOUSEWHEEL,

    // Joystick events
    SDL_JOYAXISMOTION = 0x600,
    SDL_JOYBALLMOTION,
    SDL_JOYHATMOTION,
    SDL_JOYBUTTONDOWN,
    SDL_JOYBUTTONUP,
    SDL_JOYDEVICEADDED,
    SDL_JOYDEVICEREMOVED,

    // Gamecontroller events
    SDL_CONTROLLERAXISMOTION = 0x650,
    SDL_CONTROLLERBUTTONDOWN,
    SDL_CONTROLLERBUTTONUP,
    SDL_CONTROLLERDEVICEADDED,
    SDL_CONTROLLERDEVICEREMOVED,
    SDL_CONTROLLERDEVICEREMAPPED,

    // Touch events
    SDL_FINGERDOWN = 0x700,
    SDL_FINGERUP,
    SDL_FINGERMOTION,

    // Gesture events
    SDL_DOLLARGESTURE = 0x800,
    SDL_DOLLARRECORD,
    SDL_MULTIGESTURE,

    // Clipboard events
    SDL_CLIPBOARDUPDATE = 0x900,

    // Drag and drop events
    SDL_DROPFILE = 0x1000,

    // Render events
    SDL_RENDER_TARGETS_RESET = 0x2000,

    // User events
    SDL_USEREVENT = 0x8000,
    SDL_LASTEVENT = 0xFFFF,
}

/// SDL Event Action
enum SDL_eventaction {
    SDL_ADDEVENT,
    SDL_PEEKEVENT,
    SDL_GETEVENT,
}

/// SDL Common Event
struct SDL_CommonEvent {
    uint type;
    uint timestamp;
}

/// SDL Window Event
struct SDL_WindowEvent {
    uint type;
    uint timestamp;
    uint windowID;
    ubyte event;
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
    int data1;
    int data2;
}

/// SDL Keyboard Event
struct SDL_KeyboardEvent {
    uint type;
    uint timestamp;
    uint windowID;
    ubyte state;
    ubyte repeat;
    ubyte padding2;
    ubyte padding3;
    // TODO: Implement
    // SDL_Keysym keysym;
}

/// SDL Text Editing Event
struct SDL_TextEditingEvent {
    uint type;
    uint timestamp;
    uint windowID;
    char [SDL_TEXTEDITINGEVENT_TEXT_SIZE] text;
    int start;
    int length;
}

/// SDL Text Input Event
struct SDL_TextInputEvent {
    uint type;
    uint timestamp;
    uint windowID;
    char [SDL_TEXTINPUTEVENT_TEXT_SIZE] text;
}

/// SDL Mouse Motion Event
struct SDL_MouseMotionEvent {
    uint type;
    uint timestamp;
    uint windowID;
    uint which;
    uint state;
    int x;
    int y;
    int xrel;
    int yrel;
}

/// SDL Mouse Button Event
struct SDL_MouseButtonEvent {
    uint type;
    uint timestamp;
    uint windowID;
    uint which;
    ubyte button;
    ubyte state;
    ubyte clicks;
    ubyte padding1;
    int x;
    int y;
}

/// SDL Mouse Wheel Event
struct SDL_MouseWheelEvent {
    uint type;
    uint timestamp;
    uint windowID;
    uint which;
    int x;
    int y;
}

/// SDL Joystick Axis Event
@disable
struct SDL_JoyAxisEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_JoystickID which;
    ubyte axis;
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
    short value;
    ushort padding4;
}

/// SDL Joystick Ball Event
@disable
struct SDL_JoyBallEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_JoystickID which;
    ubyte ball;
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
    short xrel;
    short yrel;
}

/// SDL Joystick Hat Event
@disable
struct SDL_JoyHatEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_JoystickID which;
    ubyte hat;
    ubyte value;
    ubyte padding1;
    ubyte padding2;
}

/// SDL Joystick Button Event
@disable
struct SDL_JoyButtonEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_JoystickID which;
    ubyte button;
    ubyte state;
    ubyte padding1;
    ubyte padding2;
}

/// SDL Joystick Device Event
struct SDL_JoyDeviceEvent {
    uint type;
    uint timestamp;
    int which;
}

/// SDL Controller Axis Event
@disable
struct SDL_ControllerAxisEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_JoystickID which;
    ubyte axis;
    ubyte padding1;
    ubyte padding2;
    ubyte padding3;
    short value;
    short padding4;
}

/// SDL Controller Button Event
@disable
struct SDL_ControllerButtonEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_JoystickID which;
    ubyte button;
    ubyte state;
    ubyte padding1;
    ubyte padding2;
}

/// SDL Controller Device Event
struct SDL_ControllerDeviceEvent {
    uint type;
    uint timestamp;
    int which;
}

/// SDL Touch Finger Event
@disable
struct SDL_TouchFingerEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_TouchID touchId;
    // SDL_FingerID fingerId;
    float x;
    float y;
    float dx;
    float dy;
    float pressure;
}

/// SDL Multi Gesture Event
@disable
struct SDL_MultiGestureEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_TouchID touchId;
    float dTheta;
    float dDist;
    float x;
    float y;
    ushort numFingers;
    ushort padding;
}

/// SDL Dollar Gesture Event
@disable
struct SDL_DollarGestureEvent {
    uint type;
    uint timestamp;
    // TODO: Implement
    // SDL_TouchID touchId;
    // SDL_GestureID gestureId;
    uint numFingers;
    float error;
    float x;
    float y;
}

/// SDL Drop Event
struct SDL_DropEvent {
    uint type;
    uint timestamp;
    char *file;
}

/// SDL Quit Event
struct SDL_QuitEvent {
    uint type;
    uint timestamp;
}

/// SDL OS Event
struct SDL_OSEvent {
    uint type;
    uint timestamp;
}

/// SDL User Event
struct SDL_UserEvent {
    uint type;
    uint timestamp;
    uint windowID;
    int code;
    void *data1;
    void *data2;
}

/// SDL System Window Manager Event
struct SDL_SysWMEvent {
    uint type;
    uint timestamp;
    SDL_SysWMmsg *msg;
}

/// SDL System Window Manager Message
struct SDL_SysWMmsg;

union SDL_Event {
    uint type;
    SDL_CommonEvent common;
    SDL_WindowEvent window;
    SDL_KeyboardEvent key;
    SDL_TextEditingEvent edit;
    SDL_TextInputEvent text;
    SDL_MouseMotionEvent motion;
    SDL_MouseButtonEvent button;
    SDL_MouseWheelEvent wheel;
    SDL_JoyAxisEvent jaxis;
    SDL_JoyBallEvent jball;
    SDL_JoyHatEvent jhat;
    SDL_JoyDeviceEvent jdevice;
    SDL_ControllerAxisEvent caxis;
    SDL_ControllerButtonEvent cbutton;
    SDL_ControllerDeviceEvent cdevice;
    SDL_QuitEvent quit;
    SDL_UserEvent user;
    SDL_SysWMEvent syswm;
    SDL_TouchFingerEvent tfinder;
    SDL_MultiGestureEvent mgesture;
    SDL_DollarGestureEvent dgesture;
    SDL_DropEvent drop;
    ubyte [56] padding;
}

alias SDL_EventFilter =
int function (void *userdata, SDL_Event *event);

pragma (inline, true) nothrow {
    
    ubyte SDL_GetEventState (uint type) {
        return SDL_EventState (type, SDL_QUERY);
    }
}

nothrow:
void SDL_PumpEvents ();
int SDL_PeepEvents (SDL_Event *events, int numevents, SDL_eventaction action, uint minType, uint maxType);
SDL_bool SDL_HasEvent (uint type);
SDL_bool SDL_HasEvents (uint minType, uint maxType);
void SDL_FlushEvent (uint type);
void SDL_FlushEvents (uint minType, uint maxType);
int SDL_PollEvent (SDL_Event *event);
int SDL_WaitEvent (SDL_Event *event);
int SDL_WaitEventTimeout (SDL_Event *event, int timeout);
int SDL_PushEvent (SDL_Event *event);
void SDL_SetEventFilter (SDL_EventFilter filter, void *userdata);
SDL_bool SDL_GetEventFilter (SDL_EventFilter *filter, void **userdata);
void SDL_AddEventWatch (SDL_EventFilter filter, void *userdata);
void SDL_DelEventWatch (SDL_EventFilter filter, void *userdata);
void SDL_FilterEvents (SDL_EventFilter filter, void *userdata);
ubyte SDL_EventState (uint type, int state);
uint SDL_RegisterEvents (int numevents);