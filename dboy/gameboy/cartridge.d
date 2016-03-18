module gameboy.cartridge;
import std.stdio;
import std.exception;

/// Cartridge Header
struct CartHeader {
    union EntryPoint {
        struct CartHeaderEntry  {
            ubyte nop;
            ubyte jmp;
            ushort addr;
        }
        CartHeaderEntry entry;
        uint entrypoint;
    };
    EntryPoint entry_point;
    ubyte nintendo_logo [48];
    char title [11];
    byte manufacturer_code [4];
    ubyte cgb_flag;
    byte license_code [2];
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

/// Cartridge
class Cartridge {

    /// Cartridge Header
    CartHeader Header;

    /// Cartridge Data
    ubyte[0x3FFF] Data;

    this (ubyte[] data) {
        Data = data;
        Header = ParseHeader (Data);
    }

    this (string filename) {
        LoadDataFromFile (filename, Data);
        Header = ParseHeader (Data);
    }

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

    static CartHeader ParseHeader (ubyte[] data) {
        auto ptr = data.ptr + 256;
        auto headerPtr = cast (CartHeader *) ptr;
        return *(headerPtr);
    }
}