#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Includes\Icon.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include-once
#include "Includes\ImageSearch.au3"
#include <GDIPlus.au3>
#include <Misc.au3>
ProcessSetPriority(@ScriptName, 3)
ProcessSetPriority("AutoIt3.exe", 3)
_Singleton("JustAsk")
_GDIPlus_Startup()
Opt("MouseCoordMode", 1)
Opt("PixelCoordMode", 2)
Opt("TrayIconDebug", 1)
Opt("MouseClickDelay", 30)
Opt("MouseClickDownDelay", 30)
Opt("SendKeyDelay", 30)
Opt("SendKeydownDelay", 30)
Opt("WinTitleMatchMode", 3)
DirCreate(@TempDir & "\BetaLeaf Software\JustAsk\")
FileChangeDir(@TempDir & "\BetaLeaf Software\JustAsk")
FileInstall("Includes\ImageSearchDLL.dll", @TempDir & "\BetaLeaf Software\JustAsk\ImageSearchDLL.dll", 1)
FileInstall("Includes\ImageSearch.au3", @TempDir & "\BetaLeaf Software\JustAsk\ImageSearch.au3", 1)
FileInstall("Images\bless.png", @TempDir & "\BetaLeaf Software\JustAsk\bless.png", 1)
FileInstall("Images\commands.png", @TempDir & "\BetaLeaf Software\JustAsk\commands.png", 1)
FileInstall("Images\dispel.png", @TempDir & "\BetaLeaf Software\JustAsk\dispel.png", 1)
FileInstall("Images\door.png", @TempDir & "\BetaLeaf Software\JustAsk\door.png", 1)
FileInstall("Images\Fix100.png", @TempDir & "\BetaLeaf Software\JustAsk\Fix100.png", 1)
FileInstall("Images\fountain.png", @TempDir & "\BetaLeaf Software\JustAsk\fountain.png", 1)
FileInstall("Images\genesis.png", @TempDir & "\BetaLeaf Software\JustAsk\genesis.png", 1)
FileInstall("Images\heal.png", @TempDir & "\BetaLeaf Software\JustAsk\heal.png", 1)
FileInstall("Images\hs.png", @TempDir & "\BetaLeaf Software\JustAsk\hs.png", 1)
FileInstall("Images\maplewarrior.png", @TempDir & "\BetaLeaf Software\JustAsk\maplewarrior.png", 1)
FileInstall("Images\mw.png", @TempDir & "\BetaLeaf Software\JustAsk\mw.png", 1)
FileInstall("Images\revive.png", @TempDir & "\BetaLeaf Software\JustAsk\revive.png", 1)
FileInstall("Images\shell.png", @TempDir & "\BetaLeaf Software\JustAsk\shell.png", 1)
FileInstall("Images\heaven.png", @TempDir & "\BetaLeaf Software\JustAsk\heaven.png", 1)
FileInstall("Images\partyaccept.png", @TempDir & "\BetaLeaf Software\JustAsk\partyaccept.png", 1)
FileInstall("Images\partyinvite.png", @TempDir & "\BetaLeaf Software\JustAsk\partyinvite.png", 1)
FileInstall("Images\leaveparty.png", @TempDir & "\BetaLeaf Software\JustAsk\leaveparty.png", 1)

FileInstall("Images\bless_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\bless_xp.png", 1)
FileInstall("Images\commands_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\commands_xp.png", 1)
FileInstall("Images\dispel_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\dispel_xp.png", 1)
FileInstall("Images\door_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\door_xp.png", 1)
FileInstall("Images\Fix100_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\Fix100_xp.png", 1)
FileInstall("Images\fountain_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\fountain_xp.png", 1)
FileInstall("Images\genesis_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\genesis_xp.png", 1)
FileInstall("Images\heal_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\heal_xp.png", 1)
FileInstall("Images\hs_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\hs_xp.png", 1)
FileInstall("Images\maplewarrior_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\maplewarrior_xp.png", 1)
FileInstall("Images\mw_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\mw_xp.png", 1)
FileInstall("Images\revive_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\revive_xp.png", 1)
FileInstall("Images\shell_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\shell_xp.png", 1)
FileInstall("Images\heaven_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\heaven_xp.png", 1)
FileInstall("Images\partyaccept_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\partyaccept_xp.png", 1)
FileInstall("Images\partyinvite_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\partyinvite_xp.png", 1)
FileInstall("Images\leaveparty_xp.png", @TempDir & "\BetaLeaf Software\JustAsk\leaveparty_xp.png", 1)
FileInstall("JustAsk.ini", @ScriptDir & "\JustAsk.ini", 0)
If @OSVersion = "WIN_XP" Then
	Global $ifxp = "_xp"
Else
	Global $ifxp = ""
EndIf
IniWrite("log.txt", "Log", "File", @TempDir & "\BetaLeaf Software\JustAsk\hs" & $ifxp & ".png")
Global $hwnd = WinWait("MapleStory")
Global $hwndpos = WinGetPos("MapleStory")
Global $nocd, $IsOnChair = 1, $iX, $iY, $iTimer, $sTimerCommand
Global $iLeft = $hwndpos[0]
Global $iTop = $hwndpos[1]
Global $iRight = $hwndpos[2] + $hwndpos[0]
Global $iBottom = $hwndpos[3] + $hwndpos[1]
Global $hs = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "hs", "{space}")
Global $door = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "door", "`")
Global $bless = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "bless", "d")
Global $shell = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "shell", "{ins}")
Global $mw = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "maplewarrior", "o")
Global $heal = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "Heal", "{pgdn}")
Global $revive = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "revive", "v")
Global $genesis = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "genesis", "c")
Global $dispel = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "dispel", "{end}")
Global $fountain = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "fountain", "{pgup}")
Global $heaven = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "heavensdoor", "a")
Global $sit = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "sit", "t")
Global $partychat = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "PartyChat", "3")
Global $resetkey = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "FixDetection", "{f7}")
Global $quit = IniRead(@ScriptDir & "\JustAsk.ini", "keys", "quit", "^{escape}")
Global $Logging = IniRead(@ScriptDir & "\JustAsk.ini", "Settings", "Logging", True)
Global $commands = _
		[ _
		["HolySymbol", $hs], _
		["Door", $door], _
		["Bless", $bless], _
		["Shell", $shell], _
		["MapleWarrior", $mw], _
		["Heal", $heal], _
		["Revive", $revive], _
		["Genesis", $genesis], _
		["Dispel", $dispel], _
		["Fountain", $fountain], _
		["Heaven", $heaven], _
		["PartyInvite", "partyinvite"], _
		["LeaveParty", "leaveparty"], _
		["Commands", "commands"], _
		["Fix100", "reset"]]
If $sit = "off" Then $IsOnChair = 0
HotKeySet($quit, "_exit")
HotKeySet($resetkey, "GetMapleWin")
WinActivate("MapleStory")
idle()
Func idle()
	While 1
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\hs" & $ifxp & ".png", $hs)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\bless" & $ifxp & ".png", $bless)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\door" & $ifxp & ".png", $door)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\heal" & $ifxp & ".png", $heal)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\shell" & $ifxp & ".png", $shell)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\mw" & $ifxp & ".png", $mw)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\maplewarrior" & $ifxp & ".png", $mw)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\revive" & $ifxp & ".png", $revive)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\genesis" & $ifxp & ".png", $genesis)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\fountain" & $ifxp & ".png", $fountain)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\dispel" & $ifxp & ".png", $dispel)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\heaven" & $ifxp & ".png", $heaven)
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\fix100" & $ifxp & ".png", "reset")
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\commands" & $ifxp & ".png", "commands")
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\leaveparty" & $ifxp & ".png", "leaveparty")
		_FindImage(@TempDir & "\BetaLeaf Software\JustAsk\partyinvite" & $ifxp & ".png", "partyinvite")
	WEnd
EndFunc   ;==>idle
Func _FindImage($sImgPath, $command) ;the function that searches
	Sleep(1000 / @DesktopRefresh * 2)
	_GDIPlus_Startup()
	Local $hImage = _GDIPlus_ImageLoadFromFile($sImgPath)
	Local $hHBmp = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
	Local $iRet = _ImageSearchArea($hHBmp, 1, $iLeft, $iTop, $iRight, $iBottom, $iX, $iY, 5, 0)
	_WinAPI_DeleteObject($hHBmp)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()
	If $iRet = 1 Then
		If $Logging = True Then
			For $i = 0 To UBound($commands) - 1
				If $commands[$i][1] = $command Then $currentcommand = $i
			Next
			$Log = IniRead(@ScriptDir & "\JustAsk.log", "Logging", $commands[$currentcommand][0], 0)
			IniWrite(@ScriptDir & "\JustAsk.log", "Logging", $commands[$currentcommand][0], $Log + 1)
		EndIf
		If $sTimerCommand = $command Then
			If TimerDiff($iTimer) < 5500 Then Return 2
		EndIf
		If $command = "reset" Then
			Reset($command)
			$iTimer = TimerInit()
			$sTimerCommand = $command
			Return 1
		EndIf
		If $command = "commands" Then
			commands()
			$iTimer = TimerInit()
			$sTimerCommand = $command
			Return 1
		EndIf
		If $command = "leaveparty" Then
			leaveparty()
			$iTimer = TimerInit()
			$sTimerCommand = $command
			Return 1
		EndIf
		If $command = "partyinvite" Then
			partyinvite()
			$iTimer = TimerInit()
			$sTimerCommand = $command
			Return 1
		EndIf
		If Not $command = "" Then
			FixFocus()
			If $IsOnChair = 1 Then UnmountChair()
			ControlSend("MapleStory", "", "", $command)
			If $IsOnChair = 1 Then mountChair($command)
		EndIf
		;If $IsOnChair = 1 Then Sleep(Random(1500, 1800))
		$iTimer = TimerInit()
		$sTimerCommand = $command
		Return 1
	EndIf
EndFunc   ;==>_FindImage
Func FixFocus()
	ControlSend("MapleStory", "", "", "{esc}")
	Sleep(30)
	ControlSend("MapleStory", "", "", "{esc}")
	Sleep(30)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(30)
	ControlSend("MapleStory", "", "", "{esc}")
	Sleep(200)
EndFunc   ;==>FixFocus
Func UnmountChair()
	ControlSend("MapleStory", "", "", "{lalt down}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{lalt up}")
	Sleep(Random(1000, 1200))
EndFunc   ;==>UnmountChair
Func mountChair($command)
	If Not $IsOnChair = 1 Then Return
	Sleep(Random(1000, 1200))
	If $command = $heal Then Sleep(4500)
	If $command = $genesis Then Sleep(4500)
	ControlSend("MapleStory", "", "", $sit)
	Sleep(Random(1000, 1200))
EndFunc   ;==>mountChair
Func _exit()
	Exit
EndFunc   ;==>_exit
Func Reset($command)
	FixFocus()
	If $IsOnChair = 1 Then UnmountChair()
	ControlSend("MapleStory", "", "", "{ins}")
	Sleep(1500)
	ControlSend("MapleStory", "", "", "{`}")
	Sleep(1500)
	ControlSend("MapleStory", "", "", "{up}")
	Sleep(10000)
	ControlSend("MapleStory", "", "", "{up}")
	Sleep(10000)
	If $IsOnChair = 1 Then mountChair($command)
EndFunc   ;==>Reset
Func GetMapleWin()
	$hwndpos = WinGetPos("MapleStory")
	$iLeft = $hwndpos[0]
	$iTop = $hwndpos[1]
	$iRight = $hwndpos[2] + $hwndpos[0]
	$iBottom = $hwndpos[3] + $hwndpos[1]
EndFunc   ;==>GetMapleWin
Func commands()
	FixFocus()
	ControlSend("MapleStory", "", "", $partychat)
	Sleep(500)
	Local $clipstorage = ClipGet()
	ClipPut("Party Commands: hs, bless, dispel, door, fountain, heal, heaven")
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut("genesis, maplewarrior, mw, revive, shell, fix100, commands.")
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut('The command "fix100" will fix buffs not being applied.')
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut('Party Commands must be sent in party chat and in lowercase.')
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut('===')
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut("Party Management Commands: partyinvite, leaveparty.")
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut('The command "partyinvite" will accept a request to join a party.')
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut('The command "leaveparty" will make me leave the party.')
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut('Party Management Commands only work in all chat with no quote')
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ClipPut("rings & must be in all lowercase. Used to gain control of a dead party")
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(5500)
	ClipPut($clipstorage)
EndFunc   ;==>commands
Func partyinvite()
	_GDIPlus_Startup()
	Local $hImage = _GDIPlus_ImageLoadFromFile(@TempDir & "\BetaLeaf Software\JustAsk\partyaccept.png")
	Local $hHBmp = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
	Local $iRet = _ImageSearchArea($hHBmp, 1, $iLeft, $iTop, $iRight, $iBottom, $iX, $iY, 5, 0)
	_WinAPI_DeleteObject($hHBmp)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()
	If $iRet = 1 Then
		WinActivate("MapleStory")
		MouseClick("Left", $iX, $iY, 1, 0)
	EndIf
	Sleep(1000)
EndFunc   ;==>partyinvite
Func leaveparty()
	FixFocus()
	Local $clipstorage = ClipGet()
	ClipPut("/leaveparty")
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "+{ins}")
	Sleep(100)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(900)
	ControlSend("MapleStory", "", "", "{enter}")
	Sleep(5500)
	ClipPut($clipstorage)
EndFunc   ;==>leaveparty
