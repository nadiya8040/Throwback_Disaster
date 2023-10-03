--[[
    init.lua
    Created: 03/13/2023 18:32:49
    Description: Autogenerated script file for the map roguelike_dimension.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local roguelike_dimension = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---roguelike_dimension.Init
--Engine callback function
function roguelike_dimension.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---roguelike_dimension.Enter
--Engine callback function
function roguelike_dimension.Enter(map)

  GAME:FadeIn(20)

end

---roguelike_dimension.Exit
--Engine callback function
function roguelike_dimension.Exit(map)


end

---roguelike_dimension.Update
--Engine callback function
function roguelike_dimension.Update(map)


end

---roguelike_dimension.GameSave
--Engine callback function
function roguelike_dimension.GameSave(map)


end

---roguelike_dimension.GameLoad
--Engine callback function
function roguelike_dimension.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------


return roguelike_dimension

