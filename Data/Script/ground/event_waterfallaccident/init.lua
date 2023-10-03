--[[
    init.lua
    Created: 11/27/2022 16:44:31
    Description: Autogenerated script file for the map event_waterfallaccident.
]]--
-- Commonly included lua functions and data
require 'common'

-- Package name
local event_waterfallaccident = {}

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
function event_waterfallaccident.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  _DATA.Save.ActiveTeam:SetRank("none")

end

---CURMAPSCR.Enter
--Engine callback function
function event_waterfallaccident.Enter(map)
  GAME:CutsceneMode(true)
  GAME:FadeIn(20)
  local espurr = CH('Friend1')
  local minccino = CH('Friend2')
  local player = CH('PLAYER')
  SV.playername = player:GetDisplayName()
  local coro1 = TASK:BranchCoroutine(function() event_waterfallaccident.Move1(espurr) end)
  local coro2 = TASK:BranchCoroutine(function() event_waterfallaccident.Move1(minccino) end)
  GROUND:MoveInDirection(player, Direction.Left, 12, false, 1)
  GAME:WaitFrames(18)
  GROUND:MoveInDirection(player, Direction.Left, 12, false, 1)
  GAME:WaitFrames(18)
  GROUND:MoveInDirection(player, Direction.Left, 12, false, 1)
  GAME:WaitFrames(18)
  GROUND:MoveInDirection(player, Direction.Left, 12, false, 1)
  GAME:WaitFrames(18)
  TASK:JoinCoroutines({coro1,coro2})
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Message_0']))
  UI:SetSpeaker(espurr)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Espurr_0']))
  UI:SetSpeaker(minccino)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Minccino_0']))
  UI:SetSpeaker(espurr)
  UI:SetSpeakerEmotion("Inspired")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Espurr_1']))
  GROUND:CharAnimateTurn(minccino, Direction.Left, 4, true)
  UI:SetSpeaker(minccino)
  UI:SetSpeakerEmotion("Determined")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Minccino_1'], SV.playername))
  UI:SetSpeaker(espurr)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Espurr_2']))
  UI:SetSpeaker(minccino)
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Minccino_2']))
  GROUND:CharAnimateTurn(espurr, Direction.Left, 4, true)
  local coro1 = TASK:BranchCoroutine(function() event_waterfallaccident.Move2(espurr) end)
  local coro2 = TASK:BranchCoroutine(function() event_waterfallaccident.Move2(minccino) end)
  GROUND:MoveInDirection(player, Direction.Left, 12, false, 1)
  GAME:WaitFrames(18)
  TASK:JoinCoroutines({coro1,coro2})
  UI:ResetSpeaker()
  GROUND:CharSetAnim(player, "Walk", true)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Message_1']))
  GROUND:CharAnimateTurn(player, Direction.Up, 4, false)
  GAME:WaitFrames(18)
  local coro1 = TASK:BranchCoroutine(function() event_waterfallaccident.Move3(espurr) end)
  local coro2 = TASK:BranchCoroutine(function() event_waterfallaccident.Move3(minccino) end)
  GROUND:AnimateInDirection(player, "Walk", Direction.Up, Direction.Down, 12, 2, 2)
  GROUND:CharSetAnim(player, "Walk", true)
  GAME:WaitFrames(60)
  SOUND:PlayBattleSE("TB_EVT_Fall")
  GROUND:AnimateInDirection(player, "Hurt", Direction.Up, Direction.Down, 40, 3, 4)
  TASK:JoinCoroutines({coro1,coro2})
  UI:SetSpeaker(espurr)
  UI:SetSpeakerEmotion("Shouting")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Espurr_3'], player:GetDisplayName()))
  GROUND:CharSetEmote(minccino, "sweating", 1)
  SOUND:PlayBattleSE("EVT_Emote_Sweating")
  GAME:WaitFrames(30)
  UI:SetSpeaker(minccino)
  UI:SetSpeakerEmotion("Sad")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Minccino_3']))
  UI:ResetSpeaker()
  local coro1 = TASK:BranchCoroutine(function() event_waterfallaccident.Move4(espurr) end)
  local coro2 = TASK:BranchCoroutine(function() event_waterfallaccident.Move4(minccino) end)
  GAME:WaitFrames(54)
  TASK:JoinCoroutines({coro1,coro2})
  GAME:FadeOut(false,20)
  GAME:EnterGroundMap("crystal_cave_entrance", "Start_1")
end

---CURMAPSCR.Exit
--Engine callback function
function event_waterfallaccident.Exit(map)


end

---CURMAPSCR.Update
--Engine callback function
function event_waterfallaccident.Update(map)


end

---CURMAPSCR.GameSave
--Engine callback function
function event_waterfallaccident.GameSave(map)


end

---CURMAPSCR.GameLoad
--Engine callback function
function event_waterfallaccident.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function event_waterfallaccident.Move1(character)
  GROUND:MoveInDirection(character, Direction.Left, 24, false, 1)
  GAME:WaitFrames(24)
  GROUND:CharAnimateTurn(character, Direction.Right, 4, true)
end

function event_waterfallaccident.Move2(character)
  GROUND:MoveInDirection(character, Direction.Left, 12, false, 1)
  GAME:WaitFrames(6)
  GROUND:CharAnimateTurn(character, Direction.Right, 2, true)
  GROUND:CharSetEmote(character, "exclaim", 1)
  SOUND:PlayBattleSE("EVT_Emote_Exclaim")
end

function event_waterfallaccident.Move3(character)
  GROUND:MoveInDirection(character, Direction.Right, 48, true, 2)
  GROUND:CharAnimateTurn(character, Direction.Down, 4, false)
  GAME:WaitFrames(40)
  GROUND:CharSetEmote(character, "shock", 1)
  SOUND:PlayBattleSE("EVT_Emote_Shock")
end

function event_waterfallaccident.Move4(character)
  GROUND:CharAnimateTurn(character, Direction.Right, 2, true)
  GROUND:MoveInDirection(character, Direction.Right, 96, true, 3)
end

return event_waterfallaccident
