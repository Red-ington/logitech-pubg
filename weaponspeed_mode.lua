---/========================================================================\---
---       _____ _____ _____ __    _____                                      ---
---      |  _  |  |  | __  |  |  |   __|  PUBG RECOIL MACRO                  ---
---      |   __|  |  | __ -|  |__|  |  |  FOR LOGITECH MICE + KB             ---
---      |__|  |_____|_____|_____|_____|  CREDS TO LIANTIA + MINGLICH        ---
---                                                                          ---
---\========================================================================/---

---/========================================================================\---
---                               C O N F I G                                ---
---\========================================================================/---

--------------------------------------------------------------------------------
--- BUTTON ASSIGNMENT ----------------------------------------------------------
--------------------------------------------------------------------------------

--- The values here correspond to the button numbersd on your mouse. In order to
--- determine the button numbners run the script in the scrpting window and read
--- the console output. Pressing a mouse button/G-Key will print it's number.

---- Mouse Buttons ----
local ump9_key = 4
local akm_key = 5
local m16a4_key = 6
local m416_key = 7
local scarl_key = 8
local uzi_key = nil
local off_key = 10 --- Important: Make sure you have an off button assigned

---- Keyboard ----
--- If you have a Logitech keyboard you can use the G-Keys as well. Enter
--- the G-Key numbers below
local akm_gkey = nil
local m16a4_gkey = nil
local m416_gkey = nil
local scarl_gkey = nil
local uzi_gkey = nil
local set_off_gkey = nil

--------------------------------------------------------------------------------
--- KEY BINDINGS ---------------------------------------------------------------
--------------------------------------------------------------------------------

--- You need to set a custom fire key in the game settings (not left click). You 
--- can pick a more unique key like home, insert, etc or use the default.
local fire_key = "f8" --- Must match in game setings

---- Modifier Keys  ----
--- "lalt", "ralt", "alt"  "lshift", "rshift", "shift"  "lctrl", "rctrl", "ctrl"
local ignore_key = "lctrl" --- Disables the script while held down
local control_key = "lalt" --- Used for fastloot
local hold_breath_key = "lshift" --- Must match your in-game settings
local select_key = "alt" --- Optional: modifier key for weapon selection

---  "numlock", "capslock", or "scrolllock"
local full_mode_key = "capslock"   -- lights up when entering full mode
local active_key = "scrolllock"  --- lights up when the script is active

--------------------------------------------------------------------------------
--- SENSITIVITY ----------------------------------------------------------------
--------------------------------------------------------------------------------

--- These settings must match up with your in game settings in order for
--- the recoil to be calculatedd correctly.
local vertical_sensitivity = 0.7 --- default is 0.7
local target_sensitivity = 50 --- default is 50.0
local scope_sensitivity = 50 --- default is 50.0
local scope4x_sensitivity = 50 --- default is 50.0

--------------------------------------------------------------------------------
--- MISC SETTINGS --------------------------------------------------------------
--------------------------------------------------------------------------------

local hold_breath_mode = true
local full_mode = true

--- fastloot setting---
local fastloot = true --- True or False
local move = 40 --- Adjust this value if not running 1920*1080

local obfuscate = true
local interval_ratio = 0.75
local random_seed = 0.5
local auto_reloading = true

---/========================================================================\---
---                         R E C O I L  T A B L E                           ---
---\========================================================================/---

--- To adjust the recoil control you can alter all_recoil_times to affect all 
--- values or modify the _____times values individually.

--- The recoil data will need to be updated whenever recoil is adjusted by a
--- new patch. You can find these values under the game install directory in
--- a file called TslGame-WindowsNoEditor_objects.pak, using UE Editor look for
--- Content\Blueprints\Weapons\WeaponConfig

local all_recoil_times = 1
local recoil_data = {}

recoil_data["akm"] = {
  basic={56,41,42,46,48, 58,58.5,62,64,67, 68,71,70,74.4,77, 74},
  basictimes = 1.04,
  full={56,41,42,46,48, 58,58.5,64,68,68, 70,71,70,74.4,77, 74},
  fulltimes = 1.04*0.75,
  quadruple={56,41,42,46,48, 58,58.5,64,68,68, 70,71,70,74.4,77, 74},
  quadrupletimes = 4*1.04,
  fullof4x={56,41,42,46,48, 58,58.5,64,68,68, 70,71,70,74.4,77, 74},
  fullof4xtimes = 4*1.04*0.75,
  speed = 100,
  maxbullets = 40,
  holdbreathtimes = 1.25,
  fullholdbreathtimes = 1.25,
}

recoil_data["m416"] = {
  basic={41,30,33,36,41, 40,46,47,45.6,46.5, 47.5,46.5,49.2,52.2,53.1, 53},
  basictimes = 1.08,
  full={41,30,33,36,41, 40,46,47,45.6,46.5, 47.5,46.5,49.2,52.2,53.1, 53},
  fulltimes = 1.08*0.75,
  quadruple={41,30,33,36,41, 40,46,47,45.6,46.5, 47.5,46.5,49.2,52.2,53.1, 53},
  quadrupletimes = 4*1.08*0.9,
  fullof4x={41,30,33,36,41, 40,46,47,45.6,46.5, 47.5,46.5,49.2,52.2,53.1, 53},
  fullof4xtimes = 4*1.08*0.75,
  speed = 89.98,
  maxbullets = 40,
  holdbreathtimes = 1.25,
  fullholdbreathtimes = 1.25,
}

recoil_data["scarl"] = {
  basic={40,25,31.5,39.6,39.6,41.4,42.3,42.3,43.2,48.6,50.4,52.2,54,52.2,55,55},
  basictimes = 1,
  full={40,25,31.5,39.6,39.6,41.4,42.3,42.3,43.2,48.6,50.4,52.2,54,52.2,55,55},
  fulltimes = 1*0.75,
  quadruple={40,25,31.5,39.6,39.6,41.4,42.3,42.3,43.2,48.6,50.4,52.2,54,52.2,55,55},
  quadrupletimes = 4*1,
  fullof4x={40,25,31.5,39.6,39.6,41.4,42.3,42.3,43.2,48.6,50.4,52.2,54,52.2,55,55},
  fullof4xtimes = 4*1*0.75,
  speed = 96,
  maxbullets = 40,
  holdbreathtimes = 1.25,
  fullholdbreathtimes = 1.25,
}

recoil_data["ump9"] = {
  basic={30,31,32,34,37, 35,35,36,42,38, 39,42,42,41,41, 41,41,42,42,42, 43,40,41,43,40, 40,40,41,42},
  basictimes = 1,
  full={30,31,32,34,37, 35,35,36,42,38, 39,42,42,41,41, 41,41,42,44,42, 43,40,41,44,40, 40,41,42,43},
  fulltimes = 0.75*0.9,
  quadruple={30,31,32,34,37, 35,35,36,42,38, 39,42,42,41,41, 41,41,42,44,42, 43,40,41,44,40, 40,41,42,43},
  quadrupletimes = 4*1*0.97,
  fullof4x={30,31,32,34,37, 35,35,36,42,38, 39,42,42,41,41, 41,41,42,44,42, 43,40,41,44,40, 40,41,42,43},
  fullof4xtimes = 4*0.75,
  speed = 92,
  maxbullets = 40,
  holdbreathtimes = 1.25,
  fullholdbreathtimes = 1.25,
}

recoil_data["uzi"] = {
  basic={8.5,8.5,9,9,9,10.5,10.5,10.5,12,13,13,14.5,15.5,16,17.5,18.5,19,19.5,19,19.5,19,19,19.5,20},
  basictimes = 2,
  full={4.8,4.8,5,5,5,6,6,6,6.2,6.8,6.8,7.6,7.6,7.9,8.2,8.2,8.2,8.7,8.7,9,9.5,9.5,9.6,9.6},
  fulltimes = 2,
  quadruple={8.5,8.5,9,9,9,10.5,10.5,10.5,12,13,13,14.5,15.5,16,17.5,18.5,19,19.5,19,19.5,19,19,19.5,20},
  quadrupletimes = 2,
  fullof4x={4.8,4.8,5,5,5,6,6,6,6.2,6.8,6.8,7.6,7.6,7.9,8.2,8.2,8.2,8.7,8.7,9,9.5,9.5,9.6,9.6},
  fullof4xtimes = 2,
  speed = 48,
  maxbullets = 35,
  holdbreathtimes = 1.25,
  fullholdbreathtimes = 1.25,
}

recoil_data["m16a4"] = {
  basic={42.3,31.2,32.4,42.3,50.4, 54.1,62.1,60,62.5,65.5, 63,62.1,64.4,64.4,65.25,63.9},
  basictimes = 1.23,
  full={42.3,31.2,32.4,42.3,50.4,54.1,62.1,60,62.5,65.5,63,62.1,64.4,64.4,65.25,63.9},
  fulltimes = 1.23*0.77,
  quadruple={42.3,31.2,32.4,42.3,50.4,54.1,62.1,60,62.5,65.5,63,62.1,64.4,64.4,65.25,63.9},
  quadrupletimes = 1.23*4,
  fullof4x={42.3,31.2,32.4,42.3,50.4,54.1,62.1,60,62.5,65.5,63,62.1,64.4,64.4,65.25,63.9},
  fullof4xtimes = 4*1.23*0.75,
  speed = 80,
  maxbullets = 40,
  clickspeed = 40,
  holdbreathtimes = 1.25,
  fullholdbreathtimes = 1.25,
}


recoil_data["none"] = {
  basic={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  basictimes = 1,
  full={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  fulltimes = 1,
  quadruple={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  quadrupletimes = 1,
  fullof4x={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  fullof4xtimes = 1,
  speed = 30,
  maxbullets = 40,
  clickspeed = 40,
  holdbreathtimes = 1.25,
  fullholdbreathtimes = 1.25,
}

---/========================================================================\---
---                       I N T E R N A L  L O G I C                         ---
---\========================================================================/---


function convert_sens(unconvertedSens)
  return 0.002 * math.pow(10, unconvertedSens / 50)
end

function calc_sens_scale(sensitivity)
  return convert_sens(sensitivity)/convert_sens(50)
end

local target_scale = calc_sens_scale(target_sensitivity)
local scope_scale = calc_sens_scale(scope_sensitivity)
local scope4x_scale = calc_sens_scale(scope4x_sensitivity)

function recoil_mode()
  if full_mode and IsKeyLockOn(full_mode_key) then
    return "full";
  else
      return "basic";
  end
end

function recoil_value(_weapon,_duration)
  local _mode = recoil_mode()
  local step = (math.floor(_duration/recoil_data[_weapon]["speed"])) + 1

  if step > #recoil_data[_weapon][_mode] then
    step = #recoil_data[_weapon][_mode]
  end
  
  local weapoon = recoil_data[_weapon]
  local weapon_recoil = weapoon[_mode][step]
  local weapon_speed = weapoon.speed
  local weapon_clickspeed = weapoon.clickspeed
  local weapon_maxbullets = weapoon.maxbullets
  local weapon_basictimes = weapoon.basictimes
  local weapon_fulltimes = weapoon.fulltimes
  local weapon_quadrupletimes = weapoon.quadrupletimes
  local weapon_fullof4xtimes = weapoon.fullof4xtimes
  local weapon_holdbreathtimes = weapoon.holdbreathtimes
  local weapon_fullofholdbreathtimes = weapoon.fullholdbreathtimes
  local weapon_intervals = weapon_speed
  local weapon_clicktime = weapon_clickspeed
  local weapon_bullets = weapon_maxbullets

  if obfuscate then
    local coefficient = interval_ratio * ( 1 + random_seed * math.random())
    weapon_intervals = math.floor(coefficient  * weapon_speed)
  end

  -- OutputLogMessage("weapon_intervals = %s\n", weapon_intervals)
  recoil_recovery = weapon_recoil
  recoil_times = all_recoil_times * 0.7 / vertical_sensitivity

  if recoil_mode() == "basic" and not IsModifierPressed(hold_breath_key) then
    recoil_recovery = recoil_recovery * recoil_times * weapon_basictimes
  end

  if recoil_mode() == "basic" and hold_breath_mode and IsModifierPressed(hold_breath_key) then
    recoil_recovery = recoil_recovery * weapon_holdbreathtimes * recoil_times * weapon_basictimes
  end

  if recoil_mode() == "full" and not IsModifierPressed(hold_breath_key) then
    recoil_recovery = recoil_recovery * recoil_times * weapon_fulltimes
  end

  if recoil_mode() == "full" and hold_breath_mode and IsModifierPressed(hold_breath_key) then
    recoil_recovery = recoil_recovery * weapon_fullofholdbreathtimes * recoil_times * weapon_fulltimes
  end

  if recoil_mode() == "quadruple" then
    recoil_recovery = recoil_recovery * recoil_times * weapon_quadrupletimes
  end

  if recoil_mode() == "fullof4x" then
    recoil_recovery = recoil_recovery * recoil_times * weapon_fullof4xtimes
  end

  -- issues/3
  if IsMouseButtonPressed(2) then
    recoil_recovery = recoil_recovery / target_scale
  elseif recoil_mode() == "basic" then
    recoil_recovery = recoil_recovery / scope_scale
  elseif recoil_mode()  == "full" then
    recoil_recovery = recoil_recovery / scope_scale
  elseif recoil_mode() == "quadruple" then
    recoil_recovery = recoil_recovery / scope4x_scale
  elseif recoil_mode() == "fullof4x" then
    recoil_recovery = recoil_recovery / scope4x_scale
  end

  return weapon_intervals,recoil_recovery,weapon_clicktime,weapon_bullets
end



---/========================================================================\---
---                            E V E N T L O O P                             ---
---\========================================================================/---


function OnEvent(event, arg)

  function isActivating(button, key)
    if (event == "MOUSE_BUTTON_PRESSED" and arg == button and IsModifierPressed(select_key))
    or (event == "G_PRESSED" and arg == key) then
      return true
    end
    return false
  end

  OutputLogMessage("event = %s, arg = %d\n", event, arg)

  --- Profile actvation
  if (event == "PROFILE_ACTIVATED") then
    EnablePrimaryMouseButtonEvents(true)
    current_weapon = "none"
    shoot_duration = 0.0
    if IsKeyLockOn(active_key) then 
      PressAndReleaseKey(active_key)
    elseif IsKeyLockOn(full_mode_key) then 
      PressAndReleaseKey(full_mode_key) 
    end
  elseif event == "PROFILE_DEACTIVATED" then
    ReleaseKey(fire_key)
  end

  --- Weapon selection
  if isActivating(off_key, set_off_gkey) then current_weapon = "none"
  elseif isActivating(akm_key, akm_gkey) then current_weapon = "akm"
  elseif isActivating(m16a4_key, m16a4_gkey) then current_weapon = "m16a4"
  elseif isActivating(m416_key, m416_gkey) then current_weapon = "m416"
  elseif isActivating(ump9_key, ump9_gkey) then current_weapon = "ump9"
  elseif isActivating(uzi_key, uzi_gkey) then current_weapon = "uzi"
  elseif isActivating(scarl_key, scarl_gkey) then current_weapon = "scarl"

  --- Left click (fire)
  elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
    if ((current_weapon == "none") or IsModifierPressed(ignore_key)) then
      OutputLogMessage("ignore = %s\n", current_weapon)      
      PressKey(fire_key)
      repeat
        Sleep(30)
      until not IsMouseButtonPressed(1)
      ReleaseKey(fire_key)
    elseif(current_weapon == "m16a4") then
      OutputLogMessage("m16 = %s\n", current_weapon)
      ReleaseMouseButton(1)
      local shoot_duration = 0.0
      repeat
        local intervals,recovery,clicktime,bullets = recoil_value(current_weapon,shoot_duration)
        if shoot_duration % clicktime == 0 then 
          PressAndReleaseKey(fire_key)
        end

        MoveMouseRelative(0, recovery / 10)
        Sleep(intervals/10)
        shoot_duration = shoot_duration + (intervals/10)

        if auto_reloading then
          if shoot_duration > (intervals * bullets) + 100 then
            ReleaseKey(fire_key)
            PressAndReleaseKey("r")
            Sleep(200)
          end
        end
      until not IsMouseButtonPressed(1)
    else
  OutputLogMessage("current_weapon = %s\n", current_weapon)
      ReleaseMouseButton(1)
      PressKey(fire_key)
      local shoot_duration = 0.0
      repeat
        local intervals,recovery,clicktime,bullets = recoil_value(current_weapon,shoot_duration)

        MoveMouseRelative(0, recovery /10 )
        Sleep(intervals/10)
        shoot_duration = shoot_duration + (intervals/10)

        if auto_reloading then
          if shoot_duration > (intervals * bullets) + 100 then
            ReleaseKey(fire_key)
            PressAndReleaseKey("r")
            Sleep(200)
          end
        end
      until not IsMouseButtonPressed(1)
      ReleaseKey(fire_key)
    end
  --- Cleanup
  elseif (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
  OutputLogMessage("rls = %s\n", current_weapon)
    ReleaseKey(fire_key)
  end

  --- Fast Loot
  while (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and IsModifierPressed(control_key) and IsModifierPressed(ignore_key) and fastloot) do
  OutputLogMessage("fastlooit = %s\n", current_weapon)

    ReleaseMouseButton(1)
    PressMouseButton(1)
    for i = 0, 14 do
      MoveMouseRelative(move, 0)
      Sleep(2)
    end
    ReleaseMouseButton(1)
    for i = 0, 14 do
      MoveMouseRelative(-move, 0)
      Sleep(2)
    end
    Sleep(10)
  end

  --- Active status
  if (current_weapon == "none") then
    if IsKeyLockOn(active_key) then 
        PressAndReleaseKey(active_key) 
    end
  else if not IsKeyLockOn(active_key) then 
       PressAndReleaseKey(active_key) 
    end
  end
end

