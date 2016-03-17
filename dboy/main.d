import std.stdio;

import semver;
import gameboy;

int main(string[] argv) {

	// Print version
    print_version ();

	// Check argument bounds
	if (argv.length < 2) {
		print_usage ("Too few arguments.");
		return 0;
	}

	// Read cartridge
	ubyte cart [0x3FFF];
	if (!read_cart (argv [1], cart)) {
		writefln ("Exiting.");
		return 0;
	}

	// Read cartridge header
	auto header = read_cart_header (cart);
	writefln ("Title: %s", header.title);
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