--[[
    init.lua
    Created: 12/31/2023 16:14:07
    Description: Autogenerated script file for the map cobalt_cells_bossroom.
]]--
-- Commonly included lua functions and data
require 'common'
require 'commonex'

-- Package name
local cobalt_cells_bossroom = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---cobalt_cells_bossroom.Init(map)
--Engine callback function
function cobalt_cells_bossroom.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---cobalt_cells_bossroom.Enter(map)
--Engine callback function
function cobalt_cells_bossroom.Enter(map)
  GAME:CutsceneMode(true)
  COMMONEX.PlayerCutscene()
  GAME:FadeIn(60)
  local gapori = CH('Gapori')
  local iggly = CH('Igglybuff')
  local lydia = CH('Lydia')
  local player = CH('PLAYER')
  player.Data.Nickname = SV.playername
  UI:SetSpeaker(gapori)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_0']))
  GROUND:CharAnimateTurn(iggly, Direction.Down, 4, true)
  UI:SetSpeaker(iggly)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_0']))
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_1']))
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_2']))
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_3']))
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_4']))
  COMMON.GiftItemFull(player, RogueEssence.Dungeon.InvItem("held_expert_belt"),true,false)
  UI:SetSpeaker(gapori)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_1']))
  SOUND:FadeOutBGM(20)
  UI:SetSpeaker(STRINGS:Format("\\uE040"), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Lydia_0']))
  SOUND:PlayBGM("NadEvent31. Rydia.ogg", true)
  GROUND:Unhide("Lydia")
  GROUND:MoveInDirection(lydia, Direction.Up, 32, true, 2)
  GROUND:CharAnimateTurn(gapori, Direction.Down, 4, false)
  GROUND:CharAnimateTurn(player, Direction.DownLeft, 4, true)
  GAME:WaitFrames(20)
  UI:SetSpeaker(gapori)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_2']))
  UI:SetSpeaker(lydia)
  UI:SetSpeakerEmotion("Sad")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Lydia_1']))
  GROUND:CharSetEmote(iggly, "shock", 1)
  SOUND:PlayBattleSE("EVT_Emote_Shock")
  GAME:WaitFrames(30)
  UI:SetSpeaker(iggly)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_5']))
  UI:SetSpeaker(gapori)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_3']))
  UI:SetSpeaker(lydia)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Lydia_2']))
  UI:SetSpeaker(iggly)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_6']))
  GROUND:MoveInDirection(lydia, Direction.Up, 18, true, 2)
  GROUND:CharAnimateTurn(gapori, Direction.UpRight, 4, false)
  GROUND:CharAnimateTurn(player, Direction.UpLeft, 4, false)
  GAME:WaitFrames(15)
  lydia.Data.Nickname = 'Lydia'
  UI:SetSpeaker(lydia)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Lydia_3']))
  UI:SetSpeaker(iggly)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_7']))
  UI:SetSpeaker(gapori)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_4']))
  COMMONEX.PointIncrease(10)
  COMMONEX.SidequestCleared("Igglybuff's Strength")
  SV.sidequest.quest06 = 2
  GAME:FadeOut(false, 60)
  GAME:CutsceneMode(false)
  COMMON.EndDungeonDay(RogueEssence.Data.GameProgress.ResultType.Cleared, 'td_throwback_land', -1, 2, 2)
end

---cobalt_cells_bossroom.Exit(map)
--Engine callback function
function cobalt_cells_bossroom.Exit(map)


end

---cobalt_cells_bossroom.Update(map)
--Engine callback function
function cobalt_cells_bossroom.Update(map)


end

---cobalt_cells_bossroom.GameSave(map)
--Engine callback function
function cobalt_cells_bossroom.GameSave(map)


end

---cobalt_cells_bossroom.GameLoad(map)
--Engine callback function
function cobalt_cells_bossroom.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------


return cobalt_cells_bossroom
