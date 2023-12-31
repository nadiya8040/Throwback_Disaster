--[[
    init.lua
    Created: 11/09/2022 16:13:23
    Description: Autogenerated script file for the map nad_crystal_cave.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local nad_crystal_cave = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---CURZONESCR.Init
--Engine callback function
function nad_crystal_cave.Init(zone)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> Init_nad_crystal_cave")
end

---CURZONESCR.EnterSegment
--Engine callback function
function nad_crystal_cave.EnterSegment(zone, rescuing, segmentID, mapID)
  if rescuing ~= true then
    COMMON.BeginDungeon(zone.ID, segmentID, mapID)
  end
end

---CURZONESCR.ExitSegment
--Engine callback function
function nad_crystal_cave.ExitSegment(zone, result, rescue, segmentID, mapID)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> ExitSegment_nad_crystal_cave result "..tostring(result).." segment "..tostring(segmentID))
  
  --first check for rescue flag; if we're in rescue mode then take a different path
  COMMON.ExitDungeonMissionCheck(zone.ID, segmentID)
  if rescue == true then
    COMMON.EndRescue(zone, result, segmentID)
  elseif result ~= RogueEssence.Data.GameProgress.ResultType.Cleared then
    COMMON.EndDungeonDay(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
  else
    if segmentID == 0 then
      GAME:EnterGroundMap("crystal_cave_end", "Entrance")
	elseif segmentID == 1 then
	  SV.global_quest.StoryProgression = 2
	  GAME:EnterGroundMap("crystal_cave_end", "BossEntrance")
    else
      PrintInfo("No exit procedure found!")
      COMMON.EndDungeonDay(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
    end
  end
end

---CURZONESCR.Rescued
--Engine callback function
function nad_crystal_cave.Rescued(zone, name, mail)
  COMMON.Rescued(zone, name, mail)
end

return nad_crystal_cave

