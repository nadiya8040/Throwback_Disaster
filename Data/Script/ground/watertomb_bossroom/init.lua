--[[
    init.lua
    Created: 02/18/2023 18:16:27
    Description: Autogenerated script file for the map watertomb_bossroom.
]]--
-- Commonly included lua functions and data
require 'common'
require 'commonex'

-- Package name
local watertomb_bossroom = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--      local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---watertomb_bossroom.Init
--Engine callback function
function watertomb_bossroom.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()

end

---watertomb_bossroom.Enter
--Engine callback function
function watertomb_bossroom.Enter(map)

  GAME:CutsceneMode(true)
  local player = CH("PLAYER")
  local powwene = CH("Powwene")
  local smoochum = CH("Smoochum")
  if SV.global_quest.StoryProgression == 16 then
    GROUND:Hide('Speak')
	GROUND:TeleportTo(player, 172, 162, Direction.Up)
	GROUND:TeleportTo(powwene, 172, 138, Direction.Up)
	GAME:FadeIn(20)
	UI:SetSpeaker(CH("Gyarados"))
	UI:SetSpeakerEmotion("Dizzy")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gyarados_5']))
	COMMONEX.SmoothRemove("Gyarados")
	UI:SetSpeaker(smoochum)
	UI:SetSpeakerEmotion("Dizzy")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Smoochun_0']))
	UI:SetSpeaker(powwene)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_4']))
	UI:SetSpeaker(smoochum)
	UI:SetSpeakerEmotion("Surprised")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Smoochun_1']))
	UI:SetSpeaker(powwene)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_5']))
	GROUND:MoveToPosition(smoochum, 172, 32, false, 2)
	SOUND:PlayBattleSE("DUN_Aurora_Beam_2")
	GROUND:Hide('Smoochum')
	GROUND:MoveToPosition(powwene, 172, 32, false, 2)
	SOUND:PlayBattleSE("DUN_Aurora_Beam_2")
	GROUND:Hide('Powwene')
	COMMONEX.SpecialCharLeft("specialmember_powwene","Powwene",true)
	COMMONEX.PointIncrease(5)
  end
  if SV.global_quest.StoryProgression == 14 then
	GAME:FadeIn(20)
	GROUND:MoveInDirection(powwene, Direction.Up, 24, false, 1)
	UI:SetSpeaker(powwene)
	UI:SetSpeakerEmotion("Stunned")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_6']))
	GROUND:CharAnimateTurn(powwene, Direction.Down, 4, true)
	UI:SetSpeakerEmotion("Determined")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_7']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_8']))
	GROUND:MoveInDirection(powwene, Direction.Down, 20, false, 2)
  end
  GROUND:Hide('Powwene')
  GAME:FadeIn(20)
  GAME:CutsceneMode(false)

end

---watertomb_bossroom.Exit
--Engine callback function
function watertomb_bossroom.Exit(map)


end

---watertomb_bossroom.Update
--Engine callback function
function watertomb_bossroom.Update(map)


end

---watertomb_bossroom.GameSave
--Engine callback function
function watertomb_bossroom.GameSave(map)


end

---watertomb_bossroom.GameLoad
--Engine callback function
function watertomb_bossroom.GameLoad(map)

  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function watertomb_bossroom.Speak_Touch(obj, activator)
  local player = CH("PLAYER")
  local powwene = CH("Powwene")
  local boss = CH("Gyarados")
  if SV.global_quest.StoryProgression == 14 then
	GAME:CutsceneMode(true)
	GROUND:MoveToPosition(player, 172, 162, false, 2)
	GROUND:CharTurnToCharAnimated(player, boss, 4)
	GROUND:TeleportTo(powwene, 172, 162, Direction.Up)
	GROUND:Unhide('Powwene')
	GROUND:MoveInDirection(powwene, Direction.Up, 24, false, 1)
	UI:SetSpeaker(boss)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gyarados_0']))
	UI:SetSpeaker(powwene)
	UI:SetSpeakerEmotion("Stunned")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_0']))
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_1']))
	UI:SetSpeaker(boss)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gyarados_1']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gyarados_2']))
	UI:SetSpeaker(powwene)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_2']))
	UI:SetSpeaker(boss)
	UI:SetSpeakerEmotion("Determined")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gyarados_3']))
	UI:SetSpeaker(powwene)
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_3']))
	UI:SetSpeaker(boss)
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gyarados_4']))
	SV.global_quest.StoryProgression = 15
  end
  GAME:FadeOut(false, 20)
  GAME:ContinueDungeon('td_watertomb', 3, 0, 0)
  GAME:CutsceneMode(false)
end

function watertomb_bossroom.Exit_Touch(obj, activator)
  SOUND:PlayBattleSE("DUN_Aurora_Beam_2")
  SOUND:FadeOutBGM()
  GAME:FadeOut(true,60)
  GAME:FadeOut(false,20)
  GAME:WaitFrames(30)
  COMMON.EndDungeonDay(RogueEssence.Data.GameProgress.ResultType.Cleared, 'td_throwback_land', -1, 7, 1)
end

return watertomb_bossroom

