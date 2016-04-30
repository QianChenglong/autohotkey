#IfWinActive ahk_class ExploreWClass ahk_class CabinetWClass
; ; F2 : 重命名;{{{; ;
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
FullPath := RegExReplace(FullPath, "(^地址: )", "")
; MsgBox %FullPath%
; msgbox %FullPath%
StringReplace, FullPath, FullPath, `r, , all
; Change working directory
SetWorkingDir, %FullPath%
; 执行cmd
; run, %comspec% ;
; run, %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat" ;
run, %comspec% 
return
;}}};
; F3 : 使用vim编辑;;{{{;
F3::
send {RButton}Z
return
;}}};
; Alt + n : 新建文件并编辑;{{{;
!n::
CreateFile(dir, filename)
if (filename = "")
{
    return
}
Run %Config_Editor%  "%filename%", %dir%
; path := Explorer_GetPath() ;
; all := Explorer_GetAll() ;
; sel := Explorer_GetSelected() ;
; MsgBox % path ;
; MsgBox % all ;
; MsgBox % sel ;
Return
;}}};
; Ctrl + Alt + n : 新建文件;{{{;
^!n::
CreateFile(dir, filename)
Return
;}}};
#IfWinActive
