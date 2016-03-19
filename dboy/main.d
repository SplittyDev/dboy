import std.stdio;
import std.string;

import semver;
import gameboy.cartridge;
import gameboy.window;
import gameboy.gameboy;
import sdl2.render;

Gameboy emulator;

int main(string[] argv) {

    // Print version
    print_version ();

    // Check argument bounds
    if (argv.length < 2) {
        print_usage ("Too few arguments.");
        return 0;
    }

    // Read cartridge
    auto cartridge = new Cartridge (argv [1]);
    writefln ("Title: %s", cartridge.header.title);

    // Create emulator
    emulator = new Gameboy (cartridge);

    // Callbacks
    UpdateCallback update = function {
        emulator.RunCycle ();
    };

    RenderCallback render = function (SDL_Renderer *renderer) {
    };

    // Create window
    auto window = new Window ("DBoy");
    window.SetSize (160, 144);
    window.SetTitle (format ("[DBoy] %s", cartridge.header.title));
    window.Run (update, render);

    return 0;
}

void print_version () {
    auto semver = Semver (0, 1, 0);
    writefln ("DBoy %s", semver.semver);
}

void print_usage (string error) {
    writefln ("Error: %s", error);
    writeln ("Usage: dboy <rom>");
}