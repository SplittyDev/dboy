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

    /// Creates a new instance of the Gameboy class.
    /// Loads an existing cartridge instance.
    this (Cartridge cart) {
        this.cart = cart;
        this ();
    }

    /// Run a single cpu cycle
    void RunCycle () {
        // TODO: Implement
    }

    /// Initialize CPU
    void InitCPU () {
        cpu.regs.AF.r   = 0x01B0;
        cpu.regs.BC.r   = 0x0013;
        cpu.regs.DE.r   = 0x00D8;
        cpu.regs.HL.r   = 0x014D;
        cpu.regs.SP     = 0xFFFE;
        cpu.regs.PC     = 0x0100;
    }
}