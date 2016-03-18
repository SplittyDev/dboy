module sdl2.rect;
import sdl2.stdinc;
extern (C):

/// SDL Point
struct SDL_Point {
    int x;
    int y;
}

/// SDL Rectangle
struct SDL_Rect {
    int x;
    int y;
    int w;
    int h;
}

// Inline stuff
// Those were defines but.. defines suck
// And D doesn't have them anyway
// So be happy with that or go home
pragma (inline, true) nothrow {

    SDL_bool SDL_PointInRect (const SDL_Point *p, const SDL_Rect *r) {
        return ((p.x >= r.x) && (p.x < (r.x + r.w)) &&
                (p.y >= r.y) && (p.y < (r.y + r.h)))
                ? SDL_bool.SDL_TRUE
                : SDL_bool.SDL_FALSE;
    }

    SDL_bool SDL_RectEmpty (const SDL_Rect *r) {
        return (!r || r.w <= 0 || r.h <= 0)
               ? SDL_bool.SDL_TRUE
               : SDL_bool.SDL_FALSE;
    }

    SDL_bool SDL_RectEquals (const SDL_Rect *a, const SDL_Rect *b) {
        return (a && b &&
               (a.x == b.x) &&
               (a.y == b.y) &&
               (a.w == b.w) &&
               (a.h == b.h))
               ? SDL_bool.SDL_TRUE
               : SDL_bool.SDL_FALSE;
    }
}

nothrow:
SDL_bool SDL_HasIntersection (const SDL_Rect *A, const SDL_Rect *B);
SDL_bool SDL_IntersectRect (const SDL_Rect *A, const SDL_Rect *B, SDL_Rect *result);
void SDL_UnionRect (const SDL_Rect *A, const SDL_Rect *B, SDL_Rect *result);
SDL_bool SDL_EnclosePoints (const SDL_Point *points, int count, const SDL_Rect *clip, SDL_Rect *result);
SDL_bool SDL_IntersectRectAndLine (const SDL_Rect *rect, int *X1, int *Y1, int *X2, int *Y2);