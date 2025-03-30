;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  XPire - Intel 8080 Development Framework
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
.area _DATA
.area _CODE
;;
;;
.globl  print_string
;;
;;
_MAIN:
    LXI     D, string
    CALL    print_string
    JMP     .


string: .ascii  "XPire => Hello World$"
