; ��ʼ��;{{{;
#SingleInstance Force
; ȫ�ֱ���;{{{;
; TC;{{{;
RegRead OS_T, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion, ProductName
if (OS_T == "Windows 7 Ultimate")
    g_TC := "E:\OS\Windows\Soft\App\�ļ�����\������\TotalCommander\Tool\totalcmd64\TOTALCMD64.EXE"
else
    g_TC := "E:\OS\Windows\Soft\App\�ļ�����\�ļ�������\TotalCommander\Tool\totalcmd\TOTALCMD.EXE"
;}}};
; Chrome;{{{;
; G_chrome:="E:\OS\CrossPlatform\Chrome\GoogleChromePortable\App\Google Chrome\chrome.exe --user-data-dir=PortableProfile --start-maximized --enable-easy-off-store-extension-install"
G_chrome:="E:\OS\CrossPlatform\ChromePlus\chrome.exe"
;G_chrome:="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;}}};
; Dictionary;{{{;
; g_Dictionary := "e:\OS\Windows\Soft\App\�ʵ�\lingoes_portable_2.9.1_cn\Lingoes.exe"
g_Dictionary := "E:\OS\Windows\Soft\App\�ʵ�\youdadict_15165\Dict\YodaoDict.exe"
;}}};
;}}};
;}}};
; ����;{{{;
; traverse(ahk_class_name);{{{;
; ���ܣ�����ͬһ������Ķ��ʵ��
; ������Ҫ�����ĳ����ahk_class��
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
            ; ��ǰҪ�����ID
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
; �������;{{{;
::/tc::Total Commander
::/yx::qian_cheng_long@163.com
::/id::342501198812014054
::/xx::���ϿƼ���ѧ
::/zy::�������ѧ�뼼��
::/sj::13795951413
::/rq::
d = %A_YYYY%-%A_MM%-%A_DD%
clipboard = %d%
Send ^v
return
;}}};
; ���ÿ�ݼ�{{{;
<#f::
return
#l::
return
;}}};
; �����������;{{{;
xbutton1::xbutton2
xbutton2::xbutton1
;}}};
; ���ȵ���;{{{;
Br := 96    ;   Brightness Range: 0 - 255 where 0=darkest, 255=Brightest and 128 is Normal
<^<!Right::AdjustBrightness(+10)
>#Right::AdjustBrightness(+1)
<^<!Left::AdjustBrightness(-10)
>#Left::AdjustBrightness(-1)

AdjustBrightness( V=0 ) {
 Global himl
 Br := ( Br := DisplayGetBrightness() + V ) > 255 ? 255 : Br < 0 ? 0 : Br
 DisplaySetBrightness( Br )
 Traytip , , ���ȣ� %Br%, 1
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
; ; ��Сд��ӳ��;{{{;
!Esc::Capslock
; Esc::Capslock
; Capslock::Esc
; ;}}};
; ���Ͻ�����򿪻���վ;{{{;
~LButton::
MouseGetPos, x, y, OVarWin, OVarControl
; msgbox %x% %y%
if (x == 0 and y == 0)
{
    run C:\$Recycle.Bin\S-1-5-21-2631220286-1227603291-1070774961-1000
}
return
;}}};
; ����м�ճ����������ԭ������;{{{;
;~MButton::
;    send %clipboard%
;    return
;}}};
; vim ��ݼ�;{{{;
; LWin + v ���� vim����;{{{;
<#v::traverse("Vim")
;}}};
#IfWinActive ahk_class Vim
; �޸Ĳ����ת
XButton1::send ^i
XButton2::send ^o
#IfWinActive
;}}};
; LWin + c ������;{{{;
<#c::
IfWinExist ahk_class wxWindowClassNR
    IfWinNotActive
        WinActivate
    Else
        WinMinimize
Else
    Run e:\OS\Windows\Soft\App\CMD��ǿ����\powercmd_2.2\PowerCmd.exe /P %USERPROFILE%
Return
;}}};
; F4���ٴ�������;{{{;
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
    FullPath := RegExReplace(FullPath, "(^��ַ: )", "")
    ; MsgBox %FullPath%
    ; msgbox %FullPath%
    StringReplace, FullPath, FullPath, `r, , all
    ; Change working directory
    SetWorkingDir, %FullPath%
    ; ִ��cmd
    run, %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"
return
#IfWinActive;}}};
; Alt + F4 �˳�������;{{{;
#IfWinActive ahk_class ConsoleWindowClass
!F4::sendinput exit{Enter}
#IfWinActive
;}}};
; Win + f ��Everything;{{{;
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
    Run E:\OS\Windows\Soft\App\�ļ�����\�ļ�����\Everything\��ɫ��\Everything.exe
}
Return
;}}};
; ��ProcessExplore;{{{;
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
; ; Ctrl + Shift + Capslock ��taskmgr;{{{;
; ^+Esc::run taskmgr.exe
; ;}}};
; ; TC;{{{;
; LWin + e ����TC{{{;
<#e::
global g_TC
Run %g_TC%
Return
;}}};
; Lwin + t ����TC����;{{{;
<#t::traverse("TTOTAL_CMD")
;}}};
; LAlt + Shift + t �л�Explorer��TC;{{{;
<!+T::switchTC()
switchTC()
{
    global g_TC
    ; �л���Explore
    RegRead, Explorer, HKEY_CLASSES_ROOT, Folder\shell\open\command
    ; msgbox %explorer%
    if Explorer != `%SystemRoot`%\Explorer.exe
    {
        TrayTip,, �л���Explorer ,1
        RegWrite, REG_EXPAND_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, , `%SystemRoot`%\Explorer.exe
        RegWrite, REG_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, DelegateExecute, {11dbb47c-a525-400b-9e80-a54615a090c0}
        useTC := false
    }
    Else
    {
        TrayTip,, �л���TC ,1
        RegWrite, REG_EXPAND_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, , %g_TC% `"`%1`"
        RegDelete, HKEY_CLASSES_ROOT, Folder\shell\open\command, DelegateExecute
        useTC := true
    }
}
;}}};
; TC ��ݼ�;{{{;
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
; Ctrl + Alt + n �������ļ�;{{{;
!n::SendInput, +{F4}
;}}};
; Ctrl + alt + l ���ɿ�ݷ�ʽ;{{{;
!l::Send, ^+{F5}
;}}};
; ; ��ѹ;{{{;
; ;���γ����ܣ���TC�У���alt+F9���ֽ�ѹ�Ի�����Զ���ս�ѹĿ¼�������ͽ�ѹ����ǰĿ¼�ˡ�
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
; send, !s ;�Զ�����alt+s����TCѡ�и�ѡ��
; send, {enter}
; return
; ;}}};
Return
;}}};
;}}};
; ���½��Ҽ�;{{{;
; ~RButton::
; MouseGetPos, x, y, OVarWin, OVarControl
; ; msgbox %x% %y%
; if (x > 1300 and y > 700)
; {
    ; run E:\Test\
; }
; return
;}}};
; Ctrl + Alt + n �½��ļ�;{{{;
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
        FullPath := RegExReplace(FullPath, "(^��ַ: )", "")
        ; msgbox %FullPath%
        StringReplace, FullPath, FullPath, `r, , all
        ; Change working directory
        SetWorkingDir, %FullPath%
        ; An error occurred with the SetWorkingDir directive
        If ErrorLevel
        Return
        ; Display input box for filename
        InputBox, UserInput, ����Ҫ�������ļ���, , , 200, 100
        ; User pressed cancel
        If ErrorLevel
        Return
        ; Create file
        FileAppend, , %UserInput%
        ; Open the file in the appropriate editor
        ; MsgBox, 4,, �Ƿ�༭���ļ�?
        ; IfMsgBox Yes
        Run "D:\Program Files (x86)\Vim\vim74b\gvim.exe" "%UserInput%"
        ; If ErrorLevel {
            ; msgbox  %UserInput%
                ; Return
                ; }
    Return
#IfWinActive
        ;}}};
; F12 һ������U��;{{{;
    F12::
        driveGet, DriverList, list, REMOVABLE
        ; �г��� list ���ƶ��豸�� REMOVABLE �����̷���������������ƶ��豸�����ǵ��̷��ֱ��� H: �� I: �Ļ�����ô���� DriverList ��ֵ���ǣ� HI ��ʡ�ԡ� : ����
        StringSplit, DriverListArray, DriverList
        ; �� DriverList ��ֵ�����ַ����ֽ⣬���治���κ�Ҫ�ָ�ķ��ŵĻ�����ʾһ����ĸһ����ĸ�طֽ⣬�������ǾͿ��Եõ�ÿһ���̷��ˡ�

        loop %DriverListArray0%
        {
            target = % DriverListArray%A_Index% . ": "
                ; msgbox %target%
                ; �Ӻ��濪ʼ���ͣ�
                ; . ��: ��������һ���ַ����� : ��
                ; %A_Index% ����ʾ��ǰѭ�����ڼ���
                ; % DriverListArray%A_Index% ����ʾ�� N ���ƶ�����
                run %A_ScriptDir%\RemoveDrive.exe %target% -b -l, ,Hide
        }
    TrayTip,, �����ƶ��豸ȫ�������� ,1000
        ; ����������ʾ�� 3 ���������ʧ�� TrayTip �������﷨�ǣ� TrayTip [, ���� , ���� , ʱ�� , Options]
        return
        ;}}};
; ; ; LWin + g www.google.com.hk;{{{;
; <#g::Run www.google.com.hk
; ;}}};
; ; LWin + b www.baidu.com;{{{;
; <#b::Run www.baidu.com
; ;}}};
; chrome��ݼ�;{{{;
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
; ��Դ����;{{{;
; RWin + c �ػ�;{{{;
>#c::Run shutdown /s /t 0
;}}};
; RWin + r ����;{{{;
>#r::Run shutdown /r /t 0
;}}};
; RWin + h ����;{{{;
>#h::Run shutdown /h
;}}};
; RWin + s ˯��;{{{;
>#s::Run psshutdown /accepteula /d /t 0
;}}};
; RWin + l ע��;{{{;
>#l::Run shutdown /l
;}}};
;}}};
; Alt + ���  = HOME END;{{{;
    Alt & XButton1::send {END}
    Alt & XButton2::send {HOME}
    ;}}};
; Ctrl + ��� = Page UP DOWN;{{{;
    Ctrl & XButton1::send {PgDn}
    Ctrl & XButton2::send {PgUp}
    ;}}};
; �����ݼ�;{{{;
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
; ֪ͨ���� ;{{{;
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
; ; LWin + q ����������;{{{;
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
; Win+y �ֵ�;{{{;
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
; RWin + k �ṷ;{{{;
>#k::
IfWinExist, ,�ṷMV
{
    IfWinNotActive , ,�ṷMV
    {
        WinActivate
    }
    Else
    {
        ; WinClose
        ; PostMessage, 0x10, 1, 0, , ,�ṷMV
        PostMessage, 0x112, 0xF060, , , ,�ṷMV
    }
}
Else
    Run e:\OS\Windows\Soft\App\�ṷ\KGMusic\KuGou.exe
Return
;}}};
; LWin + L locate32;{{{;
!f::Run e:\OS\Windows\Soft\App\�ļ�����\�ļ�����\locate32_x64-3.1.11.7100\locate32.exe
;}}};
; LWin + x Ѹ��;{{{;
<#x::
IfWinExist Ѹ��7
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
    Run e:\OS\Windows\Soft\App\����\Thunder\Program\Thunder.exe
}
Return
;}}};
; ��������;{{{;
>^>!Up::
Send {Volume_Up}
Return
>^>!Down::
Send {Volume_Down}
Return
;}}};
; ; ���±�����;{{{;
; F3::PostMessage, 0x111, 64, 0, , ahk_class Notepad
; ;}}};
; LWin + q QQ;{{{;
<#q::
IfWinExist ����
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
; LAlt + r : ���жԻ���{{{;
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
