;; traverse(ahk_class_name);{{{;;
;; 功能：遍历同一个程序的多个实例;
;; 参数：要遍历的程序的ahk_class名;
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
;            ; 当前要激活的ID;
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
; 获取当前选中内容
GetSelectText()
{
    tmp = %ClipBoard% ; 保存原来内容
    ClipBoard = ; 清空粘贴板
    Send, ^c ; 获取当前选中内容
    Sleep, 100 ; 确保操作成功
    text = %ClipBoard%
    ClipBoard = %cmp% ; 复原
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
    FullPath := RegExReplace(FullPath, "(^地址: )", "")
    msgbox %FullPath%
    ; StringReplace, FullPath, FullPath, `r, , all ;
    ; Change working directory
    ; SetWorkingDir, %FullPath% ;
    ; An error occurred with the SetWorkingDir directive
    ; If ErrorLevel ;
    ;     Exit ;
    ; InputBox, filename, 重命名, , , 200, 100 ;
    ; filename := FullPath . "/" . filename ;
    ; msgbox %filename% ;
    ; User pressed cancel
    ; If ErrorLevel ;
    ;     Exit ;
}
;}}};
; CreateFile(){{{;
; 创建文件
; dir [out] 文件目录
; filename [out] 文件名
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
    FullPath := RegExReplace(FullPath, "(^地址: )", "")
    ; msgbox %FullPath% ;
    StringReplace, FullPath, FullPath, `r, , all
    ; Change working directory
    ; SetWorkingDir, %FullPath% ;
    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
        Return
    ; Display input box for filename
    InputBox, filename, 输入要创建的文件名, , , 200, 100
    ; msgbox %filename% ;
    ; User pressed cancel
    If ErrorLevel
    {
        filename := ""
        Return
    }
    filename := FullPath . "/" . filename
    ; Create file
    FileAppend , , %filename%

    dir := FullPath
}
;}}};
