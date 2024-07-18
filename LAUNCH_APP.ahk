#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
OnExit("ExitFunc")

GLOBAL configfile := "config.cfg"
GLOBAL config_path := A_ScriptDir . "\" . configfile

IniRead, UACElevate, %config_path%, DEBUG, RunAsAdministrator, 0
If(UACElevate="1")
{
;                         {[
;;           ELEVATE TO ADMIN UAC PROMPT BELOW
; If the script is not elevated, relaunch as administrator and kill current instance:
 
full_command_line := DllCall("GetCommandLine", "str")
 
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
;
;                          ]}
}


IniRead, OverseeApp, %config_path%, SWITCHES, OverseeApplicationExit, 1
GLOBAL doOverseeApp := OverseeApp

IniRead, AppExe, %config_path%, CONFIG, ApplicationExecutable,
IniRead, AppDir, %config_path%, CONFIG, ApplicationDirectory,
GLOBAL CurrentAppExe := AppExe
GLOBAL CurrentAppDir := AppDir
GLOBAL CurrentApp := AppDir . "\" . AppExe

IniRead, ExitExe001, %config_path%, OVERSEER, ExitExecutable1,
IniRead, ExitExe002, %config_path%, OVERSEER, ExitExecutable2,
IniRead, ExitExe003, %config_path%, OVERSEER, ExitExecutable3,
GLOBAL AppToExit001 := ExitExe001
GLOBAL AppToExit002 := ExitExe002
GLOBAL AppToExit003 := ExitExe003


Run, %CurrentApp%


If(doOverseeApp="1")
{
    Process, WaitClose, %CurrentAppExe%
    Process, Close, %AppToExit001%
    Process, Close, %AppToExit001%
    Process, Close, %AppToExit001%
    Process, Close, %AppToExit001%
    Process, Close, %AppToExit001%
    Process, Close, %AppToExit001%
    Process, Close, %AppToExit001%
    Process, Close, %AppToExit001%
    Process, Close, %AppToExit001%

    Process, Close, %AppToExit002%
    Process, Close, %AppToExit002%
    Process, Close, %AppToExit002%
    Process, Close, %AppToExit002%
    Process, Close, %AppToExit002%
    Process, Close, %AppToExit002%
    Process, Close, %AppToExit002%
    Process, Close, %AppToExit002%
    Process, Close, %AppToExit002%

    Process, Close, %AppToExit003%
    Process, Close, %AppToExit003%
    Process, Close, %AppToExit003%
    Process, Close, %AppToExit003%
    Process, Close, %AppToExit003%
    Process, Close, %AppToExit003%
    Process, Close, %AppToExit003%
    Process, Close, %AppToExit003%
    Process, Close, %AppToExit003%

}






ExitApp

ExitFunc(ExitReason, ExitCode)
{
    ExitApp
}
; ExitFunc(ExitReason, ExitCode)
; {
;     if ExitReason not in Logoff,Shutdown  ; Avoid spaces around the comma.
;     {
;         MsgBox, 4, , Are you sure you want to exit?
;         IfMsgBox, No
;             return 1  ; Callbacks must return non-zero to avoid exit.
;     }
;     ; Do not call ExitApp -- that would prevent other callbacks from being called.
; }

