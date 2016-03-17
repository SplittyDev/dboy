import std.string;

struct Semver {
    int major;
    int minor;
    int patch;
    string semver;

    this (int major, int minor, int patch) {
        this.major = major;
        this.minor = minor;
        this.patch = patch;
        this.semver = format ("v%d.%d.%d", major, minor, patch);
    }
}