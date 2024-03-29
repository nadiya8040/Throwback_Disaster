--[[
    scriptvars.lua
      This file contains all the default values for the script variables. AKA on a new game this file is loaded!
      Script variables are stored in a table  that gets saved when the game is saved.
      Its meant to be used for scripters to add data to be saved and loaded during a playthrough.
      
      You can simply refer to the "SV" global table like any other table in any scripts!
      You don't need to write a default value in this lua script to add a new value.
      However its good practice to set a default value when you can!
      
      It is important to stress that this file initializes the SV table ONCE when the player begins a new save file, and NEVER EVER again.
      This means that edits on this file will NOT be added on the script variables of an already existing file!
      To upgrade existing script variables, use the OnUpgrade in script services.  Example found in Data/Script/services/debug_tools/init.lua
      
    --Examples:
    SV.SomeVariable = "Smiles go for miles!"
    SV.AnotherVariable = 2526
    SV.AnotherVariable = { something={somethingelse={} } }
    SV.AnotherVariable = function() PrintInfo('lmao') end
]]--

-----------------------------------------------
-- Services Defaults
-----------------------------------------------
SV.Services =
{
  --Anything that applies to services should be put in here, or assigned to this or a subtable of this in the service's definition script
}

-----------------------------------------------
-- General Defaults
-----------------------------------------------
SV.General =
{
  Rescue = nil,
  Starter = MonsterID("missingno", 0, "normal", Gender.Genderless)
  --Anything that applies to more than a single level, and that is too small to make a sub-table for, should be put in here ideally, or a sub-table of this
}

SV.checkpoint = 
{
  Zone    = 'nad_crystal_cave', Segment  = -1,
  Map  = 0, Entry  = 0
}


SV.adventure = 
{
  Thief    = false
}

SV.base_shop = {
	{ Index = "food_apple", Amount = 0, Price = 50},
	{ Index = "food_apple_big", Amount = 0, Price = 150},
	{ Index = "food_banana", Amount = 0, Price = 500},
	{ Index = "food_chestnut", Amount = 0, Price = 80},
	{ Index = "berry_leppa", Amount = 0, Price = 80}
}
SV.base_trades = {
	{ Item="xcl_family_bulbasaur_02", ReqItem={"",""}},
	{ Item="xcl_family_charmander_02", ReqItem={"",""}},
	{ Item="xcl_family_squirtle_02", ReqItem={"",""}}
}

SV.unlocked_trades = {
}

SV.missions =
{
  Missions = { },
  FinishedMissions = { },
}

SV.magnagate =
{
  Cards = 0
}

-----------------------------------------------
-- Throwback Disaster Defaults
-----------------------------------------------

SV.global_quest =
{
  StoryProgression = 0,
  Points = 0
}

SV.party_members =
{
  mog = { Species="tdchar_moogle", Form=0, Skin="normal", Gender=1 },
  vitaro = { Species="vitaro", Form=0, Skin="shiny", Gender=1 },
  hoopa = { Species="hoopa", Form=0, Skin="normal", Gender=2 },
  chocobo = { Species="tdchar_chocobo", Form=0, Skin="normal", Gender=1 },
  koppa = { Species="tdchar_koppa", Form=0, Skin="normal", Gender=1 },
  mili = { Species="tdchar_mili", Form=0, Skin="normal", Gender=1 },
  ddr = { Species="tdchar_ddr", Form=0, Skin="normal", Gender=1 },
  gigi = { Species="tdchar_gigi", Form=0, Skin="normal", Gender=1 },
  wumeila = { Species="tdchar_wumeila", Form=0, Skin="normal", Gender=2 },
  gapori = { Species="tdchar_gapori", Form=0, Skin="normal", Gender=0 },
  onionkuya = { Species="tdchar_onionkuya", Form=0, Skin="normal", Gender=1 },
  monya = { Species="tdchar_monya", Form=0, Skin="normal", Gender=0 }
}

SV.wipedout = false
SV.emolgadiary = 0
SV.sidequest_buneary = 0
SV.NuzleafTalk = false

SV.guest_members =
{
}

SV.hiddensidequest =
{
  celebi = 0
}

SV.sidequest =
{
  quest00 = 0, --Sick Mon
  quest01 = 0, --Ritual Stick
  quest02 = 0, --Siblings Peace
  quest03 = 0, --Missing Teddy Bear
  quest04 = 0, --Corvirevenge
  quest05 = 0, --New Love Experience
  quest06 = 0, --Igglybuff's Strength
  quest07 = 0, --
  quest08 = 0, --
  quest09 = 0, --
  quest10 = 0, --
  quest11 = 0, --
  quest12 = 0, --
  quest13 = 0, --
  quest14 = 0, --
  quest15 = 0, --
  quest16 = 0, --
  quest17 = 0, --
  quest18 = 0, --
  quest19 = 0, --
  quest20 = 0, --
  quest21 = 0, --
  quest22 = 0, --
  quest23 = 0, --
  quest24 = 0, --
  quest25 = 0, --
  quest26 = 0, --
  quest27 = 0, --
  quest28 = 0, --
  quest29 = 0, --
  quest30 = 0, --
  quest31 = 0, --
  quest32 = 0, --
  quest33 = 0, --
  quest34 = 0, --
  quest35 = 0, --
  quest36 = 0, --
  quest37 = 0, --
  quest38 = 0, --
  quest39 = 0, --
  quest40 = 0, --
  quest41 = 0, --
  quest42 = 0, --
  quest43 = 0, --
  quest44 = 0, --
  quest45 = 0, --
  quest46 = 0, --
  quest47 = 0, --
  quest48 = 0, --
  quest49 = 0, --
  quest50 = 0, --
  quest51 = 0, --
  quest52 = 0, --
  quest53 = 0, --
  quest54 = 0, --
  quest55 = 0, --
  quest56 = 0, --
  quest57 = 0, --
  quest58 = 0, --
  quest59 = 0, --
  quest60 = 0, --
  quest61 = 0, --
  quest62 = 0, --
  quest63 = 0, --
  quest64 = 0, --
  quest65 = 0, --
  quest66 = 0, --
  quest67 = 0, --
  quest68 = 0, --
  quest69 = 0, --
  quest70 = 0, --
  quest71 = 0, --
  quest72 = 0, --
  quest73 = 0, --
  quest74 = 0, --
  quest75 = 0, --
  quest76 = 0, --
  quest77 = 0, --
  quest78 = 0, --
  quest79 = 0, --
  quest80 = 0, --
  quest81 = 0, --
  quest82 = 0, --
  quest83 = 0, --
  quest84 = 0, --
  quest85 = 0, --
  quest86 = 0, --
  quest87 = 0, --
  quest88 = 0, --
  quest89 = 0, --
  quest90 = 0, --
  quest91 = 0, --
  quest92 = 0, --
  quest93 = 0, --
  quest94 = 0, --
  quest95 = 0, --
  quest96 = 0, --
  quest97 = 0, --
  quest98 = 0, --
  quest99 = 0  --
}

-----------------------------------------------
-- Level Specific Defaults
-----------------------------------------------
SV.test_grounds =
{
  SpokeToPooch = false,
  AcceptedPooch = false,
  Starter = { Species="pikachu", Form=0, Skin="normal", Gender=2 },
  Partner = { Species="eevee", Form=0, Skin="normal", Gender=1 },
  DemoComplete = false,
  Tileset = 0,
}

SV.dex = {
  CurrentRewardIdx = 1
}

SV.roaming_legends =
{
  Raikou = false,
  Entei = false,
  Suicune = false,
  Celebi = false,
  Darkrai = false
}


SV.castaway_cave = 
{
  TookTreasure  = false
}

SV.ambush_forest = 
{
  -- 0 = not started, 1 = started, 2 = failed, 3 = success, 4 = completed
  BossPhase  = 0
}

SV.treacherous_mountain = 
{
  -- 0 = not started, 1 = started, 2 = failed, 3 = success, 4 = completed
  BossPhase  = 0
}

SV.manaphy_egg = 
{
  Taken = false,
  ExpositionComplete = false,
  Hatched = false
}

SV.sleeping_caldera = 
{
  TookTreasure  = false,
  GotHeatran = false
}

SV.base_camp = 
{
  IntroComplete    = false,
  ExpositionComplete  = false,
  FirstTalkComplete  = false,
  FoodIntro  = false,
  FerryUnlocked  = false,
  FerryIntroduced  = false,
  CenterStatueDate  = "",
  LeftStatueDate  = "",
  RightStatueDate  = ""
}

SV.base_town = 
{
  Song    = "A02. Base Town.ogg",
  ValueTradeItem = "",
  ValueTraded = false,
  FreeRelearn = false,
  TutorOpen = false,
  TutorMoves = {}
}

SV.luminous_spring = 
{
  Returning    = false
}

SV.forest_camp = 
{
  ExpositionComplete  = false,
  -- 0 = not started, 1 = started, 2 = failed, 3 = success, 4 = completed
  SnorlaxPhase = 0
}

SV.cliff_camp = 
{
  ExpositionComplete  = false,
  TeamUndergrowthIntro = false
}

SV.team_retreat =
{
  Intro = false
}


SV.team_steel =
{
  Argued = false,
  DaysSinceArgue = 0,
  Rescued = false
}

SV.team_firecracker =
{
  --0 = At Cliff Camp
  --1 = At Ravine Camp
  --2 = At Cave Camp
  --3 = At Blizzard Camp, need rescue
  --4 = Rescued, talking about it
  --5 = In cycle
  Status = 0,
  SpokenTo = false,
  DaysSinceCheckpoint = 0,
  
  --0 = base camp
  --1 = forest camp
  --2 = cliff camp
  --3 = canyon camp
  --4 = cave camp
  --5 = snow camp
  --6 = summit
  Cycle = 0
}

--TODO
SV.supply_corps =
{
  --0 = Stopped at Snorlax, 
  --1 = Cleared Snorlax and headed to cliff camp,
  --2 = deliver had package stolen
  --2 (completed) = deliver had package returned,
  --3 = deliver thanks given for return,
  --4 = manager moved to canyon camp with deliver,
  --5 = spoke at canyon camp,
  --6 = carry had package stolen,
  --6 (completed) = carry had package returned,
  --7 = carry thanks given for return,
  --8 = they found the boss,
  --8 (with unlock) = gave dungeon of the boss,
  --8 (with flag) = completed the boss,
  --9 = thanks for completing the boss,
  --10 = found the new cave, set up the post
  --11 = spoke at cave
  --12 = deliver and carry beaten up,
  --12 (completed) = deliver rescued from monster house,
  --13 = deliver thanks given for return,
  --14 = found snow camp, claims they will set up post
  --15 = spoke about snow camp
  --16 = manager disappeared,
  --16 (completed) = manager rescued from monster house,
  --17 = manager thanks given for return,
  --18 = they found the boss,
  --18 (with unlock) = gave dungeon of the boss,
  --18 (with flag) = completed the boss,
  --19 = thanks for completing the boss,
  --20 = questline and mountain complete, go into cycle routine
  Status = 0,
  
  DaysSinceCheckpoint = 0,
  
  --cyclical up and down from 1 to 5 inclusive
  --0 = base camp
  --1 = forest camp
  --2 = cliff camp
  --3 = canyon camp
  --4 = cave camp
  --5 = snow camp
  --6 = summit
  CarryCycle = 0,
  
  --random from 1 to 5 inclusive
  --0 = base camp
  --1 = forest camp
  --2 = cliff camp
  --3 = canyon camp
  --4 = cave camp
  --5 = snow camp
  --6 = summit
  DeliverCycle = 0,
  
  --cyclical.  overrides the other two if in base camp or summit
  --0 = base camp
  --1 = forest camp
  --2 = cliff camp
  --3 = canyon camp
  --4 = cave camp
  --5 = snow camp
  --6 = summit
  ManagerCycle = 0
}

SV.family = 
{
  SisterActiveDays = 0,
											  
  Sister = false,
  MotherActiveDays = 0,
											  
  Mother = false,
  FatherActiveDays = 0,
											  
  Father = false,
  BrotherActiveDays = 0,
  Brother = false,
		  
  GrandmaActiveDays = 0,
											  
  Grandma = false,
  PetActiveDays = 0,
  Pet = false,
  TalkedReturn = false,
  Returned = false
}

SV.StarterTutor =
{
	Complete = false,
	Evolved = false
}

SV.canyon_camp = 
{
  ExpositionComplete = false,
  ShinyIntro = false
}

SV.rest_stop = 
{
  -- 0 = not started, 1 = started, 2 = failed, 3 = success, 4 = completed
  BossPhase = 0,
  ExpositionComplete = false,
  DaysSinceBoss = 0,
  BossSolved = false
}

SV.final_stop = 
{
  ExpositionComplete  = false
}


SV.guildmaster_trail = 
{
  FloorsCleared = 0,
  Rewarded  = false
}

SV.guildmaster_summit = 
{
  -- 0 = not started, 1 = started, 2 = failed, 3 = success, 4 = completed
  BossPhase = 0,
  GameComplete  = false,
  ClearedFromTrail  = false
}

SV.guild_hut = 
{
  ExpositionComplete = false,
  TookCard  = false,
  Portal  = false,
  BookPhase = 0
}

SV.moonlit_end = 
{
  ExpositionComplete  = false,
  BattleComplete  = false,
  BattleFailed  = false,
  ReturnVisit  = false
}

SV.garden_end = 
{
  ExpositionComplete  = false
}

----------------------------------------------