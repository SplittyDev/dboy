module gameboy.gameboy;
import gameboy.cartridge;
import gameboy.cpu;
import gameboy.memory;

class Gameboy {

    /// The cartridge
    Cartridge cart;

    /// The cpu
    CPU cpu;

    /// The memory
    Memory mem;

    /// Creates a new instance of the Gameboy class.
    this () {
        cpu = new CPU ();
        mem = new Memory ();
    }

    /// Creates a new instance of the Gameboy class.
    /// Loads the cartridge from the specified ubyte array.
    this (ubyte[] data) {
        this ();
        cart = Cartridge.FromRaw (data);
    }

    /// Creates a new instance of the Gameboy class.
    /// Loads the cartridge from the specified file.
    this (string filename) {
        this ();
        cart = Cartridge.FromFile (filename);
    }
}