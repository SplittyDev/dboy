module gameboy.memory;
import core.stdc.stdlib;
import core.memory : GC;

alias Address = ushort;

/// GameBoy Memory
class Memory {
    
    ubyte *data;

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
}