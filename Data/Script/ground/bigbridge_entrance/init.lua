--[[
    init.lua
    Created: 12/27/2022 11:38:11
    Description: Autogenerated script file for the map bigbridge_entrance.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local bigbridge_entrance = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---bigbridge_entrance.Init
--Engine callback function
function bigbridge_entrance.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---bigbridge_entrance.Enter
--Engine callback function
function bigbridge_entrance.Enter(map)

  GAME:FadeIn(20)

end

---bigbridge_entrance.Exit
--Engine callback function
function bigbridge_entrance.Exit(map)


end

---bigbridge_entrance.Update
--Engine callback function
function bigbridge_entrance.Update(map)


end

---bigbridge_entrance.GameSave
--Engine callback function
function bigbridge_entrance.GameSave(map)


end

---bigbridge_entrance.GameLoad
--Engine callback function
function bigbridge_entrance.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------


return bigbridge_entrance
