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
        Return
    ; Display input box for filename
    InputBox, filename, ����Ҫ�������ļ���, , , 200, 100
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
