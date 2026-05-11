# Project3
The third project in CMSC 313, implementing assembly 

As optimizations get faster the size of the file seems to increase
going from 139 lines of code at 2.15 kB to 148 lines of code at 2.26 kB to 159 lines of code at 2.47 kB.

One major source of this difference is shown at the quantity of calls to cfi, O0 has 6 references to cfi in total, while O1 has a dramatic increase to 22 references, and O3 with a small increase compared to O1 with only 24 references.

Although it seems to be the largest difference it of course cannot be the ONLY reason. Another difference is that O1/O3 became less literal with jumps for if and while statements. This can be exemplified best at line 31 on projO0 compared with line 45 on O1, and line 46 on O3, where after comparing O0 will jump to continue to run while O1/O3 only jumps to end it.

In terms of jump statements O0 has 4 jmp statements, O1 has 3 and O3 has 2. Although pure jmp statements seem to decrease there are other jump types used across the files. O0 and O1 has 1 jne statements while O3 has 2. O1 and O3 have 3 jle statements while O0 has 0. O0 has 3 jl statements where O1 and O3 have 0. So it seems that assemblers optimize away jl and replace them with jle. All of the codes regardless of optimization have only one jg statement.

One small difference between O0 and O1/O3 is with .section .rotdata, while O0 has only .section .rotdata, while O1/O3 has .section .rotdata.str1.1,"aMS",@progbits,1

A small difference between O1 and O3 is with LC4, while O1 only has a .text at line 14 while O3 has ".section	.text.startup,"ax",@progbits"which unlike O1 which is immediately following into main O3 has ".p2align 4". Later in the program O3 has 8 more references to alignment, for a total of 9 references, both O0 and O1 have no such references.

One final difference between O0/O1 and O3 is the use of ".cfi_restore_state" which only appears in O3.
