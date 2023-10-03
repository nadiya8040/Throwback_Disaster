--[[
    init.lua
    Created: 06/12/2023 01:56:42
    Description: Autogenerated script file for the map td_cobaltcells.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local td_cobaltcells = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---CURZONESCR.Init
--Engine callback function
function td_cobaltcells.Init(zone)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> Init_td_cobaltcells")
end

---CURZONESCR.EnterSegment
--Engine callback function
function td_cobaltcells.EnterSegment(zone, rescuing, segmentID, mapID)
  if rescuing ~= true then
    COMMON.BeginDungeon(zone.ID, segmentID, mapID)
  end
end

---CURZONESCR.ExitSegment
--Engine callback function
function td_cobaltcells.ExitSegment(zone, result, rescue, segmentID, mapID)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> ExitSegment_td_cobaltcells result "..tostring(result).." segment "..tostring(segmentID))
  
  --first check for rescue flag; if we're in rescue mode then take a different path
  COMMON.ExitDungeonMissionCheck(zone.ID, segmentID)
  if rescue == true then
    COMMON.EndRescue(zone, result, segmentID)
  elseif result ~= RogueEssence.Data.GameProgress.ResultType.Cleared then
    COMMON.EndDungeonDay(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
  else
    if segmentID == 0 then
      if SV.sidequest.quest06 == 1 then
	    GAME:ContinueDungeon('td_cobaltcells', 1, 0, 0, RogueEssence.Data.GameProgress.DungeonStakes.Risk, true, false)
	  else
	    COMMON.EndDungeonDay(result, 'td_throwback_land', -1, 2, 2)
	  end
    elseif segmentID == 1 then
      GAME:EnterGroundMap("cobalt_cells_bossroom", "Entrance")
    else
      PrintInfo("No exit procedure found!")
      COMMON.EndDungeonDay(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
    end
  end
end

---CURZONESCR.Rescued
--Engine callback function
function td_cobaltcells.Rescued(zone, name, mail)
  COMMON.Rescued(zone, name, mail)
end

return td_cobaltcells

