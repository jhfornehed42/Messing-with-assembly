#!/bin/bash

nasm -f elf64 $1.asm
ld $1.o -o $1
./$1
