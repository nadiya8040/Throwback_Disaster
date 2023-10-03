--[[
    init.lua
    Created: 03/04/2023 18:43:53
    Description: Autogenerated script file for the map driftchill.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local driftchill = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---driftchill.Init
--Engine callback function
function driftchill.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---driftchill.Enter
--Engine callback function
function driftchill.Enter(map)

  GAME:FadeIn(20)

end

---driftchill.Exit
--Engine callback function
function driftchill.Exit(map)


end

---driftchill.Update
--Engine callback function
function driftchill.Update(map)


end

---driftchill.GameSave
--Engine callback function
function driftchill.GameSave(map)


end

---driftchill.GameLoad
--Engine callback function
function driftchill.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------


return driftchill

