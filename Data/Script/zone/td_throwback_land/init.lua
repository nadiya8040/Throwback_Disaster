--[[
    init.lua
    Created: 11/29/2022 11:45:02
    Description: Autogenerated script file for the map td_throwback_land.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local td_throwback_land = {}

-------------------------------
-- Zone Callbacks
-------------------------------
---CURZONESCR.Init
--Engine callback function
function td_throwback_land.Init(zone)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> Init_td_throwback_land")
end

---CURZONESCR.EnterSegment
--Engine callback function
function td_throwback_land.EnterSegment(zone, rescuing, segmentID, mapID)
  if rescuing ~= true then
    COMMON.BeginDungeon(zone.ID, segmentID, mapID)
  end
end

---CURZONESCR.ExitSegment
--Engine callback function
function td_throwback_land.ExitSegment(zone, result, rescue, segmentID, mapID)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  PrintInfo("=>> ExitSegment_td_throwback_land result "..tostring(result).." segment "..tostring(segmentID))
  
  --first check for rescue flag; if we're in rescue mode then take a different path
  COMMON.ExitDungeonMissionCheck(zone.ID, segmentID)
  if result == RogueEssence.Data.GameProgress.ResultType.Cleared then
	SV.global_quest.BossWin = true
  else
	SV.global_quest.BossWin = false
  end
  if segmentID == 0 then
    SV.global_quest.StoryProgression = 7
    COMMON.EndSession(RogueEssence.Data.GameProgress.ResultType.Escaped, "td_throwback_land", -1, 0, 0)
	SV.wipedout = false
  end
  if segmentID == 1 then
	if result == RogueEssence.Data.GameProgress.ResultType.Cleared then
	  SV.global_quest.StoryProgression = 21
      COMMON.EndSession(result, "td_throwback_land", -1, 11, 0)
	else
	  COMMON.EndSession(result, "td_throwback_land", -1, 10, 0)
	end
  end
  if segmentID == 2 then
    if result == RogueEssence.Data.GameProgress.ResultType.Cleared then
	  SV.sidequest.quest04 = 2
      COMMON.EndSession(result, "td_throwback_land", -1, 0, 3)
	else
	  COMMON.EndSession(result, SV.checkpoint.Zone, SV.checkpoint.Segment, SV.checkpoint.Map, SV.checkpoint.Entry)
	end
  end
  if segmentID == 3 then
    if result == RogueEssence.Data.GameProgress.ResultType.Cleared then
      SV.global_quest.StoryProgression = 27
	  COMMON.EndSession(result, "td_throwback_land", -1, 6, 0)
	else
	  COMMON.EndSession(result, "td_throwback_land", -1, 13, 0)
	end
  end
end

---CURZONESCR.Rescued
--Engine callback function
function td_throwback_land.Rescued(zone, name, mail)
  COMMON.Rescued(zone, name, mail)
end

return td_throwback_land