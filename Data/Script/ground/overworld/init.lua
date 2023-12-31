--[[
    init.lua
    Created: 12/04/2022 19:10:45
    Description: Autogenerated script file for the map overworld.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local overworld = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---CURMAPSCR.Init
--Engine callback function
function overworld.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  
  COMMON.RespawnAllies()
  local player = CH('PLAYER')
  for i, id in ipairs({"PLAYER", "Teammate1", "Teammate2", "Teammate3", "Teammate4", "Teammate5", "Teammate6", "Teammate7"}) do
    if i > GAME:GetPlayerPartyCount() then
	  break
	end
    if i > 1 then
	  local teammate = CH(id)
	  teammate.CollisionDisabled = true
	  GROUND:TeleportTo(teammate, player.Position.X, player.Position.Y - i + 1, Direction.Down)
	  AI:SetCharacterAI(teammate, "ai.ground_partner", followed, teammate.Position)
	end
	followed = CH(id)
  end

end

---CURMAPSCR.Enter
--Engine callback function
function overworld.Enter(map)
  local num = SV.global_quest.StoryProgression
  if num < 9 then GROUND:Hide("Dungeon_0") end
  if num < 12 then GROUND:Hide("Lot_EmolgaHome") end
  GAME:FadeIn(20)

end

---CURMAPSCR.Exit
--Engine callback function
function overworld.Exit(map)


end

---CURMAPSCR.Update
--Engine callback function
function overworld.Update(map)


end

---CURMAPSCR.GameSave
--Engine callback function
function overworld.GameSave(map)


end

---CURMAPSCR.GameLoad
--Engine callback function
function overworld.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function overworld.Town_AmusementPark_Touch(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("amusement_park", "entrance_south")
end

function overworld.Lot_EmolgaHome_Touch(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("lot_emolga", "Entrance")
end

function overworld.Dungeon_0_Touch(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  local dungeon_entrances = {'td_pinkandblue','td_newforest','td_oriental','td_theknapsack','td_childhood_park'}
  local ground_entrances = {}
  COMMON.ShowDestinationMenu(dungeon_entrances,ground_entrances)
end

function overworld.Town_DAvigny_Touch(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("davigny", "Entrance")
end

return overworld

