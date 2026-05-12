# Project3
The third project in CMSC 313, implementing assembly 

The first difference I noticed between the files is the sizes. O0 has 139 lines of code at 2.15 kB, O1 has 148 lines of code at 2.26 kB, and O3 has 159 lines of code at 2.47 kB. As optimizations get improved the size of the file increases.

One major source of this difference is shown at the quantity of calls to cfi, O0 has 6 references to cfi in total, while O1 has a dramatic increase to 22 references, and O3 with a small increase compared to O1 with only 24 references. Most of the new cfi lines of code have to do with offsets .cfi_def_cfa_offset and .cfi_offset. .cfi_def_cfa_offset modifies the rule for computing the canonical frame adress.

Although it seems to be the largest difference it of course cannot be the ONLY reason. Another difference is that O1/O3 became less literal with jumps for if and while statements. This can be exemplified best at line 31 on projO0 compared with line 45 on O1, and line 46 on O3, where after comparing O0 will jump to continue to run while O1/O3 only jumps to end it.

In terms of jump statements O0 has 4 jmp statements, O1 has 3 and O3 has 2. Although pure jmp statements seem to decrease there are other jump types used across the files. O0 and O1 has 1 jne statements while O3 has 2. O1 and O3 have 3 jle statements while O0 has 0. O0 has 3 jl statements where O1 and O3 have 0. So it seems that assemblers optimize away jl and replace them with jle. All of the codes regardless of optimization have only one jg statement.

One small difference between O0 and O1/O3 is with .section .rotdata, while O0 has only .section .rodata, while O1/O3 has .section .rodata.str1.1,"aMS",@progbits,1. rodata is a section meant to hold read only data, it's default type is %progbits. The ".str1.1,"aMS",@progbits,1" means the strings are one-byte-per-character encoding that require and one-byte alignment. This allows the linker to identify strings which suffices others, which can be used to reduce storage.

A small difference between O1 and O3 is with LC4, while O1 only has a .text at line 14 while O3 has ".section	.text.startup,"ax",@progbits"which unlike O1 which is immediately following into main O3 has ".p2align 4". Later in the program O3 has 8 more references to alignment, for a total of 9 references, both O0 and O1 have no such references. What p2align does is that it aligns the current location along a 2n boundary where n is the number following .p2align. In this case 4, so it stores data along 16 byte boundaries. The unused space could be filled if specific instructions are given to do so, but are padded with 0s otherwise. By doing this it increases the efficiency of load operations.

One final difference between O0/O1 and O3 is the use of ".cfi_remember_state" and ".cfi_restore_state" which only appears in O3. cfi pushes the the rules of the registers onto an implicit stack and restore state pops them from the stack. This creates a more efficient control flow.
