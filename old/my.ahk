; SECTION: ��ʼ��{{{;
#SingleInstance Force
; ȫ�ֱ���{{{;
SetWorkingDir,%A_ScriptDir%
IniRead, g_TC, my.ini, App, Total Commander
IniRead, g_Chrome, my.ini, App, Chrome
IniRead, g_Dictionary, my.ini, App, Dictionary
IniRead, g_PowerCmd, my.ini, App, PowerCmd
IniRead, g_Procexp, my.ini, App, Procexp
IniRead, g_Vim, my.ini, App, Vim
IniRead, g_Xmind, my.ini, App, Xmind
IniRead, g_KuGou, my.ini, App, KuGou
IniRead, g_XunLei, my.ini, App, XunLei
IniRead, g_HappyRun, my.ini, App, HappyRun
IniRead, g_EveryThing, my.ini, App, EveryThing
IniRead, g_FileLocator, my.ini, App, FileLocator
IniRead, g_Stock, my.ini, App, Stock
;MsgBox, The value is  %A_WorkingDir%;
;MsgBox, The value is  %A_ScriptDir%;
;RegRead OS_T, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion, ProductName
;if (OS_T == "Windows 7 Ultimate");
    ;g_TC := "E:\OS\Windows\Soft\App\�ļ�����\������\TotalCommander\Tool\totalcmd64\TOTALCMD64.EXE";
;else;
;    g_TC := "E:\OS\Windows\Soft\App\�ļ�����\�ļ�������\TotalCommander\Tool\totalcmd\TOTALCMD.EXE";

; Chrome;{{{;
; G_chrome:="E:\OS\CrossPlatform\Chrome\GoogleChromePortable\App\Google Chrome\chrome.exe --user-data-dir=PortableProfile --start-maximized --enable-easy-off-store-extension-install"
;G_chrome:="E:\OS\CrossPlatform\ChromePlus\chrome.exe";
;G_chrome:="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;}}};
;}}};
;}}};
; SECTION: ����{{{;
;; traverse(ahk_class_name);{{{;;
;; ���ܣ�����ͬһ������Ķ��ʵ��;
;; ������Ҫ�����ĳ����ahk_class��;
;traverse(ahk_class_name);
;{;
;    static LastIndex := -1;
;    IfWinExist ahk_class %ahk_class_name%;
;    {;
;        WinGet , IDs, list, ahk_class %ahk_class_name%;
;        if LastIndex = -1;
;            LastIndex := IDs;
;        ; msgbox % LastIndex;
;        Loop , %IDs%;
;        {;
;            ; ��ǰҪ�����ID;
;            WorkIndex := LastIndex + 1;
;            ; MsgBox % IDs WorkIndex;
;            If (WorkIndex > IDs);
;            {;
;                WorkIndex := 1;
;            };
;            ; MsgBox % A_Index WorkIndex;
;            If (%A_Index% == %WorkIndex%);
;            {;
;                WorkID := IDs%WorkIndex%;
;                WinActivate , ahk_id %WorkID%;
;                LastIndex := WorkIndex;
;                Break;
;            };
;        };
;    };
;    Else;
;        Run "D:\Program Files (x86)\Vim\vim74b\gvim.exe";
;    Return;
;};
;;}}};;
; GetSelectText(){{{;
; ��ȡ��ǰѡ������
GetSelectText()
{
    tmp = %ClipBoard% ; ����ԭ������
    ClipBoard = ; ���ճ����
    Send, ^c ; ��ȡ��ǰѡ������
    Sleep, 100 ; ȷ�������ɹ�
    text = %ClipBoard%
    ClipBoard = %cmp% ; ��ԭ
    return text
}
;}}};
; Rename(){{{;
Rename()
{
    WinGetActiveTitle, str_Title
    ; Get full path from open Explorer window
    WinGetText, FullPath, A
    ; Split up result (it returns paths seperated by newlines)
    StringSplit, PathArray, FullPath, `n
    ; Get first item
    FullPath = %PathArray1%
    ; Clean up result
    FullPath := RegExReplace(FullPath, "(^��ַ: )", "")
    msgbox %FullPath%
    ; StringReplace, FullPath, FullPath, `r, , all ;
    ; Change working directory
    ; SetWorkingDir, %FullPath% ;
    ; An error occurred with the SetWorkingDir directive
    ; If ErrorLevel ;
    ;     Exit ;
    ; InputBox, filename, ������, , , 200, 100 ;
    ; filename := FullPath . "/" . filename ;
    ; msgbox %filename% ;
    ; User pressed cancel
    ; If ErrorLevel ;
    ;     Exit ;
}
;}}};
; CreateFile(){{{;
; �����ļ�
; dir [out] �ļ�Ŀ¼
; filename [out] �ļ���
CreateFile(ByRef dir, ByRef filename)
{
    WinGetActiveTitle, str_Title
    ; Get full path from open Explorer window
    WinGetText, FullPath, A
    ; Split up result (it returns paths seperated by newlines)
    StringSplit, PathArray, FullPath, `n
    ; Get first item
    FullPath = %PathArray1%
    ; Clean up result
    FullPath := RegExReplace(FullPath, "(^��ַ: )", "")
    ; msgbox %FullPath% ;
    StringReplace, FullPath, FullPath, `r, , all
    ; Change working directory
    ; SetWorkingDir, %FullPath% ;
    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
        Exit
    ; Display input box for filename
    InputBox, filename, ����Ҫ�������ļ���, , , 200, 100
    filename := FullPath . "/" . filename
    ; msgbox %filename% ;
    ; User pressed cancel
    If ErrorLevel
        Exit
    ; Create file
    FileAppend , , %filename%

    dir := FullPath
}
;}}};
;}}};
; ; SECTION: �������{{{; ;
; ::/tc::Total Commander ;
; :*:/yx::qian_cheng_long@163.com ;
; ::/id::342501198812014054 ;
; ::/xx::���ϿƼ���ѧ ;
; ::/zy::�������ѧ�뼼�� ;
; ::/sj::13795951413 ;
; :*:/rq:: ;
; d = %A_YYYY%-%A_MM%-%A_DD% ;
; clipboard = %d% ;
; Send ^v ;
; return ;
; ;}}}; ;
; SECTION: ��ݼ�{{{;
; ���ÿ�ݼ�{{{;
;; ����Win ����{{{;;
;<#f::;
;return;
;;}}};;
;}}};
;;; ���������{{{;;;
;xbutton1::xbutton2;
;xbutton2::xbutton1;
;;;}}};;;
; Alt + ���  : HOME END;{{{;
Alt & XButton1::send {END}
Alt & XButton2::send {HOME}
;}}};
; Ctrl + ��� : Page UP DOWN;{{{;
Ctrl & XButton1::send {PgDn}
Ctrl & XButton2::send {PgUp}
;}}};
; ���ȵ���{{{;
; RCtrl + RAlt + Right : +10
; RCtrl + RAlt + Left : -10
; LWin + Right : +1
; LWin + Left : +1
Br := 76    ;   Brightness Range: 0 - 255 where 0=darkest, 255=Brightest and 128 is Normal
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
; ��Сд��ӳ��{{{;
; Alt + Capslock = Capslock // ��Ϊkeytweak������Capslock��Esc
!Esc::Capslock
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
;; F12 : ����U��{{{;;
;    F12::;
;        driveGet, DriverList, list, REMOVABLE;
;        ; �г��� list ���ƶ��豸�� REMOVABLE �����̷���������������ƶ��豸�����ǵ��̷��ֱ��� H: �� I: �Ļ�����ô���� DriverList ��ֵ���ǣ� HI ��ʡ�ԡ� : ����;
;        StringSplit, DriverListArray, DriverList;
;        ; �� DriverList ��ֵ�����ַ����ֽ⣬���治���κ�Ҫ�ָ�ķ��ŵĻ�����ʾһ����ĸһ����ĸ�طֽ⣬�������ǾͿ��Եõ�ÿһ���̷��ˡ�;
;;
;        loop %DriverListArray0%;
;        {;
;            target = % DriverListArray%A_Index% . ": ";
;                ; msgbox %target%;
;                ; �Ӻ��濪ʼ���ͣ�;
;                ; . ��: ��������һ���ַ����� : ��;
;                ; %A_Index% ����ʾ��ǰѭ�����ڼ���;
;                ; % DriverListArray%A_Index% ����ʾ�� N ���ƶ�����;
;                run %A_ScriptDir%\RemoveDrive.exe %target% -b -l, ,Hide;
;        };
;    TrayTip,, �����ƶ��豸ȫ�������� ,1000;
;        ; ����������ʾ�� 3 ���������ʧ�� TrayTip �������﷨�ǣ� TrayTip [, ���� , ���� , ʱ�� , Options];
;        return;
;        ;}}};;
; ��Դ����;{{{;
; RWin + c : �ػ�{{{;
>#c::Run shutdown /s /t 0
;}}};
; RWin + r : ����{{{;
>#r::Run shutdown /r /t 0
;}}};
; RWin + h : ����{{{;
>#h::Run shutdown /h
;}}};
; RWin + s : ˯��{{{;
>#s::Run psshutdown /accepteula /d /t 0
;}}};
; RWin + l : ע��{{{;
>#l::Run shutdown /l
;}}};
;}}};
; ��������ݼ�;{{{;
#IfWinActive ahk_class Progman ahk_class Shell_TrayWnd
; LAlt + t : E:\Test
<!t::run E:\Test
; LAlt + w : E:\Work
<!w::run E:\Work
; LAlt + d : E:\Download
<!d::run E:\Download
<!h::run %USERPROFILE%
<!v::run "E:\Work\VC++"
<!q::run "E:\Work\Project"
<^t::run E:\Todo
<^q::run E:\Question
LAlt & b::Run E:\Blog
LAlt & p::Run E:\Blog\source\_posts
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
; ; LCtrl + q ����������;{{{; ;
; LCtrl & q::WinActivate ,ahk_class Shell_TrayWnd ;
; ;}}}; ;
; ��������;{{{;
>^>!Up::
Send {Volume_Up}
Return
>^>!Down::
Send {Volume_Down}
Return
;}}};
; Win + f : ��󻯴���{{{;
<#f::
WinGet MX, MinMax, A
If MX
    WinRestore A
Else
    WinMaximize A
return
;}}};
;}}};
; SECTION: �����ݼ�{{{;
; vim {{{;
;; LWin + v ���� vim����;{{{;;
;<#v::traverse("Vim");
;;}}};;
#IfWinActive ahk_class Vim
; �޸Ĳ����ת;{{{;
XButton2::sendinput ^i
XButton1::sendinput ^o
;}}};
#IfWinActive
;}}};
; LWin + c : Power Cmd{{{;
<#c::
IfWinExist ahk_class wxWindowClassNR
    IfWinNotActive
        WinActivate
    Else
        WinMinimize
Else
    Run  %g_PowerCmd% /P %USERPROFILE%
Return
;}}};
; Explorer{{{;
#IfWinActive ahk_class ExploreWClass ahk_class CabinetWClass
; ; F2 : ������;{{{; ;
; F2:: ;
; Rename() ;
; Return ;
; ;}}}; ;
; F4 : cmd;;{{{;
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
; run, %comspec% ;
; run, %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat" ;
run, %comspec% 
return
;}}};
; F3 : ʹ��vim�༭;;{{{;
F3::
send {RButton}Z
return
;}}};
; Alt + n : �½��ļ����༭;{{{;
!n::
CreateFile(dir, filename)
if (filename = "")
{
    return
}
Run %g_Vim% "%filename%", "%dir%"
Return
;}}};
; Ctrl + Alt + n : �½��ļ�;{{{;
^!n::
CreateFile(dir, filename)
Return
;}}};
#IfWinActive
;}}};
; FileLocator{{{;
; RWin + f ��FileLocator;{{{;
LWin & f::
IfWinExist,FileLocator Pro - ����
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
    Run %g_FileLocator%
}
Return
;}}};
;}}};
; CMD{{{;
; LWin + Enter:������{{{;
LWin & Enter::
; run,  %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat", E:\Test ;
run,  %comspec%, E:\Test
return
;}}};
#IfWinActive ahk_class ConsoleWindowClass
; Alt + F4 : �˳�������;{{{;
!F4::PostMessage, 0x112, 0xF060
;}}};
#IfWinActive
;}}};
; EveryThing{{{;
; RAlt + f ��Everything;{{{;
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
    Run %g_EveryThing%
}
Return
;}}};
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
    Run %g_Procexp%
}
Return
;}}};
; ; TC{{{; ;
; ; LWin + e : TC{{{; ;
; <#e:: ;
; ;msgbox %g_TC%; ;
; Run %g_TC% ;
; Return ;
; ;}}}; ;
; ; TC ��ݼ�;{{{; ;
; #IfWinActive, ahk_class TTOTAL_CMD ;
; ; LCtrl + j : Down;{{{; ;
; <^j::send {Down} ;
; ;}}}; ;
; ; LCtrl + k : Up;{{{; ;
; <^k::send {Up} ;
; ;}}}; ;
; ; ; LCtrl + h :  BackSpace;{{{; ;
; ; <^h::Send {BackSpace} ;
; ; ;}}}; ;
; ; ; LCtrl + l : Enter;{{{; ;
; ; <^l::Send {Enter} ;
; ; ;}}}; ;
; ; Ctrl + Alt + n : �������ļ�;{{{; ;
; !n::SendInput, +{F4} ;
; ;}}}; ;
; ; Ctrl + alt + l : ���ɿ�ݷ�ʽ;{{{; ;
; !l::Send, ^+{F5} ;
; ;}}}; ;
; ;; ��ѹ;{{{;; ;
; ;;���γ����ܣ���TC�У���alt+F9���ֽ�ѹ�Ի�����Զ���ս�ѹĿ¼�������ͽ�ѹ����ǰĿ¼�ˡ�; ;
; ;!F9::; ;
; ;PostMessage, 0x0111, 123, 0, , ahk_class TTOTAL_CMD; ;
; ;WinWaitActive, ahk_class TDLGUNZIPALL; ;
; ;send, {del}; ;
; ;send, {enter}; ;
; ;return; ;
; ;!+F9::; ;
; ;sendplay, !{F9}; ;
; ;WinWaitActive, ahk_class TDLGUNZIPALL; ;
; ;send, {del}; ;
; ;send, !s ;�Զ�����alt+s����TCѡ�и�ѡ��; ;
; ;send, {enter}; ;
; ;return; ;
; ;}}}; ;
; Return ;
; #IfWinActive ;
; ;}}}; ;
; ;; Lwin + t ����TC����;{{{;; ;
; ;<#t::traverse("TTOTAL_CMD"); ;
; ;;}}};; ;
; ; LAlt + Shift + t : �л�Explorer��TC;{{{; ;
; <!+T::switchTC() ;
; switchTC() ;
; { ;
;     global g_TC ;
;     ; �л���Explore ;
;     RegRead, Explorer, HKEY_CLASSES_ROOT, Folder\shell\open\command ;
;     ;msgbox %explorer%; ;
;     if Explorer != `%SystemRoot`%\Explorer.exe ;
;     { ;
;         TrayTip,, �л���Explorer ,1 ;
;         RegWrite, REG_EXPAND_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, , `%SystemRoot`%\Explorer.exe ;
;         RegWrite, REG_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, DelegateExecute, {11dbb47c-a525-400b-9e80-a54615a090c0} ;
;         useTC := false ;
;     } ;
;     Else ;
;     { ;
;         TrayTip,, �л���TC ,1 ;
;         RegWrite, REG_EXPAND_SZ, HKEY_CLASSES_ROOT, Folder\shell\open\command, , %g_TC% `"`%1`" ;
;         RegDelete, HKEY_CLASSES_ROOT, Folder\shell\open\command, DelegateExecute ;
;         useTC := true ;
;     } ;
; } ;
; ;}}}; ;
; ;}}}; ;
; Chrome{{{;
; Win + s : chrome;{{{;
<#s::
IfWinExist ahk_class Chrome_WidgetWin_1
    IfWinNotActive
        WinActivate
    Else
        WinMinimize
    Else
        Run %G_chrome%
Return
;}}};
; ; Alt + number : ��ǩҳ{{{; ;
; #IfWinActive ahk_class Chrome_WidgetWin_1 ;
; <!1::Send ^1 ;
; <!2::Send ^2 ;
; <!3::Send ^3 ;
; <!4::Send ^4 ;
; <!5::Send ^5 ;
; <!6::Send ^6 ;
; <!7::Send ^7 ;
; <!8::Send ^8 ;
; #IfWinActive ;
; ;}}}; ;
;}}};
; XMind{{{;
; LAlt + Shift + x XMind;{{{;
<!+X::
IfWinExist XMind Pro
    IfWinNotActive
        WinActivate
    else
        WinMinimize
else
        run %g_Xmind%
return
;}}};
;}}};
; �е�{{{;
; Ctrl + q: ����;{{{;
LCtrl & q::

text := GetSelectText()

DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winid, ID, �е��ʵ�, , ����
; MsgBox,%winid% ;
SetTitleMatchMode, 1
If (winid) {
    IfWinActive, �е��ʵ�
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
    Run %g_Dictionary%
}
DetectHiddenWindows, Off
return
;}}};
;}}};
; �ṷ{{{;
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
        PostMessage, 0x112, 0xF060, , , ,�ṷMV
    }
}
Else
    Run g_KuGou
Return
;}}};
;}}};
; Ѹ��{{{;
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
    Run %g_XunLei%
}
Return
;}}};
;}}};
; mit-scheme{{{;
; �ر�{{{;
#IfWinActive ahk_class MIT-SCREEN
    !F4::sendinput (exit){Enter}
#IfWinActive
;}}};
;}}};
; ; HappyRun{{{; ;
; ; LAlt + r : ���жԻ���{{{; ;
; <!r:: ;
; run %g_HappyRun% ;
; Return ;
; ;}}}; ;
; ;}}}; ;
; ���жԻ���{{{;
#IfWinActive ahk_class #32770
tab::send {DOWN}
shift & tab::send {UP}
#IfWinActive
;}}};
; CodeBlocks{{{;
; �޸Ĳ����ת;{{{;
#IfWinActive ahk_class wxWindowClassNR
; ��ת���ϴ�
XButton1::sendinput ^!b
; ��ת���´�
XButton2::sendinput ^!f
; ��ת��ʵ��
LCtrl & LButton::sendinput ^+!d
; ��ת������
LAlt & LButton::sendinput ^!d
#IfWinActive
;}}};
;}}};
; LCtrl + `:ͬ��˳;{{{;
^`::
SetTitleMatchMode 1
IfWinExist, ͬ��˳
{
    IfWinNotActive
    {
        WinActivate

    }
    else
    {
        WinMinimize
    }
}
else
{
    run %g_Stock%
}
return
;}}};
;}}};
