;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  XPire - Intel 8080 Development Framework.
;;
;;  BDos Printing Example.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
.8080                       ; CPU model.
.area _DATA                 ; Declare DATA Area.
.area _CODE                 ; Declare CODE Area.
;;
JMP     _MAIN               ; Jump to Main Procedure.
;;
;;  Declare Global Symbols
;;
.globl  print_string
.globl  print_char
;;
;;
_MAIN:
    LXI     D, string       ; DE = Pointer to string.
    CALL    print_string

    MVI     A, 20           ; Number of characters to print.
    MVI     E, "-"          ; Character to print.
print_char_loop:
    CALL    print_char
    DCR     A
    JNZ     print_char_loop
    RET                     ; Finish program execution.
;;
;;  Define string to print.
;;  String must finish with $ to indicate that has finished.
;;
string: .ascii  "XPire => Hello World\n\r$"
