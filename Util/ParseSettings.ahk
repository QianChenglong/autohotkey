; MsgBox, loading config %A_ScriptDir%\config.ini ;

FileRead, ini, %A_ScriptDir%\config.ini
If ErrorLevel
{
    MsgBox load config error:%A_ScriptDir%\config.ini
    Exit
}

; MsgBox, load config success ;
Config := [] ; 什么类型？

; Settings.ScriptName := (ini_getValue(ini, "Settings", "ScriptName") = "") ? A_ScriptName : ini_getValue(ini, "Settings", "ScriptName") ;
Config_StartupNotification := ini_getValue(ini, "Global", "StartupNotification")
Config_Editor := ini_getValue(ini, "Global", "Editor")

Config_Vim := ini_getValue(ini, "App", "Vim")
Config_Chrome := ini_getValue(ini, "App", "Chrome")
Config_EveryThing := ini_getValue(ini, "App", "EveryThing")
Config_Dictionary := ini_getValue(ini, "App", "Dictionary")
Config_Procexp := ini_getValue(ini, "App", "Procexp")
Config_Xmind := ini_getValue(ini, "App", "Xmind")
Config_FileLocator := ini_getValue(ini, "App", "FileLocator")
Config_XunLei := ini_getValue(ini, "App", "XunLei")
