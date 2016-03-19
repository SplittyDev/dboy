module gameboy.gameboy;
import gameboy.cartridge;
import gameboy.cpu;
import gameboy.memory;

class Gameboy {

    Cartridge cart;
    CPU cpu;
    Memory mem;

    /// Creates a new instance of the Gameboy class.
    private this () {
        cpu = new CPU ();
        mem = new Memory ();
        InitCPU ();
        InitMemory ();
    }

    /// Creates a new instance of the Gameboy class.
    /// Loads the cartridge from the specified ubyte array.
    this (ubyte[] data) {
        cart = Cartridge.FromRaw (data);
        this ();
    }

    /// Creates a new instance of the Gameboy class.
    /// Loads the cartridge from the specified file.
    this (string filename) {
        cart = Cartridge.FromFile (filename);
        this ();
    }

    /// Initialize CPU
    void InitCPU () {
    }

    /// Initialize memory
    void InitMemory () {
        mem.Write8u (0xFF05, 0x00);
        mem.Write8u (0xFF06, 0x00);
        mem.Write8u (0xFF07, 0x00);
        mem.Write8u (0xFF10, 0x80);
        mem.Write8u (0xFF11, 0xBF);
        mem.Write8u (0xFF12, 0xF3);
        mem.Write8u (0xFF14, 0xBF);
        mem.Write8u (0xFF16, 0x3F);
        mem.Write8u (0xFF17, 0x00);
        mem.Write8u (0xFF19, 0xBF);
        mem.Write8u (0xFF1A, 0x7F);
        mem.Write8u (0xFF1B, 0xFF);
        mem.Write8u (0xFF1C, 0x9F);
        mem.Write8u (0xFF1E, 0xBF);
        mem.Write8u (0xFF20, 0xFF);
        mem.Write8u (0xFF21, 0x00);
        mem.Write8u (0xFF22, 0x00);
        mem.Write8u (0xFF23, 0xBF);
        mem.Write8u (0xFF24, 0x77);
        mem.Write8u (0xFF25, 0xF3);
        mem.Write8u (0xFF26, 0xF1);
        mem.Write8u (0xFF40, 0x91);
        mem.Write8u (0xFF42, 0x00);
        mem.Write8u (0xFF43, 0x00);
        mem.Write8u (0xFF45, 0x00);
        mem.Write8u (0xFF47, 0xFC);
        mem.Write8u (0xFF48, 0xFF);
        mem.Write8u (0xFF49, 0xFF);
        mem.Write8u (0xFF4A, 0x00);
        mem.Write8u (0xFF4B, 0x00);
        mem.Write8u (0xFFFF, 0x00);
    }
}