-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Signal")
Sonar("State")
local v2 = Sonar("PlaceTypeService")
local Constants = ReplicatedStorage.Storage.Constants
local t = {
	SHALLOW_OVERWRITE_CONFIGS = { "EventsConfig" },
	EventGachas = "EasterGachas",
	EventFountain = "EasterFountain",
	TutorialId = 7,
	LikeGoalTiers = { 442500, 445000, 447500, 450000 },
	MobTickRate = 2,
	WanderSpeed = 15,
	RNG = Random.new(),
	IsEventWorld = true,
	MainWorldIsEventWorld = true,
	EventHasHorseShopTimer = false,
	EventEndTime = 1781565504,
	IsTradeWorld = v2.IsMarketWorld(),
	IsTestGame = false,
	TimeBetweenTips = 480,
	Tips = {
		"<b>Stuck? Try taming a horse!</b> You can use Lassos or Food to tame your favorite breed in the wild.",
		"Exploring the world will lead to new discoveries! You might find something you haven\'t seen before.",
		"Immerse yourself by using Wild Mode and <i> become the horse </i>",
		"Your horse may be capable of more than you might imagine.. <i>some say they can even grow wings!</i>",
		"There are many distinct regions, each one has unique rewards and different horses!",
		"<b>Can\'t figure out how to tame a horse?</b> Visit the town and look for the help board!",
		"More features unlock the more tames you get. There\'s always more than meets the eye.",
		"Your horses will mix their colors, mutations, and other genetics when breeding. Potions can help get a better result!",
		"There are many potions that can help you in the wild.. visit the shop or go treasure hunting to find them!",
		"<b>Your horses can harvest resources</b>, just give an interactable object a tap and watch them earn rewards!",
		"Once you unlock a breed from the journal, you can freely tame them and work on the next one.",
		"Traveling NPCs rotate every in-game day, keep an eye out for their locations so you can find them easily.",
		"Bond with your friends like <i>Lyric, Alex and Aurelia</i> every day to earn special items and unlocks.",
		"<b> Ancient spirits </b> can be summoned.. every hour, on the hour, find a magical totem to tame one."
	},
	GroupId = 2919215,
	ZoomChangedSignal = v1.new(),
	MazeStartedSignal = v1.new(),
	HorseOriginBoosts = {
		Wild = 1.25,
		Bred = 1
	},
	DevelopmentBadges = {
		AlphaSupporter = 266980306664190,
		AlphaTester = 3546520866147777,
		BetaTester = 474083704708497,
		BetaSupporter = 3475775140678949
	},
	RaceNames = { "Meadows", "Mountains", "Plains", "Swamp", "Town", "IslandRun", "ToyRace", "CrimsonLoopTrack" },
	ItemTypeDescriptions = {
		Crafting = "\240\159\155\160\239\184\143 Can be used to craft Buildings & Materials for your plot!",
		PlushMachineMaterial = "\240\159\167\170 Can be used in the Plush Machine to edit the outcome!",
		Lasso = "\240\159\142\175 Can be used to tame wild horses!",
		Food = "\240\159\141\189 Can be used to boost your Horse and tame wild horses!",
		Equipment = "\240\159\142\169 An accessory item that can be worn on your horse!",
		Flairs = "\226\173\144 A magic cosmetic item that can be bound on your horse!",
		EquipmentPalettes = "\240\159\142\168 Used to unlock more colors for accessory customisation!",
		Buildings = "\240\159\143\160 Unlocks this building in your plot!",
		Chests = "\240\159\142\129 Can be opened for rewards and items!",
		StackableChests = "\240\159\142\129 Can be opened for rewards and items!",
		Seeds = "\240\159\140\177 Can be planted and harvested for rewards!"
	},
	ItemImages = {
		EquipmentPalettes = "rbxassetid://17445732595"
	},
	MutationDescriptions = {
		Glow = "Parts of the horse will glow with a magical aura!",
		Wings = "The horse will gain the power of flight!"
	},
	MutationImages = {
		Wings = "rbxassetid://16830500276",
		Glow = "rbxassetid://17275055613"
	},
	MaxMutationSlots = 3,
	MutationBasePriceMultipliers = {
		Default = 1.5,
		Wings = 2
	},
	TrailsSpawnTime = 900,
	TamesToUnlockBoss = 50,
	BossFightSpawnTime = 1800,
	BossFightWarningDuration = 300,
	BossFightDuration = 720,
	BossBonusChestPercentage = 7.5,
	BossTierAmounts = { 0, 100, 200 },
	BossHealthPerPlayer = { 250, 550, 850 },
	BossHealthCap = { 2500, 4500, 6500 },
	BossLuckPower = {
		Horse = 2,
		Coins = {
			Power = 1,
			Rate = 100
		}
	},
	BossFightStatConversion = { "DamageDealt", "BuckedOff", "TimeTaken", "LassosLost" },
	StableClubsPromptData = {
		FindClub = { "<font color=\'#D4A853\'><b>Stable Clubs</b></font> are social groups where players team up under a shared name and <font color=\'#D4A853\'><b>customizable banner</b></font>.", "Complete <font color=\'#D4A853\'><b>weekly missions</b></font> together to progress through <font color=\'#D4A853\'><b>5 reward tiers</b></font>. Mission goals scale with club capacity, not member count, so progress stays fair.", "Earn <font color=\'#D4A853\'><b>Club Tokens</b></font> by completing missions. Spend them in the <font color=\'#D4A853\'><b>Club Store</b></font> on exclusive items, or purchase more in the <font color=\'#D4A853\'><b>Premium Shop</b></font>.", "At the end of each cycle, <font color=\'#D4A853\'><b>top-ranking clubs</b></font> receive <font color=\'#D4A853\'><b>Predict Foal Potions</b></font> per member. More features coming soon!" },
		Leaderboard = { "Completing <font color=\'#D4A853\'><b>Club Missions</b></font> earns you rewards instantly, but repeating them also earns <font color=\'#D4A853\'><b>extra points</b></font> that count toward the <font color=\'#D4A853\'><b>Club Leaderboard</b></font>.", "At the end of each leaderboard period (Once at the end of the week), the <font color=\'#D4A853\'><b>Top 30 clubs</b></font> receive special bonus rewards based on their rank. Higher placements receive <font color=\'#D4A853\'><b>all rewards</b></font> from lower tiers too!", "<font color=\'#D4A853\'><b>Top 10</b></font> receive a Tier 3 Leader Chest.\n\n<font color=\'#D4A853\'><b>Top 20</b></font> receive a Tier 2 Leader Chest.\n\n<font color=\'#D4A853\'><b>Top 30</b></font> receive a Tier 1 Leader Chest.", "The more missions you complete and repeat, the <font color=\'#D4A853\'><b>higher you climb</b></font>. More points means better leaderboard rewards! The leaderboard reward is earned once a week." },
		ManageMembers = { "Clubs start with <font color=\'#D4A853\'><b>4 member slots</b></font>, expandable up to <font color=\'#D4A853\'><b>20</b></font>.", "Assign roles to members:\n\n<font color=\'#D4A853\'><b>Leader</b></font> \226\128\147 Full permissions\n<font color=\'#D4A853\'><b>Stable Officer</b></font> \226\128\147 Manage members & edit info\n<font color=\'#D4A853\'><b>Stable Hand</b></font> \226\128\147 Invite new members\n<font color=\'#D4A853\'><b>Member</b></font> \226\128\147 Participate normally", "Complete <font color=\'#D4A853\'><b>weekly missions</b></font> together for exclusive rewards. <font color=\'#D4A853\'><b>Leaders</b></font> get a bonus reward per milestone!" },
		CreateClubText = { "The <font color=\'#D4A853\'><b>Club Leader</b></font> can change the <font color=\'#D4A853\'><b>club icon</b></font> and <font color=\'#D4A853\'><b>banner</b></font> at any time.", "When a club is created, the leader receives a <font color=\'#D4A853\'><b>Club Chest</b></font> as a special reward for starting the club.", "More <font color=\'#D4A853\'><b>features and rewards</b></font> are coming in future updates!" },
		ClubMissionPoints = { "<font color=\'#D4A853\'><b>Missions</b></font> no longer reset when you join or leave a club.", "If you leave a club, any <font color=\'#D4A853\'><b>points you contributed</b></font> will be removed from the <font color=\'#D4A853\'><b>club total</b></font>.", "After leaving a club, there is a <font color=\'#D4A853\'><b>1-day cooldown</b></font> before you can start contributing points again." },
		EarnMorePoints = {
			Harvest = "<font color=\'#D4A853\'><b>Harvest a resource</b></font> for <font color=\'#D4A853\'><b>5 points</b></font>",
			Tame = "<font color=\'#D4A853\'><b>Tame a horse</b></font> for <font color=\'#D4A853\'><b>5 points</b></font>",
			BondRequest = "Complete a <font color=\'#D4A853\'><b>bond request</b></font>: <font color=\'#D4A853\'><b>15 points</b></font>",
			BossParticipation = "<font color=\'#D4A853\'><b>Participate in a boss</b></font> for <font color=\'#D4A853\'><b>50 points</b></font>",
			BossClear = "<font color=\'#D4A853\'><b>Clear a boss</b></font> for <font color=\'#D4A853\'><b>150 points</b></font>",
			DailyLoginDay7 = "Complete <font color=\'#D4A853\'><b>Day 7</b></font> of the daily login reward: <font color=\'#D4A853\'><b>500 points</b></font>",
			DailyLogin = "Complete <font color=\'#D4A853\'><b>1 daily login reward</b></font>: <font color=\'#D4A853\'><b>200 points</b></font>",
			Elder = "<font color=\'#D4A853\'><b>Elder a horse</b></font> for <font color=\'#D4A853\'><b>200 points</b></font>",
			Breed = "<font color=\'#D4A853\'><b>Breed a horse</b></font> for <font color=\'#D4A853\'><b>10 points</b></font>",
			Foal = "<font color=\'#D4A853\'><b>Foal a horse</b></font> for <font color=\'#D4A853\'><b>10 points</b></font>",
			DailyMission = "Complete a <font color=\'#D4A853\'><b>daily mission</b></font>: <font color=\'#D4A853\'><b>150 points</b></font>"
		}
	},
	RandomEquipmentDropThemeChance = 0.15,
	RandomEquipmentDropThemes = {},
	RandomDrops = {
		RandomFlair = {},
		RandomEquipment = {},
		RandomPalette = {}
	},
	StarterPresets = { "DarkBrown", "LightBrown", "Brown", "DarkDullBrown", "LightDullBrown", "Tan", "Cream" },
	EquipmentBodyPartTypes = { "Hat", "Head", "Mouth", "Saddle", "Leg", "Tail", "Flair" },
	BodyPartAttachRegions = {
		"Hat",
		"Head",
		"Mouth",
		"Saddle",
		"Leg",
		"Tail",
		"Hind",
		"Side",
		"EarL"
	},
	MAX_STAT_LEVEL = 10,
	FertilityExperiencePerBreed = 75,
	TamingNeedleSpeedMultiplierPerValidRarityTier = { 0.75, 0.5, 0.25, 0.05 },
	TamingNeedleSpeedMultiplierPerInvalidRarityTier = { 1.75, 2.5, 3.5, 4.75 },
	TotalSpeciesMobs = {
		Horse = 32,
		Unicorn = 3,
		Gargoyle = 3,
		Bisorse = 5,
		Equus = 10,
		Pony = 10,
		Caprine = 10,
		Kelpie = 2,
		Peryton = 8,
		Fae = 3,
		Flora = 4,
		Hippocampus = 5,
		Cactaline = 3
	},
	TotalClientMobs = {
		Horse = 20,
		Unicorn = 4,
		Gargoyle = 4,
		Bisorse = 10,
		Equus = 12,
		Pony = 12,
		Caprine = 12,
		Kelpie = 4,
		Peryton = 8,
		Fae = 4,
		Flora = 4,
		Hippocampus = 6
	},
	MaterialSounds = {
		Grass = { "rbxassetid://16430952292", "rbxassetid://16430953930" },
		Sand = { "rbxassetid://16430952151", "rbxassetid://16430953764" },
		Stone = { "rbxassetid://16430952936", "rbxassetid://16430953287" },
		Wood = { "rbxassetid://16430954713", "rbxassetid://16430954982", "rbxassetid://16430954173" },
		Water = { "rbxassetid://16430955323", "rbxassetid://16430955534" },
		Ground = { "rbxassetid://619184927", "rbxassetid://619156934" }
	},
	MaterialToSoundMap = {
		[Enum.Material.Grass] = "Grass",
		[Enum.Material.LeafyGrass] = "Grass",
		[Enum.Material.LeafyGrass] = "Grass",
		[Enum.Material.Asphalt] = "Grass",
		[Enum.Material.Cobblestone] = "Stone",
		[Enum.Material.Sandstone] = "Grass",
		[Enum.Material.Limestone] = "Sand",
		[Enum.Material.Sand] = "Sand",
		[Enum.Material.Rock] = "Stone",
		[Enum.Material.Slate] = "Stone",
		[Enum.Material.Basalt] = "Stone",
		[Enum.Material.Salt] = "Ground",
		[Enum.Material.Ground] = "Ground",
		[Enum.Material.Wood] = "Wood",
		[Enum.Material.WoodPlanks] = "Wood",
		[Enum.Material.Mud] = "Water"
	},
	TerrainMaterials = {
		[Enum.Material.Grass] = {
			Texture = "http://www.roblox.com/asset/?id=13281225644",
			Color = ColorSequence.new(Color3.new(0.823529, 1, 0.654902))
		},
		[Enum.Material.LeafyGrass] = {
			Texture = "http://www.roblox.com/asset/?id=13281225644",
			Color = ColorSequence.new(Color3.new(0.439216, 0.568627, 0.219608))
		},
		[Enum.Material.Asphalt] = {
			Texture = "http://www.roblox.com/asset/?id=13281225644",
			Color = ColorSequence.new(Color3.new(0.223529, 0.541176, 0.298039))
		},
		[Enum.Material.Ground] = {
			Texture = "http://www.roblox.com/asset/?id=12135164169",
			Color = ColorSequence.new(Color3.new(0.443137, 0.247059, 0.172549))
		},
		[Enum.Material.Salt] = {
			Texture = "http://www.roblox.com/asset/?id=12135164169",
			Color = ColorSequence.new(Color3.new(0.678431, 0.466667, 0.368627))
		},
		[Enum.Material.Mud] = {
			Texture = "http://www.roblox.com/asset/?id=12135164169",
			Color = ColorSequence.new(Color3.new(0.619608, 0.380392, 0.301961))
		},
		[Enum.Material.Sandstone] = {
			Texture = "http://www.roblox.com/asset/?id=12135164169",
			Color = ColorSequence.new(Color3.new(0.619608, 0.380392, 0.301961))
		},
		[Enum.Material.Sand] = {
			Texture = "http://www.roblox.com/asset/?id=12135164169",
			Color = ColorSequence.new(Color3.new(0.862745, 0.745098, 0.580392))
		},
		[Enum.Material.Limestone] = {
			Texture = "http://www.roblox.com/asset/?id=12135164169",
			Color = ColorSequence.new(Color3.new(1, 0.952941, 0.752941))
		}
	},
	AFK_TIME = 20,
	MaxAnimalNameLength = 20,
	MaxPlotSaveNameLength = 20,
	ItemLimits = {
		Animals = 15,
		EquippedAnimals = 2,
		Inventory = 100,
		Buildings = 100,
		AnimalStorage = 10
	},
	HarvestAnimations = { "ShortBuck", "JumpBuck", "RearKick", "Collapse" },
	RidingHarvestAnimations = { "ShortBuck", "RearKick" },
	StaminaDrainStates = {
		RaceSprint = 1,
		Gallop = 4,
		Canter = 8
	},
	StaminaRegenStates = {
		Trot = 4,
		Walk = 5,
		Idle = 6
	}
}
t.SPRINT_SPEED = if v2.IsMarketWorld() then 42 else 26
t.WALK_SPEED = if v2.IsMarketWorld() then 32 else 16
t.CROUCH_SPEED = 12
t.CROUCH_ANIMATION = "rbxassetid://15961542108"
t.CROUCH_WALK_ANIMATION = "rbxassetid://15961594508"
t.PET_HORSE_ANIMATION = "rbxassetid://107580645849701"
t.UPLIFTED_WING_IDLE_ANIMATION = "rbxassetid://18613004192"
t.BASE_HORSE_PRICE = 50
t.ADULT_PRICE_MULTIPLIER = 2
t.AFK_TIMEOUT = 5
t.MaxPaintsPerSlot = 1
t.MaxCosmeticsPerSlot = 1
t.MaxPatternsPerSlot = 1
t.MaxPaintsPerClient = 0
t.MaxCosmeticsPerClient = 0
t.MaxPatternsPerClient = 0
t.MaxBredPaintsPerSlot = 2
t.MaxBredCosmeticsPerSlot = 4
t.MaxBredPatternsPerSlot = 4
t.WildMutationSlotChances = {
	{
		Amount = 0,
		P = 60
	},
	{
		Amount = 1,
		P = 27.5
	},
	{
		Amount = 2,
		P = 10
	},
	{
		Amount = 3,
		P = 2.5
	}
}
t.IsClient = RunService:IsClient()
t.IsServer = RunService:IsServer()
t.IsStudio = RunService:IsStudio()
t.KirinEggCooldown = 86400
t.MinOceanY = -500
t.MaxOceanY = -5000
t.MAX_WORLD_SIZE = 7000
t.MIN_WORLD_Y = -5
t.MobileInput = 3
t.InteractFocusedOrder = -1
t.InteractUnfocusedOrder = -3
t.InteractOpenOrder = -2
t.TriggerInputs = {
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.Touch] = true,
	[Enum.KeyCode.X] = true
}
t.RemoteStorageName = "Remotes"
t.WorkspaceStorageName = "WorkspaceStorage"
t.RequestTimeout = 30
t.ProductHandlers = {}
t.GamepassHandlers = {}
t.AssetHandlers = {}
t.PlayerTag = "Player"
t.PlayerInitTag = "ClientPlayerInit"
t.LoadedPlayerTag = "ClientLoadedPlayer"
t.CharacterTag = "Character"
t.AnimalTag = "Animal"
t.AnimalWithCosmeticsTag = "AnimalCosmetics"
t.TimeSyncStart = 1622419200
t.WorkspaceGuiClasses = {
	SurfaceGui = true,
	BillboardGui = true
}
t.DefaultToGameStates = {
	RenderGlobalMobs = true,
	ShowPlayerAnimals = true,
	ClosedChatForTutorial = false
}
t.GameStates = {
	RenderGlobalMobs = false,
	ShowPlayerAnimals = true,
	OpenHUDOnBreed = false,
	OpenBreedingFromStablesHUD = false,
	AutoFillHorsesInBreeding = false,
	HarvestingRange = false,
	HarvestingHitboxScale = false,
	FullViewportDisplaySize = false,
	HideDisplayTopFrame = false,
	ClosedChatForTutorial = false,
	Lassoing = false
}
t.GameStateChangedSignal = v1.new()
t.ResetHUDSignal = v1.new()
t.PlayerLoadedOnClient = v1.new()
t.StoppedChattingSignal = v1.new()
t.IntroSignal = v1.new()
t.HadIntroSignal = v1.new()
t.HadIntro = false
t.TabSelectedAttribute = "TabSelected"
t.SelectedAttribute = "HeldSelected"
t.RequestSettings = { "NoOne", "Friends", "Party", "Everyone" }
t.PlayerWrappers = {}
t.TeleportHandlers = {}
t.AssetString = "rbxthumb://type=Asset&id=%s&w=150&h=150"
t.HighResAssetString = "rbxthumb://type=Asset&id=%s&w=420&h=420"
t.VariableWorldspaceGuiTag = "VariableWorldspaceGui"
t.WorldspaceGuiTag = "ConstantWorldspaceGui"
t.AnimationSignals = {}
t.InputTypes = {
	Keyboard = 1,
	Gamepad = 2,
	Touch = 3
}
t.ResetBindable = Instance.new("BindableEvent")
t.PlayerAddedSignal = v1.new()
t.PlayerRemovedSignal = v1.new()
t.Poses = {
	Sit = "rbxassetid://15741483553"
}
t.PriorityTable = {
	Fall = Enum.AnimationPriority.Action4,
	Jump = Enum.AnimationPriority.Action4,
	Idle = Enum.AnimationPriority.Idle,
	Walk = Enum.AnimationPriority.Movement,
	Trot = Enum.AnimationPriority.Action,
	Canter = Enum.AnimationPriority.Action2,
	Gallop = Enum.AnimationPriority.Action3,
	RaceSprint = Enum.AnimationPriority.Action4,
	JumpBuck = Enum.AnimationPriority.Action4,
	Collapse = Enum.AnimationPriority.Action4,
	ShortBuck = Enum.AnimationPriority.Action4,
	RearKick = Enum.AnimationPriority.Action4,
	FlyForward = Enum.AnimationPriority.Action3,
	FlyIdle = Enum.AnimationPriority.Action3,
	Glide = Enum.AnimationPriority.Action3,
	Dive = Enum.AnimationPriority.Action3,
	Stretch = Enum.AnimationPriority.Action,
	Shuffle = Enum.AnimationPriority.Action,
	Reach = Enum.AnimationPriority.Action,
	Ruffle = Enum.AnimationPriority.Action,
	Stomp = Enum.AnimationPriority.Movement,
	HappyStomp = Enum.AnimationPriority.Movement,
	Sit = Enum.AnimationPriority.Movement,
	Lay = Enum.AnimationPriority.Movement,
	Piaffe = Enum.AnimationPriority.Movement,
	LegRest = Enum.AnimationPriority.Movement,
	LiftedSit = Enum.AnimationPriority.Movement
}
t.Gaits = { "Reverse", "Idle", "Walk", "Trot", "Canter", "Gallop" }
t.CompressedAnimalData = {
	Health = "h",
	MaxHealth = "mh",
	Damage = "d",
	Speed = "s",
	SprintSpeed = "ss",
	RunAnimationSpeed = "ras",
	WalkAnimationSpeed = "was",
	FlySpeed = "fs",
	DisableMovement = "dm"
}
t.DoNotRoundAnimalData = {
	RunAnimationSpeed = true,
	WalkAnimationSpeed = true,
	AbilityCooldown = true,
	Speed = true,
	SprintSpeed = true,
	JumpHeight = true,
	HarvestStrength = true,
	TraitInheritanceMultiplier = true,
	GestationTimeMultiplier = true,
	ScaleMultiplier = true,
	MutationInheritanceMultiplier = true,
	StrengthExperience = true,
	BondExperience = true,
	AgilityExperience = true,
	FertilityExperience = true,
	JumpExperience = true,
	CanterAnimationSpeed = true,
	GallopAnimationSpeed = true
}
t.ExcludedAnimalDataFromReplication = {
	TraitInheritanceMultiplier = true,
	MutationInheritanceMultiplier = true,
	StrengthExperience = true,
	BondExperience = true,
	AgilityExperience = true,
	FertilityExperience = true,
	JumpExperience = true
}
t.ButtonColors = {
	Purple = {
		UnderColor = Color3.fromRGB(83, 55, 130),
		UpperColor = Color3.fromRGB(162, 108, 255),
		StrokeColor = Color3.fromRGB(83, 55, 130)
	},
	Grey = {
		UnderColor = Color3.fromRGB(94, 94, 94),
		UpperColor = Color3.fromRGB(170, 170, 170),
		StrokeColor = Color3.fromRGB(94, 94, 94)
	},
	Green = {
		UnderColor = Color3.fromRGB(92, 132, 39),
		UpperColor = Color3.fromRGB(177, 255, 75),
		StrokeColor = Color3.fromRGB(92, 132, 39)
	},
	Red = {
		UnderColor = Color3.fromRGB(143, 21, 40),
		UpperColor = Color3.fromRGB(254, 38, 68),
		StrokeColor = Color3.fromRGB(143, 21, 40)
	},
	Yellow = {
		UnderColor = Color3.fromRGB(141, 94, 18),
		UpperColor = Color3.fromRGB(255, 170, 32),
		StrokeColor = Color3.fromRGB(141, 94, 18)
	}
}
t.NotifyTypes = {
	"TagMinigameStart",
	"EventBadgeEarned",
	"LeftCostumeContest",
	"EnterCostumeContest",
	"CostumeContest",
	"CostumeClashSoon",
	"CostumeClashInProgress",
	"CostumeClashCooldown",
	"CostumeSubmissionSuccess",
	"CostumeNotEnoughPlayers",
	"CostumeNotSubmitted",
	"TamingSuccess",
	"ClaimedChest",
	"AssistTamingSuccess",
	"MaxHorses",
	"MaxInventory",
	"PurchasedHorseShopSlot",
	"RandomMutation",
	"RandomPattern",
	"NoAssistContribution",
	"GaveInfertility",
	"InstantFoal",
	"GenderSwap",
	"GaveMutation",
	"AuctionNoSyncData",
	"AuctionJoinedDuring",
	"AuctionExpired",
	"AuctionFinished",
	"AuctionCompleted",
	"DataSynced",
	"LassoLost",
	"BossFight",
	"MarketNoSyncData",
	"MailboxNoSyncData",
	"SetUpliftedWings",
	"TouchNodeComplete",
	"EventHorseSpawned",
	"EventHorseFound",
	"MailboxItemReceived",
	"MutationHorseSpawned",
	"MutationHorseFound",
	"EventEggSpawned",
	"BossAnger",
	"GlobalBossStart"
}
t.PresetColors = {
	Default = {
		TextColor = Color3.fromRGB(255, 255, 255),
		TextStrokeColor = Color3.fromRGB(0, 0, 0),
		ShadowColor = Color3.fromRGB(27, 42, 53)
	},
	Green = {
		TextColor = Color3.fromRGB(177, 255, 75),
		TextStrokeColor = Color3.fromRGB(0, 56, 37),
		ChatColor = Color3.fromRGB(177, 255, 75)
	},
	Red = {
		TextColor = Color3.fromRGB(254, 38, 68),
		TextStrokeColor = Color3.fromRGB(86, 12, 6),
		ChatColor = Color3.fromRGB(254, 38, 68)
	},
	Yellow = {
		TextColor = Color3.fromRGB(255, 171, 14),
		TextStrokeColor = Color3.fromRGB(118, 33, 0),
		ChatColor = Color3.fromRGB(255, 171, 14)
	},
	Purple = {
		TextColor = Color3.fromRGB(183, 52, 218),
		TextStrokeColor = Color3.fromRGB(52, 18, 100),
		ChatColor = Color3.fromRGB(183, 52, 218)
	},
	Blue = {
		TextColor = Color3.fromRGB(18, 165, 228),
		TextStrokeColor = Color3.fromRGB(13, 11, 105),
		ChatColor = Color3.fromRGB(18, 165, 228)
	},
	Admin = {
		Prefix = "[GLOBAL ANNOUNCEMENT]",
		TextSize = 18,
		WAIT_TIME_MULTIPLIER = 4,
		Font = Enum.Font.GothamBlack,
		TextColor = Color3.fromRGB(245, 0, 253),
		TextStrokeColor = Color3.fromRGB(98, 0, 131),
		ChatColor = Color3.fromRGB(194, 0, 228)
	}
}
t.ResetDataValues = {
	Age = 1,
	Gender = "",
	Species = "",
	Serial = "",
	Origin = "",
	Nickname = "",
	Favorite = false,
	GivenFirstName = false,
	InStorage = false
}
t.IndexedItemDrops = { "Coins", "Food", "Buildings", "Potions", "Equipment", "EquipmentPalettes", "Flairs", "Seeds" }
t.TraitImages = {
	Cosmetics = "rbxassetid://16389619033",
	Horns = "rbxassetid://16190545512",
	Furs = "rbxassetid://16389619033",
	Paints = "rbxassetid://16190552987",
	Patterns = "rbxassetid://81818282600532",
	Tails = "rbxassetid://16190549315",
	Manes = "rbxassetid://16190547315",
	Ears = "rbxassetid://84351950384671",
	Whiskers = "rbxassetid://134902846968446",
	Sticker = "rbxassetid://134902846968446"
}
t.AgeImages = {
	Elder = "rbxassetid://136997448022805",
	Adult = "rbxassetid://16382958428",
	Baby = "rbxassetid://16382958286",
	Teen = "rbxassetid://16382958121"
}
t.TameContestPoints = {
	Horse = 1,
	Pony = 1,
	Equus = 1,
	Bisorse = 2,
	AkhalTeke = 2,
	Caprine = 3,
	Unicorn = 4,
	Gargoyle = 4,
	Clydesdale = 4,
	Friesian = 6,
	Kelpie = 6,
	Peryton = 6,
	Cactaline = 6,
	Fae = 7,
	Flora = 8,
	Hippocampus = 9,
	Felorse = 9,
	Anticorn = 9
}
t.AnySpeciesTable = {
	"Horse",
	"Pony",
	"Equus",
	"Bisorse",
	"Caprine",
	"Unicorn",
	"Gargoyle",
	"Kelpie",
	"Peryton",
	"Fae",
	"Flora",
	"Plush",
	"Cybred",
	"Saurequine",
	"Hippocampus",
	"Kirin",
	"Cactaline",
	"Clydesdale",
	"Felorse",
	"Friesian",
	"Celestial",
	"AkhalTeke",
	"Seraph",
	"Anticorn",
	"Nephyrian",
	"Fjord",
	"Caniquine"
}
t.AnyThemeTable = {
	"Amethyst",
	"Berry",
	"BlueAgate",
	"Blueberry",
	"Cloud",
	"Clover",
	"Coffee",
	"Cookie",
	"Floral",
	"Fossilized",
	"Galaxy",
	"Gift",
	"Gold",
	"Heavenly",
	"Lemon",
	"Magma",
	"Moon",
	"Nature",
	"Nebula",
	"Obsidian",
	"Ocean",
	"Opal",
	"Ruby",
	"Sakura",
	"Sun",
	"Thunder",
	"Void"
}
t.PredictBreedingPrice = 10
t.PredictColorPrice = 20
t.EquipmentPaletteLimit = 100
t.PotionLimit = 100
t.BundleResetTime = 1800
t.FairiesInWorld = 10
t.RequiredBondLevel = 0.2
t.RequiredFertilityLevel = 8
t.RaceStartedSignal = v1.new()
t.HorseTrainingExperiencePercentage = {
	OneToFour = 25,
	FourToSeven = 12,
	SevenToTen = 8,
	OverTen = 1
}
t.AnticornSpawnChance = 10
t.RarityWeights = {
	Common = 1,
	Uncommon = 2,
	Rare = 3,
	Epic = 4,
	Legendary = 5,
	Exclusive = 6
}
t.SpeciesNeededForStorage = 10
t.MaxBossDistance = 100
t.FoodDonationDisabledPresets = {
	"VioletArmor",
	"PurpleYellow",
	"PurpleKnight",
	"BlueLav",
	"VioletGlass",
	"PurpleDusk",
	"RedStone",
	"OrangeCarrot",
	"Lettuce",
	"VegetableMedley",
	"Albinoish",
	"SkyBlue",
	"LightBlue",
	"LightPink",
	"LightOrange",
	"SeaGreenGem",
	"HollyBlueGold",
	"CarouselWeathered",
	"PastelYellow",
	"PastelSea",
	"PastelPurple",
	"PastelPeach",
	"HollyCookie",
	"HollyChristmas",
	"HollySnow",
	"AlcesRedWhite",
	"AlcesFir",
	"AlcesFestive",
	"AlcesWinter",
	"AlcesIceSnap",
	"AlcesBlack",
	"AlcesWhite",
	"AlcesIce",
	"AlcesTan",
	"AlcesCream",
	"HauntVoid",
	"EquenPurple",
	"PurpleGem",
	"PastryPurple",
	"PastryChocRas",
	"PastryMint",
	"PastryBrown",
	"PastryCotton",
	"PastryOrange",
	"PastryMatcha",
	"HeartWood",
	"HeartPassion",
	"HeartLove",
	"HeartHurt",
	"GhoulStone",
	"GhoulSwamp",
	"GhoulSpectral",
	"GhoulStone",
	"GhoulWere",
	"GhoulHell",
	"GhoulPumpkin",
	"GhoulUndead",
	"GhoulVampire",
	"GhoulBat",
	"Rotted",
	"Hauntbrown",
	"HauntVoid",
	"HauntCandy",
	"HauntGrey",
	"EquenOrange",
	"EquenPurple",
	"EquenSea",
	"EquenDust",
	"PlushNeapolitan",
	"PlushNeapolitan2",
	"PlushMatchaBoba",
	"PlushRainbowSherbet",
	"MoonL",
	"MoonD",
	"Morpho",
	"LunarMoth",
	"Demon",
	"Nightmare",
	"Vampire",
	"Poison",
	"DartFrog",
	"PinkLemonade",
	"Vaporwave",
	"Magma",
	"JewelBeetle",
	"CottonCandy",
	"Dango",
	"Yellowjacket",
	"Bumblebee",
	"Honeybee",
	"LegoCoolYellowWhite",
	"LegoFlameOrangeWhite",
	"LegoOrangeYellow",
	"LegoAzurePink",
	"LegoSpringGreenWhite",
	"LegoAzureWhite",
	"LegoPinkWhite",
	"LegoBlackWhite",
	"LegoWhiteBlack",
	"LegoWhiteDarkGreen",
	"LegoNougatBlack",
	"LegoWhiteAzure",
	"LegoWhitePink",
	"LegoBlackYellow",
	"LegoBlackAzure",
	"LegoBlackViolet",
	"LegoBlackPink",
	"LegoBlackNougat",
	"LegoHoney",
	"LegoSky",
	"LegoLemonade",
	"LegoViolet",
	"LegoYellow",
	"LegoOlive",
	"PastryFunberry",
	"PastrySadberry",
	"LegoBrown",
	"LegoPurple",
	"LegoBlue",
	"PurpleBorealis",
	"FrozenLake",
	"Peppermint",
	"BlackHole",
	"Alien",
	"Amber",
	"Geode",
	"OpalGem",
	"RockyCrystal",
	"GreenMarble",
	"SeaGreenGem",
	"VioletGem",
	"PurpleGem",
	"CarouselToy",
	"CarouselBarber",
	"CarouselDefault",
	"CarouselFortune",
	"CarouselVintage",
	"Clown",
	"Carnival",
	"CarrotCake",
	"Porcelain",
	"MoonMutation",
	"SunMutation",
	"EasterBunny",
	"AlbinoBunny",
	"Albinoish",
	"WolpPink",
	"WolpGray",
	"WolpTricolor",
	"WolpBlackCalico",
	"WolpCalico",
	"Easter",
	"Cupid",
	"Void",
	"Heavenly",
	"PastryChocRas",
	"PastryCotton",
	"Poison",
	"AuroraBorealis",
	"Halloween",
	"Beetlejuice",
	"Sun",
	"RedVelvet",
	"BlossomTree",
	"CherryBlossom",
	"VividPink",
	"AstralColor",
	"GargoyleBlossom",
	"RoseGarden",
	"SoftSunset",
	"GreenArtisan",
	"OrangeArtisan",
	"StockArtisan",
	"CybredRed",
	"BlueArcana",
	"PinkBlack",
	"FloraMulti",
	"HeartSun",
	"HeartFire",
	"WhitePink",
	"CrackedLava",
	"PastryIce",
	"Pink",
	"PastrySakura",
	"EerieMoonlight",
	"Mesa"
}
t.TrailSettings = {
	MaxRaceDuration = 480,
	PreRaceCountdown = 3,
	LoadTimeout = 15,
	ResultsDisplayDuration = 5,
	TotalCheckpoints = 0,
	Laps = 2,
	TeleportBack = true,
	LootAmount = 3,
	SpawnInterval = 900,
	SpawnChance = 0.3,
	StandDuration = 10,
	PermanentTrails = { "Beach", "Meadows" },
	LootTable = {
		{
			Name = "Coins",
			Amount = 100,
			P = 0.85
		},
		{
			Name = "TornLasso",
			Amount = 1,
			P = 0.5
		},
		{
			Name = "WesternLasso",
			Amount = 1,
			P = 0.5
		},
		{
			Name = "WovenLasso",
			Amount = 1,
			P = 0.5
		},
		{
			Name = "BraidedLasso",
			Amount = 1,
			P = 0.5
		},
		{
			Name = "GoldLasso",
			Amount = 1,
			P = 0.5
		},
		{
			Name = "RainbowLasso",
			Amount = 1,
			P = 0.5
		},
		{
			Name = "AppleSeed",
			Amount = 3,
			P = 0.5
		},
		{
			Name = "CropSeed",
			Amount = 3,
			P = 0.5
		},
		{
			Name = "FlowerSeed",
			Amount = 3,
			P = 0.5
		},
		{
			Name = "FruitSeed",
			Amount = 3,
			P = 0.5
		},
		{
			Name = "Meadowsweet",
			Amount = 5,
			P = 0.5
		},
		{
			Name = "Peppermint",
			Amount = 5,
			P = 0.5
		},
		{
			Name = "VibrantDaylilies",
			Amount = 5,
			P = 0.5
		},
		{
			Name = "BrightPansies",
			Amount = 5,
			P = 0.5
		},
		{
			Name = "YouthPotion",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "GrowthPotion",
			Amount = 1,
			P = 0.1
		},
		{
			Name = "Sprout",
			Amount = 1,
			P = 0.35
		},
		{
			Name = "AcornBeret",
			Amount = 1,
			P = 0.35
		},
		{
			Name = "CapybaraPlush",
			Amount = 1,
			P = 0.35
		},
		{
			Name = "FatFrogPlush",
			Amount = 1,
			P = 0.35
		},
		{
			Name = "AntPlush",
			Amount = 1,
			P = 0.35
		},
		{
			Name = "FroggyBucketHat",
			Amount = 1,
			P = 0.35
		},
		{
			Name = "PonySatyrSaddle",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "PonySatyrSocks",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "PonySatyrBridle",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "FaeSatyrSaddle",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "FaeSatyrSocks",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "FaeSatyrBridle",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "CaprineSatyrBridle",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "CaprineSatyrSaddle",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "CaprineSatyrSocks",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "UnicornSatyrBridle",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "UnicornSatyrSaddle",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		},
		{
			Name = "UnicornSatyrSocks",
			Theme = "Random",
			Amount = 1,
			P = 0.05
		}
	}
}
t.FoodDonationDisabledSpecies = {
	"Fairy",
	"Foal",
	"Fairie",
	"Serpentina",
	"Horlse",
	"Alces",
	"Equenari",
	"Honeytrot",
	"Hollyhoof",
	"Wolper",
	"Ghoulsteed",
	"Hauntmare",
	"Heartbane",
	"Pastrequine"
}
t.HotbarInventoryCategories = { "Food", "Tools", "Seeds", "Potions", "Capsules", "ItemCapsules" }
for v5, v6 in t.GameStates do
	if t.DefaultToGameStates[v5] == nil then
		t.DefaultToGameStates[v5] = v6
	end
end
local function v7(p1) --[[ addConstantList | Line: 1067 | Upvalues: t (copy), Sonar (copy), v2 (copy), v7 (copy) ]]
	if p1:IsA("ModuleScript") then
		t[p1.Name] = Sonar(p1)
		for v1, v22 in p1:GetChildren() do
			if v22.Name == v2.GetPlaceType() then
				for v3, v4 in Sonar(v22) do
					t[p1.Name][v3] = v4
				end
			end
		end
	else
		if not p1:IsA("Folder") then
			return
		end
		for v5, v6 in p1:GetChildren() do
			v7(v6)
		end
	end
end
Constants.DescendantAdded:Connect(v7)
for v8, v9 in Constants:GetChildren() do
	v7(v9)
end
for v10, v11 in script:GetChildren() do
	if v11.Name == v2.GetPlaceType() then
		for v12, v13 in Sonar(v11) do
			t[v12] = v13
		end
	end
end
return t