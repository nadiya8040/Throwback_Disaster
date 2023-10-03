--[[
    init.lua
    Created: 04/27/2023 12:26:11
    Description: Autogenerated script file for the map td_starlight.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local td_starlight = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---td_starlight.Init
--Engine callback function
function td_starlight.Init(zone)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> Init_td_starlight")
end

---td_starlight.EnterSegment
--Engine callback function
function td_starlight.EnterSegment(zone, rescuing, segmentID, mapID)
  if rescuing ~= true then
    COMMON.BeginDungeon(zone.ID, segmentID, mapID)
  end
end

---td_starlight.ExitSegment
--Engine callback function
function td_starlight.ExitSegment(zone, result, rescue, segmentID, mapID)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> ExitSegment_td_starlight result "..tostring(result).." segment "..tostring(segmentID))
  
  --first check for rescue flag; if we're in rescue mode then take a different path
  COMMON.ExitDungeonMissionCheck(zone.ID, segmentID)
  if rescue == true then
    COMMON.EndRescue(zone, result, segmentID)
  elseif result ~= RogueEssence.Data.GameProgress.ResultType.Cleared then
    COMMON.EndDungeonDay(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
  else
    if segmentID == 0 then
      COMMON.EndDungeonDay(result, 'td_throwback_land', -1, 2, 2)
    else
      PrintInfo("No exit procedure found!")
      COMMON.EndDungeonDay(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
    end
  end
end

---td_starlight.Rescued
--Engine callback function
function td_starlight.Rescued(zone, name, mail)
  COMMON.Rescued(zone, name, mail)
end

return td_starlight
