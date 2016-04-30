#IfWinActive ahk_class ConsoleWindowClass
; Alt + F4 : 退出命令行;{{{;
!F4::PostMessage, 0x112, 0xF060
;}}};
#IfWinActive
