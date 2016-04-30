; 参考：
; https://github.com/denolfe/AutoHotkey-Boilerplate
; https://github.com/denolfe/AutoHotkey

#NoEnv
#WinActivateForce
#SingleInstance force
#Persistent


; 自动执行部分，直至遇到 Return, Exit, 热键/热字符串标签或者脚本的底部(无论最先遇到哪个)
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; init module
#Include Lib ; explicit load
#Include %A_ScriptDir%\Util\Init.ahk
#Include %A_ScriptDir%\App\Init.ahk


If (Config.StartupNotification)
    Notify(Settings.ScriptName " Started",,-3,"Style=StandardGray")

