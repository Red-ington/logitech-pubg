#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

;   _____ _____ _____ __    _____                      
;  |  _  |  |  | __  |  |  |   __|  PUBG RECOIL MACRO  
;  |   __|  |  | __ -|  |__|  |  |  FOR LOGITECH MICE + KB
;  |__|  |_____|_____|_____|_____|

; INSTRUCTIONS:
; Under the Key Bindings section enter in the custom birngings you are using for weapons
; These should be they keys your mouse is pressing (Not the mouse buttons themslves)
; Then enter these again in the first function in HUD Display so they match up with the guns



CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s16  ; Set a large font size (32-point).
Gui, Add, Text, vMyText cLime, SELECT WPN... ; XX & YY serve to auto-size the window.
WinSet, TransColor, %CustomColor% 150;
Gui, Show, x0 y400 NoActivate  ; NoActivate avoids deactivating the currently active window.

stateLabel(){
  GetKeyState, ScrlLck, ScrollLock, T

  if ( ScrlLck == "D" ) {
   GetKeyState, CapLck, CapsLock, T
     if ( CapLck == "D" ) {
     Return  ":D"
    }
    Return ":)"
  }   
  Return ":("
}

;---------------------------------------------------
;Key Bindings
;---------------------------------------------------
						
!Numpad7::
!Numpad9::
!Numpad5::
!Numpad8::
!Numpad1::
!Numpad2::
!Numpad3::
Global SelectedOption
  SelectedOption=%A_ThisHotkey%
 ;msgbox a+ %SelectedOption%
  updateLabel()
Return

~CapsLock::
~ScrollLock::
  updateLabel()
Return

;---------------------------------------------------
; HUD Display
;---------------------------------------------------

gunLabel(){
;msgbox "%SelectedOption%"
Return {"!Numpad9":"UZI","!Numpad7":"SCAR","!Numpad5":"M16A","!Numpad8":"AKM","!Numpad1":"M416","!Numpad2":"UMP9","!Numpad3":"OFF"}[SelectedOption]
}

updateLabel(){
;msgbox b + %SelectedOption%
 GuiControl,, MyText, %  gunLabel() stateLabel()
}
