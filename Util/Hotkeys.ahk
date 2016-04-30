/*
 Modifiers:
   ^ - Ctrl
   ! - Alt
   + - Shift
   # - Win
*/
; 禁用快捷键{{{;
;; 禁用Win 搜索{{{;;
;<#f::;
;return;
;;}}};;
;}}};
; Ctrl + alt + r: 重新载入脚本{{{;
^!r::
Reload
; MsgBox, reload ;
Notify(A_ScriptName, "Reload", 0, "Style=Mine")
Return
;}}};
; Alt + Capslock : Capslock {{{;
<!Esc::Capslock ; 因为keytweak调换了Capslock和Esc
;}}};
; LWin + w: 弹出通知托盘 ;{{{;
LWin & w::
IfWinExist ahk_class NotifyIconOverflowWindow
{
    WinClose
}
Else
{
    Send #b
    Send {Space}
}
return
;}}};
; ; LCtrl + q 激活任务栏;{{{; ;
; LCtrl & q::WinActivate ,ahk_class Shell_TrayWnd ;
; ;}}}; ;
; 任务栏快捷键;{{{;
#IfWinActive ahk_class Progman ahk_class Shell_TrayWnd
<!t::run E:\Test
<!w::run E:\Work
<!d::run E:\Download
<!h::run %USERPROFILE%
LAlt & b::Run E:\Blog
LAlt & p::Run E:\Blog\source\_posts
#IfWinActive
        ;}}};
; ; 调整鼠标侧键{{{; ;
; xbutton1::xbutton2 ;
; xbutton2::xbutton1 ;
; ;}}}; ;
; Alt + 侧键  : HOME END;{{{;
Alt & XButton1::send {END}
Alt & XButton2::send {HOME}
;}}};
; Ctrl + 侧键 : Page UP DOWN;{{{;
Ctrl & XButton1::send {PgDn}
Ctrl & XButton2::send {PgUp}
;}}};
; ; 亮度调节{{{; ;
; ; RCtrl + RAlt + Right : +10 ;
; ; RCtrl + RAlt + Left : -10 ;
; ; LWin + Right : +1 ;
; ; LWin + Left : +1 ;
; Br := 76    ;   Brightness Range: 0 - 255 where 0=darkest, 255=Brightest and 128 is Normal ;
; <^<!Right::AdjustBrightness(+10) ;
; >#Right::AdjustBrightness(+1) ;
; <^<!Left::AdjustBrightness(-10) ;
; >#Left::AdjustBrightness(-1) ;
;  ;
; AdjustBrightness( V=0 ) { ;
;  Global himl ;
;  Br := ( Br := DisplayGetBrightness() + V ) > 255 ? 255 : Br < 0 ? 0 : Br ;
;  DisplaySetBrightness( Br ) ;
;  Traytip , , 亮度： %Br%, 1 ;
; } ;
;  ;
; DisplaySetBrightness( Br=128 ) { ;
;  Loop, % VarSetCapacity( GR,1536 ) / 6 ;
;    NumPut( ( n := (Br+128)*(A_Index-1)) > 65535 ? 65535 : n, GR, 2*(A_Index-1), "UShort" ) ;
;  DllCall( "RtlMoveMemory", UInt,&GR+512,  UInt,&GR, UInt,512 ) ;
;  DllCall( "RtlMoveMemory", UInt,&GR+1024, UInt,&GR, UInt,512 ) ;
; Return DllCall( "SetDeviceGammaRamp", UInt,hDC := DllCall( "GetDC", UInt,0 ), UInt,&GR ) ;
;      , DllCall( "ReleaseDC", UInt,0, UInt,hDC ) ;
; } ;
;  ;
; DisplayGetBrightness( ByRef GR="" ) { ;
;  VarSetCapacity( GR,1536,0 ) ;
;  DllCall( "GetDeviceGammaRamp", UInt,hDC := DllCall( "GetDC", UInt,0 ), UInt,&GR ) ;
;  Return NumGet( GR, 2, "UShort" ) - 128,  DllCall( "ReleaseDC", UInt,0, UInt,hDC ) ;
; } ;
; ;}}}; ;
; ; 右下角右键;{{{; ;
; ; ~RButton:: ;
; ; MouseGetPos, x, y, OVarWin, OVarControl ;
; ; ; msgbox %x% %y% ;
; ; if (x > 1300 and y > 700) ;
; ; { ;
;     ; run E:\Test\ ;
; ; } ;
; ; return ;
; ;}}}; ;
; ;; F12 : 弹出U盘{{{;; ;
; ;    F12::; ;
; ;        driveGet, DriverList, list, REMOVABLE; ;
; ;        ; 列出（ list ）移动设备（ REMOVABLE ）的盘符，如果你有两个移动设备，它们的盘符分别是 H: 和 I: 的话，那么这里 DriverList 的值会是： HI ，省略“ : ”。; ;
; ;        StringSplit, DriverListArray, DriverList; ;
; ;        ; 把 DriverList 的值进行字符串分解，后面不带任何要分割的符号的话，表示一个字母一个字母地分解，这样我们就可以得到每一个盘符了。; ;
; ;; ;
; ;        loop %DriverListArray0%; ;
; ;        {; ;
; ;            target = % DriverListArray%A_Index% . ": "; ;
; ;                ; msgbox %target%; ;
; ;                ; 从后面开始解释：; ;
; ;                ; . “: “，连接一个字符串“ : ”; ;
; ;                ; %A_Index% ，表示当前循环到第几次; ;
; ;                ; % DriverListArray%A_Index% ，表示第 N 个移动磁盘; ;
; ;                run %A_ScriptDir%\RemoveDrive.exe %target% -b -l, ,Hide; ;
; ;        }; ;
; ;    TrayTip,, 所有移动设备全部弹出！ ,1000; ;
; ;        ; 弹出气泡提示， 3 秒后气泡消失。 TrayTip 的完整语法是： TrayTip [, 标题 , 文字 , 时间 , Options]; ;
; ;        return; ;
; ;        ;}}};; ;
; ; 电源管理;{{{; ;
; ; RWin + c : 关机{{{; ;
; >#c::Run shutdown /s /t 0 ;
; ;}}}; ;
; ; RWin + r : 重启{{{; ;
; >#r::Run shutdown /r /t 0 ;
; ;}}}; ;
; ; RWin + h : 休眠{{{; ;
; >#h::Run shutdown /h ;
; ;}}}; ;
; ; RWin + s : 睡眠{{{; ;
; >#s::Run psshutdown /accepteula /d /t 0 ;
; ;}}}; ;
; ; RWin + l : 注销{{{; ;
; >#l::Run shutdown /l ;
; ;}}}; ;
; ;}}}; ;
; ; 音量控制;{{{; ;
; >^>!Up:: ;
; Send {Volume_Up} ;
; Return ;
; >^>!Down:: ;
; Send {Volume_Down} ;
; Return ;
; ;}}}; ;
