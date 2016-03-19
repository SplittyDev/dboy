module gameboy.cpu;
import std.bitmanip : BitArray;

/// Emulated GameBoy CPU
class CPU {

    /// CPU Register
    union Register {
        ushort r;
        struct Subs {
            ubyte hi;
            ubyte lo;
        }
        Subs subs;
    }

    struct Registers {
        union AFRegister {
            ushort r;
            struct Subs {
                ubyte A;
                BitArray F;
            }
            Subs subs;
        }
        AFRegister  AF;
        Register    BC;
        Register    DE;
        Register    HL;
        ushort      SP;
        ushort      PC;
    }
    Registers regs;

    this () {
        regs.AF.r = 0;
        regs.AF.subs.F = BitArray (8u, cast (uint *) &regs.AF.r);
    }
}