; 初始化;{{{;
#SingleInstance Force
; 全局变量;{{{;
; TC;{{{;
RegRead OS_T, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion, ProductName
if (OS_T == "Windows 7 Ultimate")
    g_TC := "E:\OS\Windows\Soft\App\文件工具\管理器\TotalCommander\Tool\totalcmd64\TOTALCMD64.EXE"
else
    g_TC := "E:\OS\Windows\Soft\App\文件工具\文件管理器\TotalCommander\Tool\totalcmd\TOTALCMD.EXE"
;}}};
; Chrome;{{{;
; G_chrome:="E:\OS\CrossPlatform\Chrome\GoogleChromePortable\App\Google Chrome\chrome.exe --user-data-dir=PortableProfile --start-maximized --enable-easy-off-store-extension-install"
G_chrome:="E:\OS\CrossPlatform\ChromePlus\chrome.exe"
;G_chrome:="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;}}};
; Dictionary;{{{;
; g_Dictionary := "e:\OS\Windows\Soft\App\词典\lingoes_portable_2.9.1_cn\Lingoes.exe"
g_Dictionary := "E:\OS\Windows\Soft\App\词典\youdadict_15165\Dict\YodaoDict.exe"
;}}};
;}}};
;}}};
; 函数;{{{;
; traverse(ahk_class_name);{{{;
; 功能：遍历同一个程序的多个实例
; 参数：要遍历的程序的ahk_class名
traverse(ahk_class_name)
{
    static LastIndex := -1
    IfWinExist ahk_class %ahk_class_name%
    {
        WinGet , IDs, list, ahk_class %ahk_class_name%
        if LastIndex = -1
            LastIndex := IDs
        ; msgbox % LastIndex
        Loop , %IDs%
        {
            ; 当前要激活的ID
            WorkIndex := LastIndex + 1
            ; MsgBox % IDs WorkIndex
            If (WorkIndex > IDs)
            {
                WorkIndex := 1
            }
            ; MsgBox % A_Index WorkIndex
            If (%A_Index% == %WorkIndex%)
            {
                WorkID := IDs%WorkIndex%
                WinActivate , ahk_id %WorkID%
                LastIndex := WorkIndex
                Break
            }
        }
    }
    Else
        Run "D:\Program Files (x86)\Vim\vim74b\gvim.exe"
    Return
}
;}}};
;}}};
; 快捷输入;{{{;
::/tc::Total Commander
::/yx::qian_cheng_long@163.com
::/id::342501198812014054
::/xx::西南科技大学
::/zy::计算机科学与技术
::/sj::13795951413
::/rq::
d = %A_YYYY%-%A_MM%-%A_DD%
clipboard = %d%
Send ^v
return
;}}};
; 禁用快捷键{{{;
<#f::
return
#l::
return
;}}};
; 鼠标侧键有问题;{{{;
xbutton1::xbutton2
xbutton2::xbutton1
;}}};
; 亮度调节;{{{;
Br := 96    ;   Brightness Range: 0 - 255 where 0=darkest, 255=Brightest and 128 is Normal
<^<!Right::AdjustBrightness(+10)
>#Right::AdjustBrightness(+1)
<^<!Left::AdjustBrightness(-10)
>#Left::AdjustBrightness(-1)

AdjustBrightness( V=0 ) {
 Global himl
 Br := ( Br := DisplayGetBrightness() + V ) > 255 ? 255 : Br < 0 ? 0 : Br
 DisplaySetBrightness( Br )
 Traytip , , 亮度： %Br%, 1
}

DisplaySetBrightness( Br=128 ) {
 Loop, % VarSetCapacity( GR,1536 ) / 6
   NumPut( ( n := (Br+128)*(A_Index-1)) > 65535 ? 65535 : n, GR, 2*(A_Index-1), "UShort" )
 DllCall( "RtlMoveMemory", UInt,&GR+512,  UInt,&GR, UInt,512 )
 DllCall( "RtlMoveMemory", UInt,&GR+1024, UInt,&GR, UInt,512 )
Return DllCall( "SetDeviceGammaRamp", UInt,hDC := DllCall( "GetDC", UInt,0 ), UInt,&GR )
     , DllCall( "ReleaseDC", UInt,0, UInt,hDC )
}

DisplayGetBrightness( ByRef GR="" ) {
 VarSetCapacity( GR,1536,0 )
 DllCall( "GetDeviceGammaRamp", UInt,hDC := DllCall( "GetDC", UInt,0 ), UInt,&GR )
 Return NumGet( GR, 2, "UShort" ) - 128,  DllCall( "ReleaseDC", UInt,0, UInt,hDC )
}
;}}};
; ; 大小写重映射;{{{;
!Esc::Capslock
; Esc::Capslock
; Capslock::Esc
; ;}}};
; 左上角左键打开回收站;{{{;
~LButton::
MouseGetPos, x, y, OVarWin, OVarControl
; msgbox %x% %y%
if (x == 0 and y == 0)
{
    run C:\$Recycle.Bin\S-1-5-21-2631220286-1227603291-1070774961-1000
}
return
;}}};
; 鼠标中键粘贴，不覆盖原来功能;{{{;
;~MButton::
;    send %clipboard%
;    return
;}}};
; vim 快捷键;{{{;
; LWin + v 遍历 vim窗口;{{{;
<#v::traverse("Vim")
;}}};
#IfWinActive ahk_class Vim
; 修改侧键跳转
XButton1::send ^i
XButton2::send ^o
#IfWinActive
;}}};
; LWin + c 命令行;{{{;
<#c::
IfWinExist ahk_class wxWindowClassNR
    IfWinNotActive
        WinActivate
    Else
        WinMinimize
Else
    Run e:\OS\Windows\Soft\App\CMD增强工具\powercmd_2.2\PowerCmd.exe /P %USERPROFILE%
Return
;}}};
; F4快速打开命令行;{{{;
#IfWinActive ahk_class ExploreWClass ahk_class CabinetWClass
F4::
    WinGetActiveTitle, str_Title
    ; Get full path from open Explorer window
    WinGetText, FullPath, A
    ; Split up result (it returns paths seperated by newlines)
    StringSplit, PathArray, FullPath, `n
    ; Get first item
    FullPath = %PathArray1%
    ; Clean up result
    FullPath := RegExReplace(FullPath, "(^地址: )", "")
    ; MsgBox %FullPath%
    ; msgbox %FullPath%
    StringReplace, FullPath, FullPath, `r, , all
    ; Change working directory
    SetWorkingDir, %FullPath%
    ; 执行cmd
    run, %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"
return
#IfWinActive;}}};
; Alt + F4 退出命令行;{{{;
#IfWinActive ahk_class ConsoleWindowClass
!F4::sendinput exit{Enter}
#IfWinActive
;}}};
; Win + f 打开Everything;{{{;
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
    Run E:\OS\Windows\Soft\App\文件工具\文件搜索\Everything\绿色版\Everything.exe
}
Return
;}}};
; 打开ProcessExplore;{{{;
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
    Run "E:\OS\Windows\Soft\App\Process Explorer\procexp.exe"
}
Return
;}}};
; ; Ctrl + Shift + Capslock 打开taskmgr;{{{;
; ^+Esc::run taskmgr.exe
; ;}}};
; ; TC;{{{;
; LWin + e 运行TC{{{;
<#e::
global g_TC
Run %g_TC%
Return
;}}};
; Lwin + t 遍历TC窗口;{{{;
<#t::traverse("TTOTAL_CMD")
;}}};
; LAlt + Shift + t 切换Explorer和TC;{{{;
<!+T::switchTC()
switchTC()
{
    global g_TC
    ; 切换至Explore
    RegRead, Explorer, HKEY_CLASSES_ROOT, Folder\shell\open\command
    ; msgbox %explorer%
    if Explorer != `%SystemRoot`%\Explorer.exe
    {
        TrayTip,, 切换至Explorer ,1
        RegWrite, REG_EXPAND_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, , `%SystemRoot`%\Explorer.exe
        RegWrite, REG_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, DelegateExecute, {11dbb47c-a525-400b-9e80-a54615a090c0}
        useTC := false
    }
    Else
    {
        TrayTip,, 切换至TC ,1
        RegWrite, REG_EXPAND_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, , %g_TC% `"`%1`"
        RegDelete, HKEY_CLASSES_ROOT, Folder\shell\open\command, DelegateExecute
        useTC := true
    }
}
;}}};
; TC 快捷键;{{{;
#IfWinActive, ahk_class TTOTAL_CMD
; LCtrl + j Down;{{{;
<^j::send {Down}
;}}};
; LCtrl + k Up;{{{;
<^k::send {Up}
;}}};
; ; LCtrl + h BackSpace;{{{;
; <^h::Send {BackSpace}
; ;}}};
; ; LCtrl + l Enter;{{{;
; <^l::Send {Enter}
; ;}}};
; Ctrl + Alt + n 创建新文件;{{{;
!n::SendInput, +{F4}
;}}};
; Ctrl + alt + l 生成快捷方式;{{{;
!l::Send, ^+{F5}
;}}};
; ; 解压;{{{;
; ;本段程序功能：在TC中，按alt+F9出现解压对话框后，自动清空解压目录，这样就解压到当前目录了。
; ^!F9::
; PostMessage, 0x0111, 123, 0, , ahk_class TTOTAL_CMD
; WinWaitActive, ahk_class TDLGUNZIPALL
; send, {del}
; ; send, {enter}
; return
; ^!F9::
; sendplay, !{F9}
; WinWaitActive, ahk_class TDLGUNZIPALL
; send, {del}
; send, !s ;自动按下alt+s，让TC选中该选项
; send, {enter}
; return
; ;}}};
Return
;}}};
;}}};
; 右下角右键;{{{;
; ~RButton::
; MouseGetPos, x, y, OVarWin, OVarControl
; ; msgbox %x% %y%
; if (x > 1300 and y > 700)
; {
    ; run E:\Test\
; }
; return
;}}};
; Ctrl + Alt + n 新建文件;{{{;
#IfWinActive ahk_class ExploreWClass ahk_class CabinetWClass
    ; Ctrl+Alt+N
        ^!n::
        WinGetActiveTitle, str_Title
        ; Get full path from open Explorer window
        WinGetText, FullPath, A
        ; Split up result (it returns paths seperated by newlines)
        StringSplit, PathArray, FullPath, `n
        ; Get first item
        FullPath = %PathArray1%
        ; Clean up result
        FullPath := RegExReplace(FullPath, "(^地址: )", "")
        ; msgbox %FullPath%
        StringReplace, FullPath, FullPath, `r, , all
        ; Change working directory
        SetWorkingDir, %FullPath%
        ; An error occurred with the SetWorkingDir directive
        If ErrorLevel
        Return
        ; Display input box for filename
        InputBox, UserInput, 输入要创建的文件名, , , 200, 100
        ; User pressed cancel
        If ErrorLevel
        Return
        ; Create file
        FileAppend, , %UserInput%
        ; Open the file in the appropriate editor
        ; MsgBox, 4,, 是否编辑该文件?
        ; IfMsgBox Yes
        Run "D:\Program Files (x86)\Vim\vim74b\gvim.exe" "%UserInput%"
        ; If ErrorLevel {
            ; msgbox  %UserInput%
                ; Return
                ; }
    Return
#IfWinActive
        ;}}};
; F12 一键弹出U盘;{{{;
    F12::
        driveGet, DriverList, list, REMOVABLE
        ; 列出（ list ）移动设备（ REMOVABLE ）的盘符，如果你有两个移动设备，它们的盘符分别是 H: 和 I: 的话，那么这里 DriverList 的值会是： HI ，省略“ : ”。
        StringSplit, DriverListArray, DriverList
        ; 把 DriverList 的值进行字符串分解，后面不带任何要分割的符号的话，表示一个字母一个字母地分解，这样我们就可以得到每一个盘符了。

        loop %DriverListArray0%
        {
            target = % DriverListArray%A_Index% . ": "
                ; msgbox %target%
                ; 从后面开始解释：
                ; . “: “，连接一个字符串“ : ”
                ; %A_Index% ，表示当前循环到第几次
                ; % DriverListArray%A_Index% ，表示第 N 个移动磁盘
                run %A_ScriptDir%\RemoveDrive.exe %target% -b -l, ,Hide
        }
    TrayTip,, 所有移动设备全部弹出！ ,1000
        ; 弹出气泡提示， 3 秒后气泡消失。 TrayTip 的完整语法是： TrayTip [, 标题 , 文字 , 时间 , Options]
        return
        ;}}};
; ; ; LWin + g www.google.com.hk;{{{;
; <#g::Run www.google.com.hk
; ;}}};
; ; LWin + b www.baidu.com;{{{;
; <#b::Run www.baidu.com
; ;}}};
; chrome快捷键;{{{;
; Win + s chrome;{{{;
<#s::
Global G_chrome
IfWinExist ahk_class Chrome_WidgetWin_1
    IfWinNotActive
        WinActivate
    Else
        WinMinimize
Else
    Run %G_chrome%
Return
;}}};
#IfWinActive ahk_class Chrome_WidgetWin_1
<!1::Send ^1
<!2::Send ^2
<!3::Send ^3
<!4::Send ^4
<!5::Send ^5
<!6::Send ^6
<!7::Send ^7
<!8::Send ^8
#IfWinActive
;}}};
; 电源管理;{{{;
; RWin + c 关机;{{{;
>#c::Run shutdown /s /t 0
;}}};
; RWin + r 重启;{{{;
>#r::Run shutdown /r /t 0
;}}};
; RWin + h 休眠;{{{;
>#h::Run shutdown /h
;}}};
; RWin + s 睡眠;{{{;
>#s::Run psshutdown /accepteula /d /t 0
;}}};
; RWin + l 注销;{{{;
>#l::Run shutdown /l
;}}};
;}}};
; Alt + 侧键  = HOME END;{{{;
    Alt & XButton1::send {END}
    Alt & XButton2::send {HOME}
    ;}}};
; Ctrl + 侧键 = Page UP DOWN;{{{;
    Ctrl & XButton1::send {PgDn}
    Ctrl & XButton2::send {PgUp}
    ;}}};
; 桌面快捷键;{{{;
#IfWinActive ahk_class Progman ahk_class Shell_TrayWnd
    ; LAlt + t = E:\Test
        <!t::run E:\Test
        ; LAlt + w = E:\Work
        <!w::run E:\Work
        ; LAlt + d = E:\Download
        <!d::run E:\Download
        <!h::run %USERPROFILE%
#IfWinActive
        ;}}};
; 通知区域 ;{{{;
<#w::
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
; ; LWin + q 激活任务栏;{{{;
; <#q::WinActivate ,ahk_class Shell_TrayWnd
; ;}}};
; LAlt + Shift + x XMind;{{{;
<!+X::
IfWinExist XMind Pro
    IfWinNotActive
        WinActivate
    else
        WinMinimize
else
    run e:\OS\Windows\lnk\XMind.lnk
return
;}}};
; Win+y 字典;{{{;
#y::
global g_Dictionary
IfWinExist ahk_class  YodaoMainWndClass
{
    IfWinNotActive
    {
        WinActivate
        ; Send %clipboard%
    }
    Else
    {
        WinClose
    }
}
Else
{
    Run %g_Dictionary%
    WinActivate
    ; Send %clipboard%
}
return
;}}};
; RWin + k 酷狗;{{{;
>#k::
IfWinExist, ,酷狗MV
{
    IfWinNotActive , ,酷狗MV
    {
        WinActivate
    }
    Else
    {
        ; WinClose
        ; PostMessage, 0x10, 1, 0, , ,酷狗MV
        PostMessage, 0x112, 0xF060, , , ,酷狗MV
    }
}
Else
    Run e:\OS\Windows\Soft\App\酷狗\KGMusic\KuGou.exe
Return
;}}};
; LWin + L locate32;{{{;
!f::Run e:\OS\Windows\Soft\App\文件工具\文件搜索\locate32_x64-3.1.11.7100\locate32.exe
;}}};
; LWin + x 迅雷;{{{;
<#x::
IfWinExist 迅雷7
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
    Run e:\OS\Windows\Soft\App\下载\Thunder\Program\Thunder.exe
}
Return
;}}};
; 音量控制;{{{;
>^>!Up::
Send {Volume_Up}
Return
>^>!Down::
Send {Volume_Down}
Return
;}}};
; ; 记事本测试;{{{;
; F3::PostMessage, 0x111, 64, 0, , ahk_class Notepad
; ;}}};
; LWin + q QQ;{{{;
<#q::
IfWinExist 张莉
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
    Run "E:\OS\Windows\Soft\App\QQ\QQ2013\Bin\QQ.exe"
}
Return
;}}};
; mit-scheme{{{;
#IfWinActive ahk_class MIT-SCREEN
!F4::sendinput (exit){Enter}
#IfWinActive
;}}};
; LAlt + r : 运行对话框{{{;
<!r::
IfWinExist ,HappyRun
{
    IfWinNotActive , HappyRun
    {
        ;msgbox 3;
        WinActivate
    }
    Else
    {
        WinClose
    }
}
Else
    run e:\OS\Windows\Bin\HappyRun.exe
    WinActivate
Return

;}}};
