import std.stdio;
import std.exception;

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

bool read_cart (string filename, ubyte[] buffer) {
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

CartHeader read_cart_header (ubyte[] data) {
    auto ptr = data.ptr + 256;
    auto headerPtr = cast (CartHeader *) ptr;
    return *(headerPtr);
}