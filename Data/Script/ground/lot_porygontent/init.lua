--[[
    init.lua
    Created: 05/13/2023 16:36:12
    Description: Autogenerated script file for the map lot_porygontent.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local lot_porygontent = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---lot_porygontent.Init(map)
--Engine callback function
function lot_porygontent.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---lot_porygontent.Enter(map)
--Engine callback function
function lot_porygontent.Enter(map)

  GAME:FadeIn(20)

end

---lot_porygontent.Exit(map)
--Engine callback function
function lot_porygontent.Exit(map)


end

---lot_porygontent.Update(map)
--Engine callback function
function lot_porygontent.Update(map)


end

---lot_porygontent.GameSave(map)
--Engine callback function
function lot_porygontent.GameSave(map)


end

---lot_porygontent.GameLoad(map)
--Engine callback function
function lot_porygontent.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------


return lot_porygontent

