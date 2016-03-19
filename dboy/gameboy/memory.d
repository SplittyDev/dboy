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
        Init ();
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

    void Init () {
        Write8u (0xFF05, 0x00);
        Write8u (0xFF06, 0x00);
        Write8u (0xFF07, 0x00);
        Write8u (0xFF10, 0x80);
        Write8u (0xFF11, 0xBF);
        Write8u (0xFF12, 0xF3);
        Write8u (0xFF14, 0xBF);
        Write8u (0xFF16, 0x3F);
        Write8u (0xFF17, 0x00);
        Write8u (0xFF19, 0xBF);
        Write8u (0xFF1A, 0x7F);
        Write8u (0xFF1B, 0xFF);
        Write8u (0xFF1C, 0x9F);
        Write8u (0xFF1E, 0xBF);
        Write8u (0xFF20, 0xFF);
        Write8u (0xFF21, 0x00);
        Write8u (0xFF22, 0x00);
        Write8u (0xFF23, 0xBF);
        Write8u (0xFF24, 0x77);
        Write8u (0xFF25, 0xF3);
        Write8u (0xFF26, 0xF1);
        Write8u (0xFF40, 0x91);
        Write8u (0xFF42, 0x00);
        Write8u (0xFF43, 0x00);
        Write8u (0xFF45, 0x00);
        Write8u (0xFF47, 0xFC);
        Write8u (0xFF48, 0xFF);
        Write8u (0xFF49, 0xFF);
        Write8u (0xFF4A, 0x00);
        Write8u (0xFF4B, 0x00);
        Write8u (0xFFFF, 0x00);
    }
}