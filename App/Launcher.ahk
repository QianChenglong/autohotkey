; RAlt + f 打开Everything;{{{;
<!f::
IfWinExist ahk_class EVERYTHING
{
    IfWinNotActive
    {
        WinActivate
    }
    Else
    {
        WinClose
    }
}
Else
{
    Run % Config.EveryThing
}
Return
;}}};
; LWin + f 打开FileLocator;{{{;
LWin & f::
IfWinExist,FileLocator Pro - 搜索
{
    IfWinNotActive
    {
        WinActivate
    }
    Else
    {
        WinClose
    }
}
Else
{
    Run %Config_FileLocator%
}
Return
;}}};
; LWin + Enter:命令行{{{;
LWin & Enter::
; run,  %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat", E:\Test ;
run,  %comspec%, E:\Test
return
;}}};
; Ctrl + Shift + Capslock : ProcessExplore{{{;
^+Capslock::
IfWinExist ahk_class PROCEXPL
{
    IfWinNotActive
    {
        WinActivate
    }
    Else
    {
        WinMinimize
    }
}
Else
{
    Run %Config_Procexp%
}
Return
;}}};
; Ctrl + q: 有道词典;{{{;
LCtrl & q::

text := GetSelectText()

DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winid, ID, 有道词典, , 下载
; MsgBox,%winid% ;
SetTitleMatchMode, 1
If (winid) {
    IfWinActive, 有道词典
    {
        WinClose
    }
    Else
    {
        WinWait, ahk_id %winid%
        WinShow
        WinActivate
        ControlSetText, Edit1, %text%, A
        ; ControlFocus, Edit1, A ;
        Send {Enter}
        Send ^a
        Send {Enter}
    }
} else {
    Run %Config_Dictionary%
}
DetectHiddenWindows, Off
return
;}}};
