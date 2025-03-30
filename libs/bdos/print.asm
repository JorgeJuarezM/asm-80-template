;-----------------------------------------------------------------------------
;   XPire - Intel 8080 Development Framework.
;
;   Author:     Jorge Luis Juárez Mandujano.
;   Date:       2025-03-29
;-----------------------------------------------------------------------------
;
;-----------------------------------------------------------------------------
;   Print String
;   Input:  DE => Pointer to string to print.
;-----------------------------------------------------------------------------
print_string::
    MVI     C, 9        ; Print String
    CALL    0x0005      ; Call Firmware subroutines
    RET

