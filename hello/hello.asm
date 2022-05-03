%macro print_string 2 ; macro to print a string to terminal
    mov rax, 1        ; sys_write
    mov rdi, 1        ; stdout
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro read_string 2 ; macro to read a string from standard input 
    mov rax, 0       ; sys_read
    mov rdi, 0       ; stdin
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro exit 0       ; macro to perform successful exit
    mov rax, 60     ; sys_exit
    mov rdi, 0      ; error code 0 (success)
    syscall
%endmacro

section .data
    name:       db "What is your name? "
    name_len:   equ $-name
    hello:      db "Hello "
    hello_len:  equ $-hello

section .bss
    name_var:   resb 64     ; reserve 64 bytes of memory for inputted name

section .text
    global _start

    _start:
        print_string    name, name_len
        read_string     name_var, 64
        print_string    hello, hello_len
        print_string    name_var, 64

        exit
