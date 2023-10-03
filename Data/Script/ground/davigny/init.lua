--[[
	init.lua
	Created: 01/14/2023 15:14:35
	Description: Autogenerated script file for the map d'avigny.
]]--
-- Commonly included lua functions and data
require 'common'
require 'commonex'

-- Package name
local davigny = {}

-- Local, localized strings table
-- Use this to display the named strings you added in the strings files for the map!
-- Ex:
--	  local localizedstring = MapStrings['SomeStringName']
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
---d'avigny.Init
--Engine callback function
function davigny.Init(map)

  --This will fill the localized strings table automatically based on the locale the game is 
  -- currently in. You can use the MapStrings table after this line!
  MapStrings = COMMON.AutoLoadLocalizedStrings()
  COMMON.RespawnAllies()

end

---d'avigny.Enter
--Engine callback function
function davigny.Enter(map)

  if SV.davigny == nil then
	SV.davigny =
	{
	  FirstTime = false,
	  MachopExplain = false,
	  CorsolaMove = false
	}
  end
  GROUND:Hide("Powwene")
  GROUND:Hide("Zigzagoon")
  GROUND:Hide("Gapori")
  
  if SV.sidequest.quest01 == 2 then
	GROUND:Hide("Cradily")
  end
  
  if SV.sidequest.quest00 == 2 then
	GROUND:Hide("Bayleef")
  end
  
  if SV.sidequest.quest05 == 2 and SV.sidequest.quest06 == 2 and SV.global_quest.StoryProgression == 26 then
    GROUND:Unhide("DangerZone")
  end
  
  if SV.sidequest.quest05 == 2 then
	GROUND:Hide("Chinchou")
  end
  
  if SV.global_quest.StoryProgression < 12 then
	GROUND:Hide("ChildPark_Igglybuff")
	GROUND:Hide("ChildPark_Pichu")
	GROUND:Hide("ChildPark_Wooper")
  else
    if SV.sidequest.quest06 > 0 then
      GROUND:Hide("ChildPark_Igglybuff")
	end
  end
  
  if SV.global_quest.StoryProgression < 14 then
	GROUND:Hide("Vulpix")
  end
  
  if SV.global_quest.StoryProgression < 22 or (SV.sidequest_buneary > 0 and SV.sidequest_buneary < 4) then
    GROUND:Hide("Buneary")
  else
	if SV.sidequest_buneary == 4 then
	  GROUND:TeleportTo(CH("Buneary"), 192, 110, Direction.Down)
	  GROUND:CharSetAnim(CH("Buneary"), "EventSleep", true)
	end
  end
  
  if SV.global_quest.StoryProgression < 17 then
	GROUND:Hide("ChildPark_Smoochum")
	GROUND:Hide("Misdreavus")
	GROUND:Hide("Shuppet")
  elseif SV.global_quest.StoryProgression < 18 then
    SOUND:PlayBGM("Nad72. Phantom and a Rose.ogg", true)
  else
    GROUND:Hide("Misdreavus")
  end
  
  if SV.davigny.CorsolaMove == false then
	GROUND:Hide("Stairs_Underwater")
  else
	GROUND:TeleportTo(CH("Corsola"), 48, 101, Direction.Down)
  end
  
  if SV.davigny.FirstTime == false then
	UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 20)
	GAME:WaitFrames(30)
	UI:WaitHideTitle(20)
	SV.davigny.FirstTime = true
  end
  
  if SV.global_quest.StoryProgression == 8 then
	GROUND:Hide("MachopTalk")
  elseif SV.davigny.MachopExplain == true then
	GROUND:RemoveCharacter("MachopTalk")
  end
  
  if SV.global_quest.StoryProgression > 26 then
	SOUND:PlayBGM("Nad95. TroubledTown.ogg", true)
	GROUND:Hide("Machop")
    GROUND:Hide("ChildPark_Smoochum")
    GROUND:Hide("ChildPark_Pichu")
    GROUND:Hide("ChildPark_Wooper")
    GROUND:Hide("Shuppet")
    GROUND:Hide("Mamel")
    GROUND:Hide("Nuzleaf")
    GROUND:Hide("Lapras")
    GROUND:Hide("Vulpix")
    GROUND:Hide("Corsola")
    GROUND:Hide("Mankey")
    GROUND:Hide("Natu")
  end
  
  if SV.global_quest.StoryProgression == 27 then
	local gapori = CH("Gapori")
	local togetic = CH("Priest")
	GROUND:Unhide("Gapori")
	COMMONEX.PlayerCutscene()
	GROUND:TeleportTo(CH("PLAYER"), 194, 386, Direction.Up)
	GROUND:TeleportTo(gapori, 220, 376, Direction.Up)
	GAME:UnlockDungeon('td_pinkandblue')
	GAME:CutsceneMode(true)
	GAME:FadeIn(20)
	GROUND:CharSetEmote(gapori, "sweatdrop", 1)
	SOUND:PlayBattleSE("EVT_Emote_Sweatdrop")
    GAME:WaitFrames(30)
    UI:SetSpeaker(gapori)
    UI:SetSpeakerEmotion("Sigh")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_8']))
	UI:SetSpeaker(togetic)
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_3'],GAME:GetTeamName()))
	GAME:FadeOut(false,20)
	GROUND:TeleportTo(CH("PLAYER"), 282, 264, Direction.Up)
	GROUND:TeleportTo(gapori, 308, 264, Direction.Up)
	GAME:FadeIn(20)
	UI:SetSpeaker(gapori)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_9']))
	UI:SetSpeaker(togetic)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_4']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_5']))
	UI:SetSpeaker(gapori)
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_10']))
	UI:SetSpeaker(togetic)
    UI:SetSpeakerEmotion("Sad")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_6']))
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_7']))
	SOUND:PlayFanfare("Fanfare/SpecialItem")
	UI:ResetSpeaker()
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Message_4']))
	UI:SetSpeaker(gapori)
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_11']))
	GAME:FadeOut(false,20)
	GAME:CutsceneMode(false)
	COMMON.RespawnAllies()
	GROUND:Hide("Gapori")
	GROUND:TeleportTo(CH("PLAYER"), 295, 264, Direction.Down)
	SV.global_quest.StoryProgression = 28
	GAME:FadeIn(20)
  end
  
  GAME:FadeIn(20)
  
  if SV.wipedout == true then
	UI:SetSpeaker(CH("Priest"))
	UI:SetSpeakerEmotion("Surprised")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_Wipeout_0']))
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_Wipeout_1']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_Wipeout_2']))
	SV.wipedout = false
  end
  
end

---d'avigny.Exit
--Engine callback function
function davigny.Exit(map)


end

---d'avigny.Update
--Engine callback function
function davigny.Update(map)


end

---d'avigny.GameSave
--Engine callback function
function davigny.GameSave(map)


end

---d'avigny.GameLoad
--Engine callback function
function davigny.GameLoad(map)

  if SV.global_quest.StoryProgression == 17 then
    SOUND:PlayBGM("Nad72. Phantom and a Rose.ogg", true)
  end
  if SV.sidequest_buneary == 4 then
	GROUND:CharSetAnim(CH("Buneary"), "EventSleep", true)
  end
  if SV.global_quest.StoryProgression > 26 then
	SOUND:PlayBGM("Nad95. TroubledTown.ogg", true)
  end
  GAME:FadeIn(20)

end

-------------------------------
-- Entities Callbacks
-------------------------------

function davigny.Misdreavus_Action(chara, activator)
  local zig = CH("Zigzagoon")
  local shu = CH("Shuppet")
  chara.CollisionDisabled = true
  zig.CollisionDisabled = true
  SOUND:PlayBGM("NadEvent10. Help.ogg", true)
  GROUND:Unhide("Zigzagoon")
  GROUND:MoveInDirection(zig, Direction.Up, 24, true, 3)
  GROUND:CharAnimateTurn(zig, Direction.Right, 4, false)
  UI:SetSpeaker(zig)
  UI:SetSpeakerEmotion("Shouting")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Zigzagoon_0']))
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Zigzagoon_1']))
  UI:SetSpeaker(chara)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Misdreavus_0']))
  UI:SetSpeaker(zig)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Zigzagoon_2']))
  GROUND:MoveInDirection(zig, Direction.Down, 24, true, 3)
  GROUND:Hide("Zigzagoon")
  UI:SetSpeaker(chara)
  UI:SetSpeakerEmotion("Stunned")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Misdreavus_1']))
  UI:SetSpeaker(shu)
  UI:SetSpeakerEmotion("Worried")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shuppet_0']))
  GROUND:MoveInDirection(chara, Direction.Left, 24, true, 3)
  GROUND:MoveToPosition(chara, 196, 484, true, 3)
  GROUND:Hide("Misdreavus")
  SV.global_quest.StoryProgression = 18
end

function davigny.Buneary_Action(chara, activator)
  UI:SetSpeaker(chara)
  UI:SetSpeakerEmotion("Sad")
  if SV.sidequest_buneary == 0 then
    GROUND:CharTurnToChar(chara,CH('PLAYER'))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Buneary_0']))
    UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Buneary_1']))
    chara.CollisionDisabled = true
    GROUND:MoveToPosition(chara, 196, 484, false, 2)
    GROUND:Hide("Buneary")
    SV.sidequest_buneary = 1
  else
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Buneary_2']))
	UI:ResetSpeaker()
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Message_2']))
  end
end

function davigny.Shuppet_Action(chara, activator)
  UI:SetSpeaker(chara)
  if SV.global_quest.StoryProgression == 17 then
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shuppet_1']))
  else
    GROUND:CharTurnToChar(chara,player)
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shuppet_2']))
  end
end

function davigny.Assembly_Action(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  UI:ResetSpeaker()
  COMMON.ShowTeamAssemblyMenu(obj, COMMON.RespawnAllies)
end

function davigny.Storage_Action(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  COMMON:ShowTeamStorageMenu()
end

function davigny.Nuzleaf_Action(chara, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  if SV.sidequest.quest05 == 2 then
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_10']))
  else
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_0']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_1']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_2']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_3']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_4']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_5']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_6']))
	if SV.NuzleafTalk == false then
      UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_7']))
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_8']))
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Nuzleaf_9']))
	  SV.NuzleafTalk = true
	  GAME:UnlockDungeon('td_pinkandblue')
	end
  end
end

function davigny.DangerZone_Touch(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  UI:SetSpeaker(CH("Gapori"))
  UI:SetSpeakerEmotion("Worried")
  SOUND:FadeOutBGM(30)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_6']))
  GAME:FadeOut(true, 60)
  GAME:CutsceneMode(true)
  GROUND:TeleportTo(CH("PLAYER"), 196, 440, Direction.Up)
  GROUND:TeleportTo(CH("Machop"), 196, 463, Direction.Up)
  GROUND:TeleportTo(CH("ChildPark_Smoochum"), 196, 413, Direction.Down)
  GROUND:TeleportTo(CH("ChildPark_Pichu"), 175, 405, Direction.Down)
  GROUND:TeleportTo(CH("ChildPark_Wooper"), 196, 380, Direction.Down)
  GROUND:TeleportTo(CH("Shuppet"), 222, 404, Direction.Down)
  GROUND:TeleportTo(CH("Mamel"), 212, 364, Direction.Down)
  GROUND:TeleportTo(CH("Nuzleaf"), 183, 358, Direction.Down)
  GROUND:TeleportTo(CH("Lapras"), 196, 333, Direction.Down)
  GROUND:TeleportTo(CH("Vulpix"), 224, 382, Direction.DownLeft)
  GROUND:TeleportTo(CH("Corsola"), 246, 396, Direction.DownLeft)
  GROUND:TeleportTo(CH("Mankey"), 150, 397, Direction.DownRight)
  GROUND:TeleportTo(CH("Natu"), 173, 381, Direction.DownRight)
  GAME:FadeIn(20)
  SOUND:PlayFanfare("Fanfare/Surprise")
  GAME:WaitFrames(90)
  GROUND:CharSetEmote(CH("PLAYER"), "shock", 1)
  SOUND:PlayBattleSE("EVT_Emote_Shock")
  GAME:WaitFrames(30)
  UI:SetSpeakerEmotion("Surprised")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_7']))
  GAME:FadeOut(false, 30)
  GAME:CutsceneMode(false)
  GAME:EnterDungeon('td_throwback_land', 3, 0, 0, RogueEssence.Data.GameProgress.DungeonStakes.Risk, false, false)
end

function davigny.SouthExit_Touch(obj, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  GAME:FadeOut(false, 20)
  GAME:EnterGroundMap("overworld", "Spawn_1")
end

function davigny.Stairs_Underwater_Touch(obj, activator)
  local ch=false
  if SV.lot_emolga ~= nil then
    local hid=SV.hiddensidequest.celebi
	if hid == 1 or hid == 2 then
	  ch=true
	end
  end
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  if ch then
    UI:SetSpeaker(CH("Powwene"))
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_3']))
  else
    GAME:FadeOut(false, 20)
    GAME:EnterGroundMap("davigny_oceanroom", "Entrance")
  end
end

function davigny.MachopTalk_Touch(obj, activator)
if SV.davigny.MachopExplain == false then
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  GROUND:RemoveCharacter("MachopTalk")
  machop=CH("Machop")
  player=CH("PLAYER")
  UI:SetSpeaker(machop)
  GROUND:CharTurnToChar(machop,player)
  GROUND:CharTurnToChar(player,machop)
  local ch = false
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Machop_0']))
  while not ch do
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Machop_1']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Machop_2']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Machop_3']))
	UI:ChoiceMenuYesNo(STRINGS:Format(MapStrings['Machop_4']), false)
	UI:WaitForChoice()
	ch = UI:ChoiceResult()
	if not ch then
	  UI:SetSpeakerEmotion("Worried")
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Machop_5']))
	end
  end
  UI:SetSpeakerEmotion("Normal")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Machop_6']))
  COMMON.GiftItem(player, RogueEssence.Dungeon.InvItem("seed_reviver"))
  UI:SetSpeaker(machop)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Machop_7']))
  SV.davigny.MachopExplain = true
end
end

function davigny.Bayleef_Action(chara, activator)
  local questname = "Sick Mon"
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  local quest_ = SV.sidequest.quest00
  if quest_ < 2 then
	if quest_ == 0 then
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Bayleef_0']))
	end
	local item_slot = GAME:FindPlayerItem('berry_lum',false,true)
	if quest_ == 1 and item_slot:IsValid() then
	  UI:SetSpeakerEmotion("Surprised")
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Bayleef_3']))
	  UI:SetSpeakerEmotion("Joyous")
	  GAME:TakePlayerBagItem(item_slot.Slot)
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Bayleef_4']))
	  COMMON.GiftItemFull(CH('PLAYER'), RogueEssence.Dungeon.InvItem("apricorn_green"),false,false)
	  COMMONEX.PointIncrease(1)
	  quest_ = 2
	  COMMONEX.SidequestCleared(questname)
	  GAME:FadeOut(false, 20)
	  GROUND:Hide("Bayleef")
	  GAME:FadeIn(20)
	else
	  UI:SetSpeakerEmotion("Sad")
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Bayleef_1']))
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Bayleef_2']))
	end
	if quest_ == 0 then
	  quest_ = 1
	  COMMONEX.SidequestAccept(questname)
	end
  end
  SV.sidequest.quest00 = quest_
end

function davigny.Natu_Action(chara, activator)
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Natu_0']))
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Natu_1']))
end

function davigny.Corsola_Action(chara, activator)
  local powwene = CH("Powwene")
  if SV.sidequest.quest05 == 2 then
    GROUND:CharTurnToChar(chara,CH('PLAYER'))
	UI:SetSpeaker(chara)
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Corsola_6']))
  elseif SV.global_quest.StoryProgression == 12 and SV.davigny.CorsolaMove == false then
	chara.CollisionDisabled = true
	GAME:FadeOut(false, 20)
	GAME:CutsceneMode(true)
	COMMONEX.PlayerCutscene()
	GROUND:Unhide("Powwene")
	GROUND:TeleportTo(CH("PLAYER"), 120, 101, Direction.Left)
	GROUND:TeleportTo(powwene, 96, 101, Direction.Left)
	powwene.CollisionDisabled = true
	GAME:FadeIn(20)
	UI:SetSpeaker(chara)
	UI:SetSpeakerEmotion("Pain")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Corsola_1']))
	UI:SetSpeaker(powwene)
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_0']))
	GROUND:CharAnimateTurn(chara, Direction.Right, 4, true)
	UI:SetSpeaker(chara)
	UI:SetSpeakerEmotion("Stunned")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Corsola_2']))
	UI:SetSpeaker(powwene)
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_1']))
	GROUND:MoveInDirection(powwene, Direction.Left, 12, false, 1)
	GROUND:CharSetAnim(powwene, "Attack", false)
	SOUND:PlayBattleSE("DUN_Attack")
	GAME:WaitFrames(15)
	GAME:UnlockDungeon('td_watertomb')
	local coro1 = TASK:BranchCoroutine(function() davigny.CorsolaHurt(chara) end)
	GROUND:Unhide("Stairs_Underwater")
	UI:SetSpeaker(chara)
	UI:SetSpeakerEmotion("Surprised")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Corsola_3']))
	SV.davigny.CorsolaMove = true
	TASK:JoinCoroutines({coro1})
	UI:SetSpeaker(powwene)
	UI:SetSpeakerEmotion("Inspired")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Powwene_2']))
	UI:SetSpeaker(chara)
	UI:SetSpeakerEmotion("Pain")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Corsola_4']))
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Corsola_5']))
	GAME:FadeOut(false, 20)
	GROUND:TeleportTo(CH("PLAYER"), 96, 101, Direction.Down)
	GROUND:TeleportTo(chara, 48, 101, Direction.Down)
	chara.CollisionDisabled = false
	GROUND:Hide("Powwene")
	GROUND:RefreshPlayer()
	GAME:CutsceneMode(false)
	GAME:FadeIn(20)
  else
	GROUND:CharTurnToChar(chara,CH('PLAYER'))
	UI:SetSpeaker(chara)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Corsola_0']))
  end
end

function davigny.CorsolaHurt(character)
  GROUND:CharSetEmote(character, "shock", 1)
  SOUND:PlayBattleSE("EVT_Emote_Shock")
  GROUND:AnimateInDirection(character, "Hurt", Direction.Right, Direction.Left, 12, 2, 2)
end

function davigny.Mankey_Action(chara, activator)
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  if SV.global_quest.StoryProgression == 8 then
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_0'],GAME:GetTeamName()))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_1']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_2']))
	SOUND:PlayFanfare("Fanfare/Unlocked")
	UI:ResetSpeaker()
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Message_1']))
	GAME:UnlockDungeon('td_newforest')
	GAME:UnlockDungeon('td_oriental')
	GAME:UnlockDungeon('td_theknapsack')
	SV.global_quest.StoryProgression = 9
	GROUND:Unhide("MachopTalk")
  elseif SV.global_quest.StoryProgression == 22 then
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_3']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_4']))
	SOUND:PlayFanfare("Fanfare/SmallPrize")
	UI:ResetSpeaker()
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Message_3']))
	SV.global_quest.StoryProgression = 23
  elseif SV.global_quest.StoryProgression == 25 then
    local gapori = CH("Gapori")
	local player = CH("PLAYER")
	gapori.CollisionDisabled = true
	player.CollisionDisabled = true
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_5']))
	UI:SetSpeaker(gapori)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_0']))
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_6']))
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_7']))
	UI:SetSpeaker(gapori)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_1']))
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_8']))
	UI:SetSpeaker(gapori)
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_2']))
	GAME:FadeOut(false,20)
	GROUND:Unhide("Gapori")
	GROUND:TeleportTo(player, 141, 290, Direction.Left)
	GAME:CutsceneMode(true)
	COMMONEX.PlayerCutscene()
	GROUND:CharTurnToChar(chara,player)
	local player = CH("PLAYER")
	GAME:FadeIn(20)
	GAME:WaitFrames(30)
	GROUND:CharSetEmote(chara, "notice", 1)
	SOUND:PlayBattleSE("EVT_Emote_Exclaim")
	GAME:WaitFrames(30)
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_9']))
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_10']))
	UI:SetSpeaker(gapori)
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_3']))
	GROUND:TeleportTo(player, 129, 290, Direction.Left)
	GROUND:CharSetAnim(gapori, "Walk", true)
	GROUND:CharSetAnim(player, "Charge", true)
	UI:SetSpeaker(chara)
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_11']))
	UI:SetSpeaker(gapori)
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_4'], SV.playername))
	GROUND:CharEndAnim(gapori)
	GROUND:CharEndAnim(player)
	GROUND:TeleportTo(player, 141, 290, Direction.Left)
	GAME:WaitFrames(30)
	GROUND:CharSetEmote(gapori, "sweatdrop", 1)
	SOUND:PlayBattleSE("EVT_Emote_Sweatdrop")
	GAME:WaitFrames(60)
	GROUND:CharTurnToCharAnimated(gapori, player, 4)
	GAME:WaitFrames(30)
	UI:SetSpeakerEmotion("Sigh")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Gapori_5']))
	GROUND:MoveInDirection(gapori, Direction.Right, 24, false, 1)
	COMMON.RespawnAllies()
	GROUND:Hide("Gapori")
	GAME:CutsceneMode(false)
	player.CollisionDisabled = false
	SOUND:PlayFanfare("Fanfare/Unlocked")
	UI:ResetSpeaker()
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Message_1']))
    GAME:UnlockDungeon('td_cobaltcells')
	GAME:UnlockDungeon('td_fieldgarden')
	GAME:UnlockDungeon('td_starlight')
	GAME:UnlockDungeon('td_luminous_tangle')
	SV.global_quest.StoryProgression = 26
  else
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mankey_2']))
  end
end

function davigny.Chinchou_Action(chara, activator)
  local questname = "New Love Experience"
  local player = CH('PLAYER')
  GROUND:CharTurnToChar(chara,player)
  UI:SetSpeaker(chara)
  local quest_ = SV.sidequest.quest05
  if SV.global_quest.StoryProgression > 25 then
    if quest_ == 0 then
	  UI:SetSpeakerEmotion("Worried")
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_4']))
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_5']))
	  UI:SetSpeakerEmotion("Sad")
      UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_6']))
	  quest_ = 1
      COMMONEX.SidequestAccept(questname)
	else
      if player.CurrentForm.Species == "luvdisc" then
        UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_7']))
		UI:SetSpeaker(player)
		UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue(STRINGS:Format(MapStrings['Player_Luvdisc_0']))
		UI:SetSpeaker(chara)
		UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_8']))
		UI:SetSpeaker(player)
        UI:WaitShowDialogue(STRINGS:Format(MapStrings['Player_Luvdisc_1']))
		UI:SetSpeaker(chara)
		UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_9']))
		quest_ = 2
		COMMONEX.PointIncrease(10)
		COMMONEX.SidequestCleared(questname)
		GAME:FadeOut(false, 20)
	    GROUND:Hide("Chinchou")
	    GAME:FadeIn(20)
	  else
	    UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_5']))
	  end
	end
  else
    if SV.davigny.CorsolaMove == false then
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_0']))
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_1']))
      UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_2']))
    else
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Chinchou_3']))
    end
  end
  SV.sidequest.quest05 = quest_
end

function davigny.Cradily_Action(chara, activator)
  local questname = "Ritual Sticks"
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  local quest_ = SV.sidequest.quest01
  if quest_ == 2 then
	
  else
	local item_slot = GAME:FindPlayerItem('ammo_stick',false,true)
	if quest_ == 1 and GAME:GetPlayerBagItem(item_slot.Slot).Amount >= 4 then
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Cradily_2']))
	  UI:SetSpeakerEmotion("Happy")
	  GAME:TakePlayerBagItem(item_slot.Slot)
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Cradily_3']))
	  COMMON.GiftItemFull(CH('PLAYER'), RogueEssence.Dungeon.InvItem("gummi_brown"),false,false)
	  COMMONEX.PointIncrease(1)
	  quest_ = 2
	  COMMONEX.SidequestCleared(questname)
	  GAME:FadeOut(false, 20)
	  GROUND:Hide("Cradily")
	  GAME:FadeIn(20)
	else
	  UI:SetSpeakerEmotion("Worried")
	  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Cradily_0']))
	  if quest_ == 0 then
  		UI:SetSpeakerEmotion("Normal")
		UI:WaitShowDialogue(STRINGS:Format(MapStrings['Cradily_1']))
		quest_ = 1
		COMMONEX.SidequestAccept(questname)
	  end
	end
  end
  SV.sidequest.quest01 = quest_
end

function davigny.Machop_Action(chara, activator)
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  UI:SetSpeakerEmotion("Happy")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Machop_7']))
end

function davigny.Vulpix_Action(chara, activator)
  local state = 0
  local repeated = false
  local cart = {}
  local catalog = { }
  for ii = 1, #SV.base_shop, 1 do
	local base_data = SV.base_shop[ii]
	local item_data = { Item = RogueEssence.Dungeon.InvItem(base_data.Index, false, base_data.Amount), Price = base_data.Price }
	table.insert(catalog, item_data)
  end
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  UI:SetSpeakerEmotion("Sad")
  UI:WaitShowDialogue(STRINGS:Format(MapStrings['Vulpix_0']))
  UI:SetSpeakerEmotion("Normal")
	while state > -1 do
		if state == 0 then
			local msg = STRINGS:Format(MapStrings['Shop_Intro'])
			if repeated == true then
				msg = STRINGS:Format(MapStrings['Shop_Intro_Return'])
			end
			local shop_choices = {STRINGS:Format(MapStrings['Shop_Option_Buy']), STRINGS:Format(MapStrings['Shop_Option_Sell']),
			STRINGS:FormatKey("MENU_EXIT")}
			UI:BeginChoiceMenu(msg, shop_choices, 1, 3)
			UI:WaitForChoice()
			local result = UI:ChoiceResult()
			repeated = true
			if result == 1 then
				if #catalog > 0 then
					--TODO: use the enum instead of a hardcoded number
					UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Buy'], STRINGS:LocalKeyString(26)))
					state = 1
				else
					UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Buy_Empty']))
				end
			elseif result == 2 then
				local bag_count = GAME:GetPlayerBagCount() + GAME:GetPlayerEquippedCount()
				if bag_count > 0 then
					--TODO: use the enum instead of a hardcoded number
					UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Sell'], STRINGS:LocalKeyString(26)))
					state = 3
				else
					UI:SetSpeakerEmotion("Sad")
					UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Bag_Empty']))
					UI:SetSpeakerEmotion("Normal")
				end
			else
				UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Goodbye']))
				state = -1
			end
		elseif state == 1 then
			UI:ShopMenu(catalog)
			UI:WaitForChoice()
			local result = UI:ChoiceResult()
			if #result > 0 then
				local bag_count = GAME:GetPlayerBagCount() + GAME:GetPlayerEquippedCount()
				local bag_cap = GAME:GetPlayerBagLimit()
				if bag_count == bag_cap then
					UI:SetSpeakerEmotion("Sad")
					UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Bag_Full']))
					UI:SetSpeakerEmotion("Normal")
				else
					cart = result
					state = 2
				end
			else
				state = 0
			end
		elseif state == 2 then
			local total = 0
			for ii = 1, #cart, 1 do
				total = total + catalog[cart[ii]].Price
			end
			local msg
			if total > GAME:GetPlayerMoney() then
				UI:SetSpeakerEmotion("Stunned")
				UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Buy_No_Money']))
				UI:SetSpeakerEmotion("Normal")
				state = 1
			else
				if #cart == 1 then
					local name = catalog[cart[1]].Item:GetDisplayName()
					msg = STRINGS:Format(MapStrings['Shop_Buy_One'], STRINGS:FormatKey("MONEY_AMOUNT", total), name)
				else
					msg = STRINGS:Format(MapStrings['Shop_Buy_Multi'], STRINGS:FormatKey("MONEY_AMOUNT", total))
				end
				UI:ChoiceMenuYesNo(msg, false)
				UI:WaitForChoice()
				result = UI:ChoiceResult()
				
				if result then
					GAME:RemoveFromPlayerMoney(total)
					for ii = 1, #cart, 1 do
						local item = catalog[cart[ii]].Item
						GAME:GivePlayerItem(item.ID, item.Amount, false)
					end
					for ii = #cart, 1, -1 do
						table.remove(catalog, cart[ii])
						table.remove(SV.base_shop, cart[ii])
					end
					
					cart = {}
					SOUND:PlayBattleSE("DUN_Money")
					UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Buy_Complete']))
					state = 0
				else
					state = 1
				end
			end
		elseif state == 3 then
			UI:SellMenu()
			UI:WaitForChoice()
			local result = UI:ChoiceResult()
			
			if #result > 0 then
				cart = result
				state = 4
			else
				state = 0
			end
		elseif state == 4 then
			local total = 0
			for ii = 1, #cart, 1 do
				local item
				if cart[ii].IsEquipped then
					item = GAME:GetPlayerEquippedItem(cart[ii].Slot)
				else
					item = GAME:GetPlayerBagItem(cart[ii].Slot)
				end
				total = total + item:GetSellValue()
			end
			local msg
			if #cart == 1 then
				local item
				if cart[1].IsEquipped then
					item = GAME:GetPlayerEquippedItem(cart[1].Slot)
				else
					item = GAME:GetPlayerBagItem(cart[1].Slot)
				end
				msg = STRINGS:Format(MapStrings['Shop_Sell_One'], STRINGS:FormatKey("MONEY_AMOUNT", total), item:GetDisplayName())
			else
				msg = STRINGS:Format(MapStrings['Shop_Sell_Multi'], STRINGS:FormatKey("MONEY_AMOUNT", total))
			end
			UI:ChoiceMenuYesNo(msg, false)
			UI:WaitForChoice()
			result = UI:ChoiceResult()
			
			if result then
				for ii = #cart, 1, -1 do
					if cart[ii].IsEquipped then
						GAME:TakePlayerEquippedItem(cart[ii].Slot)
					else
						GAME:TakePlayerBagItem(cart[ii].Slot)
					end
				end
				SOUND:PlayBattleSE("DUN_Money")
				GAME:AddToPlayerMoney(total)
				cart = {}
				UI:WaitShowDialogue(STRINGS:Format(MapStrings['Shop_Sell_Complete']))
				state = 0
			else
				state = 3
			end
		end
	end
end

function davigny.Priest_Action(chara, activator)
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  local ch = false
  UI:ChoiceMenuYesNo(STRINGS:Format(MapStrings['Togetic_0']), true)
  UI:WaitForChoice()
  ch = UI:ChoiceResult()
  if ch then
	SV.checkpoint = 
	{
	  Zone    = 'td_throwback_land', Segment  = -1,
	  Map  = 6, Entry  = 1
	}
	SOUND:PlayFanfare("Fanfare/Saving")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_1']))
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Togetic_2']))
  end
end

function davigny.Mamel_Action(chara, activator)
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  if SV.sidequest.quest05 == 2 then
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mamel_3']))
  else
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mamel_0'], CH('PLAYER').Data.Nickname))
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mamel_1']))
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Mamel_2']))
  end
end

function davigny.ChildPark_Igglybuff_Action(chara, activator)
  local questname = "Igglybuff's Strength"
  UI:SetSpeaker(chara)
  local quest_ = SV.sidequest.quest06
  if SV.global_quest.StoryProgression > 25 then
    chara.CollisionDisabled = true
	GROUND:CharTurnToChar(chara,CH('PLAYER'))
	UI:SetSpeakerEmotion("Determined")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_1']))
	UI:SetSpeakerEmotion("Special2")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_2']))
	quest_ = 1
	GROUND:MoveInDirection(chara, Direction.Down, 64, true, 4)
	COMMONEX.SidequestAccept(questname)
  else
    UI:SetSpeakerEmotion("Happy")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Igglybuff_0']))
  end
  SV.sidequest.quest06 = quest_
end

function davigny.ChildPark_Pichu_Action(chara, activator)
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  if SV.sidequest.quest06 > 1 then
    UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Pichu_4']))
  elseif SV.global_quest.StoryProgression > 16 then
    UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Pichu_3']))
  elseif SV.davigny.CorsolaMove == false then
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Pichu_0']))
  else
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Pichu_1']))
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Pichu_2']))
  end
end

function davigny.ChildPark_Wooper_Action(chara, activator)
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  if SV.sidequest.quest06 > 1 then
    UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Wooper_2']))
  elseif SV.global_quest.StoryProgression > 16 then
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Wooper_1']))
  else
    UI:SetSpeakerEmotion("Worried")
    UI:WaitShowDialogue(STRINGS:Format(MapStrings['Wooper_0']))
  end
end

function davigny.ChildPark_Smoochum_Action(chara, activator)
  GROUND:CharTurnToChar(chara,CH('PLAYER'))
  UI:SetSpeaker(chara)
  if SV.sidequest.quest06 > 1 then
    UI:SetSpeakerEmotion("Teary-Eyed")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Smoochum_3']))
  else
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Smoochum_0']))
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Smoochum_1']))
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue(STRINGS:Format(MapStrings['Smoochum_2']))
  end
end

function davigny.Teammate1_Action(chara, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  COMMON.GroundInteract(activator, chara, true)
end

function davigny.Teammate2_Action(chara, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  COMMON.GroundInteract(activator, chara, true)
end

function davigny.Teammate3_Action(chara, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  COMMON.GroundInteract(activator, chara, true)
end

function davigny.Teammate4_Action(chara, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  COMMON.GroundInteract(activator, chara, true)
end

function davigny.Teammate5_Action(chara, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  COMMON.GroundInteract(activator, chara, true)
end

function davigny.Teammate6_Action(chara, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  COMMON.GroundInteract(activator, chara, true)
end

function davigny.Teammate7_Action(chara, activator)
  DEBUG.EnableDbgCoro() --Enable debugging this coroutine
  COMMON.GroundInteract(activator, chara, true)
end

return davigny
