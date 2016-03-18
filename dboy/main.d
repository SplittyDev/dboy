import std.stdio;

import semver;
import gameboy.cartridge;
import gameboy.window;

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
    writefln ("Title: %s", cartridge.Header.title);

    // Create window
    // auto window = new Window ();

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