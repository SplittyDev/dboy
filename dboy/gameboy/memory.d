module gameboy.memory;
import core.stdc.stdlib;
import core.memory : GC;

alias Address = ushort;
alias MMIOReadCallback = ubyte function ();
alias MMIOWriteCallback = void function (ubyte value);

/// GameBoy Memory
class Memory {
    
    ubyte *data;
    MMIOReadCallback[Address] read_mmio;
    MMIOWriteCallback[Address] write_mmio;

    this (uint size = 0x10000) {
        data = cast (ubyte *) GC.calloc (size);
        GC.setAttr (data, GC.BlkAttr.NO_MOVE);
        GC.addRoot (data);
    }

    ~this () {
        GC.removeRoot (data);
        GC.clrAttr (data, GC.BlkAttr.NO_MOVE);
        GC.free (data);
    }

    ubyte Read8u (Address addr) {
        ubyte mmio;
        if (TryReadMMIO (addr, mmio))
            return mmio;
        return data [addr];
    }

    ushort Read16u (Address addr) {
        ubyte data1;
        ubyte data2;
        if (!TryReadMMIO (cast (Address) (addr + 0), data1) &&
            !TryReadMMIO (cast (Address) (addr + 1), data2)) {
            data1 = data [addr + 0];
            data2 = data [addr + 1];
        }
        return cast (ushort) (data1 | data2);
    }

    void Write8u (Address addr, ubyte value) {
        data [addr] = value;
        TryWriteMMIO (addr, value);
    }

    void Write16u (Address addr, short value) {
        ubyte data1 = cast (ubyte) (value & 0xFF00);
        ubyte data2 = cast (ubyte) (value & 0x00FF);
        data [addr + 0] = data1;
        data [addr + 1] = data2;
        TryWriteMMIO (cast (Address) (addr + 0u), data1);
        TryWriteMMIO (cast (Address) (addr + 1u), data2);
    }

    bool TryReadMMIO (Address addr, out ubyte result) {
        result = 0;
        void *mmio = addr in read_mmio;
        if (mmio !is null) {
            result = read_mmio [addr] ();
            return true;
        }
        return false;
    }

    void TryWriteMMIO (Address addr, ubyte value) {
        void *mmio = addr in write_mmio;
        if (mmio !is null)
            write_mmio [addr] (value);
    }
}