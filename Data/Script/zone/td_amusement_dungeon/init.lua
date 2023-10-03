--[[
    init.lua
    Created: 09/11/2023 13:41:26
    Description: Autogenerated script file for the map td_amusement_dungeon.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local td_amusement_dungeon = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---td_amusement_dungeon.Init(zone)
--Engine callback function
function td_amusement_dungeon.Init(zone)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> Init_td_amusement_dungeon")
end

---td_amusement_dungeon.EnterSegment(zone, rescuing, segmentID, mapID)
--Engine callback function
function td_amusement_dungeon.EnterSegment(zone, rescuing, segmentID, mapID)
  if rescuing ~= true then
    COMMON.BeginDungeon(zone.ID, segmentID, mapID)
  end
end

---td_amusement_dungeon.ExitSegment(zone, result, rescue, segmentID, mapID)
--Engine callback function
function td_amusement_dungeon.ExitSegment(zone, result, rescue, segmentID, mapID)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> ExitSegment_td_amusement_dungeon result "..tostring(result).." segment "..tostring(segmentID))
  
  --first check for rescue flag; if we're in rescue mode then take a different path
  COMMON.ExitDungeonMissionCheck(zone.ID, segmentID)
  if rescue == true then
    COMMON.EndRescue(zone, result, segmentID)
  elseif result ~= RogueEssence.Data.GameProgress.ResultType.Cleared then
    COMMON.EndDungeonDay(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
  else
    if segmentID == 0 then
      COMMON.EndDungeonDay(result, 'td_throwback_land', -1, 10, 1)
    else
      PrintInfo("No exit procedure found!")
      COMMON.EndDungeonDay(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
    end
  end
end

---td_amusement_dungeon.Rescued(zone, name, mail)
--Engine callback function
function td_amusement_dungeon.Rescued(zone, name, mail)
  COMMON.Rescued(zone, name, mail)
end

return td_amusement_dungeon
