module gameboy.cartridge;
import std.stdio;
import std.exception;

/// Cartridge Header
struct CartHeader {

    /// Entry Point
    union EntryPoint {
        struct Entry {
            ubyte nop;
            ubyte jmp;
            ushort addr;
        }
        Entry entry;
        uint entrypoint;
    };
    EntryPoint entry_point;
    ubyte [48] nintendo_logo;
    char [11] title;
    byte [4]  manufacturer_code;
    ubyte cgb_flag;
    byte [2] license_code;
    ubyte sgb_flag;
    ubyte cartridge_type;
    ubyte rom_size;
    ubyte ram_size;
    ubyte dest_code;
    ubyte old_license_code;
    ubyte mask_version_number;
    ubyte header_checksum;
    ushort global_checksum;
}

/// GameBoy Cartridge
class Cartridge {

    /// Cartridge Header
    CartHeader header;

    /// Cartridge Data
    ubyte [0x3FFF] data;

    /// Constructs a new Cartridge from raw bytes
    this (ubyte[] data) {
        this.data = data;
        header = ParseHeader (this.data);
    }

    /// Constructs a new Cartridge from a physical file
    this (string filename) {
        LoadDataFromFile (filename, data);
        header = ParseHeader (data);
    }

    /// Returns a new Cartridge
    /// Constructed from raw bytes
    static Cartridge FromRaw (ubyte[] buffer) {
        return new Cartridge (buffer);
    }

    /// Returns a new Cartridge
    /// Constructres from a physical file
    static Cartridge FromFile (string filename) {
        return new Cartridge (filename);
    }

    /// Loads a physical cartridge file into a raw buffer
    static bool LoadDataFromFile (string filename, ubyte[] buffer) {
        File file;
        try {
            file = File (filename, "r");
        } catch (ErrnoException e) {
            writefln ("Error opening file: %s", filename);
            return false;
        }
        file.byChunk (buffer);
        return true;
    }

    /// Returns a reference to a Cartridge Header
    /// Constructed from the data contained in the supplied raw buffer
    static ref CartHeader ParseHeader (ubyte[] data) {
        auto ptr = data.ptr + 256;
        auto headerPtr = cast (CartHeader *) ptr;
        return *headerPtr;
    }
}