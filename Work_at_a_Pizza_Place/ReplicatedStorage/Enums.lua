-- https://lua.expert/
local t = {
	Year = 2025,
	TesterOnly = true,
	BackupVersion = 4,
	RevertMaxTime = nil,
	PlushiePromoEndTick = 1720890000,
	MainGameId = 47545,
	TestGameId = 66680189,
	BranchGameId = 136378222,
	PizzaPlaceId = 192800,
	PizzaPlacePartyId = 191029074,
	PizzaPlaceInsideUniverseTestId = 138687392359748,
	PizzaPlaceVoiceChatId = 8080952959,
	PizzaPlaceChinaId = 7783264186,
	PizzaPlaceChinaTestId = 7782875357,
	PizzaPlaceTestId = 142872308,
	PizzaPlacePartyTestId = 191851816,
	PizzaPlaceVoiceChatTestId = 8080188707,
	PizzaPlaceBranchId = 35937363,
	PizzaPlacePartyBranchId = 4146150955,
	TrickOrTreatId = 79528535462974,
	TrickOrTreatTestId = 4201882723,
	StoryLobbyId = 5777826399,
	StoryLobbyTestId = 5777410634,
	StoryId = 5777826766,
	StoryTestId = 5777421636,
	DeathMeterStart = 300,
	Cutables = {
		Dough = true,
		MountainDew = true,
		BoxOpen = true,
		SupplyBox = true
	},
	Dragables = {
		Dough = true,
		Pizza = true,
		MountainDew = true,
		Dew = true,
		BoxClosed = true,
		SupplyBox = true,
		CutObject = true
	}
}
local t2 = {}
local t3 = {
	AssetId = 2506610512,
	CandyType = "Roll"
}
t3.Price = if t.IsTestPlace then 1 else 50
t3.DisplayPadding = Vector2.new(4, 4)
local t4 = {
	AssetId = 547503627,
	CandyType = "Roll"
}
t4.Price = if t.IsTestPlace then 1 else 20
t4.DisplayPadding = Vector2.new(2, 2)
local t5 = {
	AssetId = 742667291,
	CandyType = "Roll"
}
t5.Price = if t.IsTestPlace then 1 else 40
t5.DisplayPadding = Vector2.new(2, 2)
local t6 = {
	AssetId = 760716529,
	CandyType = "CandyCorn"
}
t6.Price = if t.IsTestPlace then 1 else 25
t6.DisplayPadding = Vector2.new(2, 2)
local t7 = {
	AssetId = 547204787,
	CandyType = "Lollypop",
	PriceOffsetForward = 2
}
t7.Price = if t.IsTestPlace then 1 else 25
t7.DisplayPadding = Vector2.new(2, 2)
local t8 = {
	AssetId = 407937724,
	CandyType = "Lollypop",
	PriceOffsetForward = 2
}
t8.Price = if t.IsTestPlace then 1 else 15
t8.DisplayPadding = Vector2.new(2, 3)
local t9 = {
	AssetId = 473369755,
	CandyType = "CandyCorn",
	StandOffsetForward = -5,
	PriceOffsetForward = 2
}
t9.Price = if t.IsTestPlace then 1 else 40
t9.DisplayPadding = Vector2.new(0, 0)
t2[1] = t3
t2[2] = t4
t2[3] = t5
t2[4] = t6
t2[5] = t7
t2[6] = t8
t2[7] = t9
t.TrickOrTreatData = t2
t.ContributorsIcons = {
	[82471] = "rbxasset://textures/ui/icon_placeowner.png",
	[5730064] = "rbxassetid://2098469196",
	[65035247] = "rbxassetid://2098468836",
	[47373630] = "rbxassetid://2098468482",
	[7726380] = "rbxassetid://2098468482"
}
t.DefaultItemCount = {
	Pepperoni = 0,
	Sausage = 0,
	Cheese = 0,
	Medicine = 0
}
t.Buffs = {
	QuickDelivery = {
		{
			Name = "Quick Delivery I",
			Description = "Delivery cutscene takes 10% less time",
			Icon = 15106431711,
			Value = 0.1
		},
		{
			Name = "Quick Delivery II",
			Description = "Delivery cutscene takes 30% less time",
			Icon = 15106431711,
			Value = 0.3
		},
		{
			Name = "Quick Delivery III",
			Description = "Delivery cutscene takes 60% less time",
			Icon = 15106431711,
			Value = 0.6
		}
	},
	QuickOven = {
		{
			Name = "Quick Oven I",
			Description = "Ovens cook 15% faster",
			Icon = 15106431821,
			Value = 0.15
		},
		{
			Name = "Quick Oven II",
			Description = "Ovens cook 50% faster",
			Icon = 15106431821,
			Value = 0.5
		},
		{
			Name = "Quick Oven III",
			Description = "Ovens cook 80% faster",
			Icon = 15106431821,
			Value = 0.8
		}
	},
	FastTruck = {
		{
			Name = "Fast Truck I",
			Description = "Supply trucks drive 10% faster",
			Icon = 15106740714,
			Value = 1.1
		},
		{
			Name = "Fast Truck II",
			Description = "Supply trucks drive 30% faster",
			Icon = 15106740714,
			Value = 1.3
		},
		{
			Name = "Fast Truck III",
			Description = "Supply trucks drive 70% faster",
			Icon = 15106740714,
			Value = 1.7
		}
	},
	QuickCashier = {
		{
			Name = "Quick Cashier I",
			Description = "Customer\'s give you their order 20% faster",
			Icon = 15106431915,
			Value = 0.2
		},
		{
			Name = "Quick Cashier II",
			Description = "Customer\'s give you their order 30% faster",
			Icon = 15106431915,
			Value = 0.3
		},
		{
			Name = "Quick Cashier III",
			Description = "Customer\'s give you their order 70% faster",
			Icon = 15106431915,
			Value = 0.7
		}
	}
}
t.BuffIconColors = { Color3.fromRGB(1, 132, 255), Color3.fromRGB(36, 171, 58), Color3.fromRGB(104, 38, 203) }
t.EngineSounds = {
	Vehicle = "rbxassetid://4525667453",
	Boat = "rbxassetid://280518144",
	SpeedBoat = "rbxassetid://95634360242431",
	Phantom = "rbxassetid://73345347138206"
}
t.Horns = {
	Car = "http://www.roblox.com/asset/?id=272190708",
	Truck = "http://www.roblox.com/asset/?id=272187203",
	Boat = "rbxassetid://1195916770"
}
t.DefaultTextColor = Color3.fromRGB(166, 132, 109)
t.EyeColors = {
	brown = {
		Name = "Brown",
		Rarity = "Common"
	},
	green = {
		Name = "Green",
		Rarity = "Common"
	},
	blue = {
		Name = "Blue",
		Rarity = "Common"
	},
	red = {
		Name = "Red",
		Rarity = "Uncommon"
	},
	light_blue = {
		Name = "Light Blue",
		Rarity = "Uncommon"
	},
	light_green = {
		Name = "Light Green",
		Rarity = "Uncommon"
	},
	ander = {
		Name = "Ander",
		Rarity = "Uncommon"
	},
	sparkle_yellow = {
		Name = "Sparkle Yellow",
		Rarity = "Rare"
	},
	autumn_orange = {
		Name = "Autumn Orange",
		Rarity = "Rare"
	},
	glowing_gold = {
		Name = "Glowing Gold",
		Rarity = "Rare"
	},
	nova_blue = {
		Name = "Nova Blue",
		Rarity = "Legendary"
	},
	lifeforce_blue = {
		Name = "Lifeforce Blue",
		Rarity = "Legendary"
	},
	aura_pink = {
		Name = "Aura Pink",
		Rarity = "Mythic"
	},
	cinder_orange = {
		Name = "Cinder Orange",
		Rarity = "Undead1",
		NextEyes = "void_orange"
	},
	cinder_violet = {
		Name = "Cinder Violet",
		Rarity = "Undead1",
		NextEyes = "void_violet"
	},
	void_orange = {
		Name = "Void Orange",
		Rarity = "Undead2",
		NextEyes = "hypervoid_orange"
	},
	void_violet = {
		Name = "Void Violet",
		Rarity = "Undead2",
		NextEyes = "hypervoid_violet"
	},
	hypervoid_violet = {
		Name = "Hypervoid Violet",
		Rarity = "Undead3"
	},
	hypervoid_orange = {
		Name = "Hypervoid Orange",
		Rarity = "Undead3"
	},
	hypervoid_red = {
		Name = "Hypervoid Red",
		Rarity = "Undead4"
	}
}
t.MaxNumPetSlots = 4
t.MaxNumPets = 25
t.NotificationThreshold = 200
t.AccessoryBlacklist = {
	[18628285330] = true,
	[1527622] = true,
	[405873994] = true,
	[1055299] = true,
	[115248967274170] = true,
	[104130269527324] = true,
	[105911090754955] = true
}
t.LocationName = {
	[192800] = "",
	[142872308] = "",
	[191029074] = "Party Island",
	[191851816] = "Party Island",
	[8080952959] = "Voice Chat",
	[8080188707] = "Voice Chat",
	[4519530594] = "North Pole",
	[4537627984] = "North Pole",
	[79528535462974] = "Trick-or-Treat",
	[4201882723] = "Trick-or-Treat",
	[421058320] = "Burger Place",
	[257857728] = "Burger Place"
}
t.BannedPlacePortalIds = {
	[7783264186] = true,
	[5777826399] = true,
	[5777826766] = true,
	[192800] = true,
	[79528535462974] = true,
	[4537627984] = true,
	[99567757951754] = true,
	[138687392359748] = true,
	[257857728] = true,
	[191029074] = true,
	[8080952959] = true,
	[99567757951754] = true,
	[124398636045018] = true,
	[130456238169256] = true,
	[78954488802301] = true,
	[95286029242445] = true,
	[110855076592335] = true
}
t.IsTestPlace = if game.GameId == t.TestGameId then true elseif game.GameId == t.BranchGameId then true else false
t.IsStudio = game:GetService("RunService"):IsStudio()
t.IsOnline = not game:GetService("RunService"):IsStudio()
t.IsVoiceChatServer = if game.PlaceId == t.PizzaPlaceVoiceChatId then true elseif game.PlaceId == t.PizzaPlaceVoiceChatTestId then true else false
local IsStudio = t.IsStudio
t.IsPartyServer = if game.PlaceId == t.PizzaPlacePartyId or game.PlaceId == t.PizzaPlacePartyTestId then true elseif game.PlaceId == t.PizzaPlacePartyBranchId then true else false
t.IsTrickOrTreatServer = if game.PlaceId == t.TrickOrTreatId then true elseif game.PlaceId == t.TrickOrTreatTestId then true else false
t.IsLocalTestServer = t.IsStudio and (if game:FindFirstChild("NetworkServer") == nil then game:FindFirstChild("NetworkClient") ~= nil else true)
t.IsServer = game:GetService("RunService"):IsServer()
t.IsClient = game:GetService("RunService"):IsClient()
t.IsNormalServer = if game.PlaceId == t.PizzaPlaceId or game.PlaceId == t.PizzaPlaceTestId then true elseif game.PlaceId == t.PizzaPlaceInsideUniverseTestId then true else false
t.IsPizzaPlace = t.IsNormalServer or t.IsVoiceChatServer or t.IsPartyServer
if t.IsPartyServer then
	t.IsNormalServer = false
end
t.MainPlaceId = game.GameId == t.MainGameId and t.PizzaPlaceId or (game.GameId == t.TestGameId and t.PizzaPlaceTestId or (if game.GameId == t.BranchGameId then t.PizzaPlaceBranchId else false))
t.PartyServerId = game.GameId == t.MainGameId and t.PizzaPlacePartyId or (game.GameId == t.TestGameId and t.PizzaPlacePartyTestId or (if game.GameId == t.BranchGameId then t.PizzaPlacePartyBranchId else false))
t.TrickOrTreatServerId = game.GameId == t.MainGameId and t.TrickOrTreatId or (if game.GameId == t.TestGameId then t.TrickOrTreatTestId else false)
t.NorthPoleId = if t.IsTestPlace then 4519530594 else 4537627984
t.ChinaServer = game.GameId == t.MainGameId and t.PizzaPlaceChinaId or (if game.GameId == t.TestGameId then t.PizzaPlaceChinaTestId else false)
t.ErrorLogTableName = if game.PlaceId == t.PizzaPlaceInsideUniverseTestId then "internal_testing_error_log" elseif game.GameId == t.MainGameId then "main_error_log" elseif game.GameId == t.TestGameId or game.GameId == t.BranchGameId then "testing_error_log" else false
t.GlitchReportsTableName = if game.PlaceId == t.PizzaPlaceInsideUniverseTestId then "internal_testing_glitch_reports" elseif game.GameId == t.MainGameId then "main_glitch_reports" elseif game.GameId == t.TestGameId or game.GameId == t.BranchGameId then "testing_glitch_reports" else false
t.MazeOfTerrorTrophyId = 8340688435
t.CrossoverEventInfo = {
	StartTick = 0,
	EndTick = 0,
	BadgeId = 2124493131,
	PlaceId = 4580204640,
	PrizeAssetId = 4537881197,
	IsGamepadSupported = true
}
local t10 = {}
local t11 = {
	CustomCodeIndex = "ChallengeEvent",
	SkipIntro = true,
	GearsDisabled = true,
	CarPlacementDisabled = true,
	PetsDisabled = true,
	DisableAdvantageousFeatures = true,
	HideInviteComputer = true,
	CloseShops = true,
	HidePlaceTeleporters = true,
	DisableDoubleTime = true,
	LockedTime = "Midday",
	DisabledMenuElements = { "Catalog", "Teleport", "Upgrade", "Emotions" }
}
t11.LeaveRedirectPlaceId = if t.IsTestPlace then 11874300825 else 124398636045018
t10.ChallengeEvent = t11
local t12 = {}
t12[if t.IsTestPlace then 101505306821889 else 130456238169256] = t10.ChallengeEvent
local v24 = t12[game.PlaceId]
if v24 == nil then
	v24 = {
		DisabledMenuElements = {}
	}
end
if v24.DisableAdvantageousFeatures then
	v24.GearsDisabled = true
	v24.PetsDisabled = true
	v24.CarPlacementDisabled = true
	if not table.find(v24.DisabledMenuElements, "Teleport") then
		table.insert(v24.DisabledMenuElements, "Teleport")
	end
end
if v24.PetsDisabled and not table.find(v24.DisabledMenuElements, "PetPanel") then
	table.insert(v24.DisabledMenuElements, "PetPanel")
end
if v24.CustomSpawnLocation then
	v24.SkipIntro = true
end
t.PlaceSettings = v24
if game:GetService("RunService"):IsServer() then
	t.TestDataStoreVersion = 158
	t.InternalTestDataStoreVersion = 3
	t.DataStore = (game.GameId == t.MainGameId or game.PlaceId == t.PizzaPlaceInsideUniverseTestId) and game:GetService("DataStoreService"):GetDataStore("PizzaPlace1") or (if game.GameId == t.TestGameId or game.GameId == t.BranchGameId then game:GetService("DataStoreService"):GetDataStore("TestDataStore" .. t.TestDataStoreVersion) else false)
	t.PetDataStore = game.GameId == t.MainGameId and game:GetService("DataStoreService"):GetDataStore("Pets10") or (if game.GameId == t.TestGameId or game.GameId == t.BranchGameId then game:GetService("DataStoreService"):GetDataStore("TesterPetsB" .. t.TestDataStoreVersion) else false)
end
t.DataStoreNames = {
	MostLikes = "MostLikes",
	MostCoinsSpent = "MostCoinsSpent",
	MostOrders = "MostOrders",
	MostLikesWeekly = "MostLikesWeekly",
	MostCoinsSpentWeekly = "MostCoinsSpentWeekly",
	MostOrdersWeekly = "MostOrdersWeekly"
}
_G.IsPartyServer = t.IsPartyServer
t.VideoMakerPluginVersion = 2
t.DoubleMoneyzDay = false
t.Sale = false
t.DarkThemeDialog = false
t.IntroSequenceEnabled = true
t.PaycheckLimit = 3000
t.NeonTimePaycheckLimit = 30000
t.PetNameLength = 13
t.ChristmasUnwrapTickTest = true
t.FirstChristmasUnwrapTick = game:GetService("RunService"):IsStudio() and t.ChristmasUnwrapTickTest and os.time() + 2000000 or 1577293200
t.PreferedLanguageVersion = 13
t.UpdateVersion = 10
t.DefaultSettingValues = {
	Music = 0.5,
	SoundEffects = 0.5,
	CarRadio = 0.5,
	MusicVersion = "Newest Music",
	UniformEnabled = true,
	OldUniform = false,
	VIPCrown = true,
	OldCustomerDialog = false,
	Textures = true,
	WaterEnabled = false,
	ManagerTeleportPopup = true,
	PartyInvitePopup = true,
	VotekickPopup = true,
	UpdateLookPopup = true,
	TiltEnabled = t.IsStudio,
	CollisionEnabled = t.IsStudio
}
t.BasePetPool = if t.IsStudio then { "Dog" } or { "Dog", "Cat", "Bunny", "Mouse", "Hamster" } else { "Dog", "Cat", "Bunny", "Mouse", "Hamster" }
t.PresentRarities = {
	Normal = 940,
	Common = 50,
	Uncommon = 25,
	Rare = 12,
	Legendary = 4
}
t.ShopRarities = {
	Normal = 8400,
	Common = 20,
	Uncommon = 10,
	Rare = 4,
	Legendary = 1
}
t.EyeColorRarities = {
	Common = 500,
	Uncommon = 400,
	Rare = 100,
	Legendary = 10,
	Mythic = 1
}
local t13 = {
	Default = {
		HoldingPresent = {
			R6 = 2665338375,
			R15 = 3869539929,
			Priority = Enum.AnimationPriority.Movement
		},
		OpenPresent = {
			R6 = 4039854725,
			R15 = 3869532477,
			HasEffects = true,
			Speed = 0.5,
			Priority = Enum.AnimationPriority.Action
		},
		HoldingItem = {
			R6 = 4040077647,
			R15 = 3875855745,
			Speed = 0.1,
			Priority = Enum.AnimationPriority.Movement
		},
		DropFromSky = {
			R6 = 3906812477,
			R15 = 3906767049,
			HasEffects = true,
			Priority = Enum.AnimationPriority.Action
		}
	}
}
t.DefaultPatterns = {
	Wallpaper = {
		TextureId = 0,
		StudsPerTileU = 4,
		StudsPerTileV = 4,
		Transparency = 0,
		TextureColor = Color3.fromRGB(255, 255, 255)
	},
	Floor = {
		TextureId = 127726526,
		StudsPerTileU = 8,
		StudsPerTileV = 12,
		Transparency = 0.8,
		TextureColor = Color3.fromRGB(255, 255, 255),
		PartColor = Color3.fromRGB(160, 95, 53),
		Material = Enum.Material.Wood
	},
	Ceiling = {
		TextureId = 0,
		StudsPerTileU = 4,
		StudsPerTileV = 4,
		Transparency = 0,
		PartColor = nil,
		Material = nil,
		TextureColor = Color3.fromRGB(255, 255, 255)
	}
}
t.MaterialEnum = {
	None = 1,
	Asphalt = 2,
	Basalt = 3,
	Brick = 4,
	Cardboard = 5,
	Carpet = 6,
	CeramicTiles = 7,
	ClayRoofTiles = 8,
	Cobblestone = 9,
	Concrete = 10,
	CorrodedMetal = 11,
	CrackedLava = 12,
	DiamondPlate = 13,
	Fabric = 14,
	Foil = 15,
	ForceField = 16,
	Glacier = 17,
	Glass = 18,
	Granite = 19,
	Grass = 20,
	Ground = 21,
	Ice = 22,
	LeafyGrass = 23,
	Leather = 24,
	Limestone = 25,
	Marble = 26,
	Metal = 27,
	Mud = 28,
	Neon = 29,
	Pavement = 30,
	Pebble = 31,
	Plaster = 32,
	Plastic = 33,
	Rock = 34,
	RoofShingles = 35,
	Rubber = 36,
	Salt = 37,
	Sand = 38,
	Sandstone = 39,
	SmoothPlastic = 40,
	Snow = 41,
	Wood = 42,
	WoodPlanks = 43
}
t.MaterialPreviewImages = {
	None = "rbxassetid://90781796593742",
	Asphalt = "rbxassetid://125148774710785",
	Basalt = "rbxassetid://140254974339048",
	Brick = "rbxassetid://93163970262858",
	Cardboard = "rbxassetid://83199685119444",
	Carpet = "rbxassetid://116457660169548",
	CeramicTiles = "rbxassetid://106274659032076",
	ClayRoofTiles = "rbxassetid://123667087196673",
	Cobblestone = "rbxassetid://79494205889759",
	Concrete = "rbxassetid://107701457763628",
	CorrodedMetal = "rbxassetid://128285100968124",
	CrackedLava = "rbxassetid://74556921215531",
	DiamondPlate = "rbxassetid://135351818954876",
	Fabric = "rbxassetid://92504682015549",
	Foil = "rbxassetid://127837399465421",
	Glacier = "rbxassetid://134869535466179",
	Granite = "rbxassetid://84543678910449",
	Grass = "rbxassetid://77955471190450",
	Ground = "rbxassetid://106085678632693",
	Ice = "rbxassetid://84760206033538",
	LeafyGrass = "rbxassetid://78919503144074",
	Leather = "rbxassetid://87320282185927",
	Limestone = "rbxassetid://106610486159075",
	Marble = "rbxassetid://93207891954993",
	Metal = "rbxassetid://86442184506245",
	Mud = "rbxassetid://73705599458934",
	Pavement = "rbxassetid://108569453482859",
	Pebble = "rbxassetid://81820884992938",
	Plaster = "rbxassetid://119673690703403",
	Plastic = "rbxassetid://111941905302408",
	Rock = "rbxassetid://107155577906681",
	RoofShingles = "rbxassetid://93723501224372",
	Rubber = "rbxassetid://111523972390225",
	Salt = "rbxassetid://101712637453909",
	Sand = "rbxassetid://123811632773172",
	Sandstone = "rbxassetid://96270528245475",
	SmoothPlastic = "rbxassetid://90781796593742",
	Snow = "rbxassetid://121912886710268",
	Wood = "rbxassetid://100422404086380",
	WoodPlanks = "rbxassetid://134122942302703"
}
t.PresentData = {
	Normal = {
		ToolIcon = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=3942186680",
		Holiday = nil,
		Season = nil,
		Probability = 20,
		Price = 350,
		Rarity = "Normal",
		AssetType = "Furniture",
		Name = "Furniture Present",
		Animation = t13.Default
	},
	Gear = {
		ToolIcon = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=3942137473",
		Holiday = nil,
		Season = nil,
		Probability = 1,
		Price = 200,
		Rarity = "Normal",
		AssetType = "Gear",
		Name = "Gear Present",
		Animation = t13.Default
	},
	Fall = {
		ToolIcon = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=4043838219",
		Holiday = nil,
		Season = "Fall",
		Probability = 10,
		Price = 450,
		Rarity = "Common",
		AssetType = "Furniture",
		Name = "Autumn Present",
		Animation = t13.Default
	},
	Halloween = {
		ToolIcon = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=118061422314267",
		Holiday = "Halloween",
		Season = nil,
		Probability = 20,
		Price = 550,
		Rarity = "Common",
		AssetType = "Furniture",
		Name = "Halloween Present",
		Animation = t13.Default
	},
	Thanksgiving = {
		ToolIcon = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=4459209078",
		Holiday = "Thanksgiving",
		Season = nil,
		Probability = 20,
		Price = 450,
		Rarity = "Common",
		AssetType = "Furniture",
		Name = "Thanksgiving Present",
		Animation = t13.Default
	},
	Movie = {
		ToolIcon = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=6213990852",
		Holiday = nil,
		Season = nil,
		Probability = 2,
		Price = 1800,
		Rarity = "Uncommon",
		AssetType = "Furniture",
		Name = "Movie Present",
		Animation = t13.Default
	},
	Christmas = {
		ToolIcon = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=8199364594",
		Holiday = "Christmas",
		Season = nil,
		Probability = 2,
		Price = 1100,
		Rarity = "Common",
		AssetType = "Furniture",
		Name = "Christmas Present",
		Animation = t13.Default
	}
}
t.CustomerStates = {
	WalkingToEntrance = "WalkingToEntrance",
	WalkingToCashier = "WalkingToCashier",
	WaitingForCashier = "WaitingForCashier",
	WalkingToTable = "WalkingToTable",
	SittingAtTable = "SittingAtTable",
	Leaving = "Leaving"
}
t.Paychecks = {
	["Daily Check"] = 200,
	["Watching Ad Reward"] = 150,
	Paycheck = nil,
	["Bonus Check from Manager"] = 150,
	["Starter Check"] = 500
}
t.CandyTypes = {
	{
		Name = "Lollypop",
		ImageId = 2505565107
	},
	{
		Name = "CandyCorn",
		ImageId = 2505566251
	},
	{
		Name = "Roll",
		ImageId = 2505568058
	}
}
t.CandyImages = {
	Lollypop = 2505565107,
	CandyCorn = 2505566251,
	Roll = 2505568058
}
t.ChristmasRewards = {
	500,
	5000000001,
	100,
	300,
	5000000002,
	100,
	300,
	5000000003,
	100,
	300,
	500,
	5000000004,
	100,
	300,
	500,
	5000000005,
	100,
	300,
	500,
	5000000006,
	100,
	300,
	500,
	800,
	5000000007
}
t.TimeInbetweenPresentOpening = if t.IsTestPlace then 30 else 300
t.LastChristmasUnwrapTick = t.FirstChristmasUnwrapTick + 6 * t.TimeInbetweenPresentOpening
t.PresentIdToItemId = {
	[2603500468] = 4527786585,
	[2603500875] = 4537881197,
	[2603501501] = 4521620501,
	[2603502194] = 4531584703,
	[2603502988] = 4537885522,
	[2603503783] = 4525515040,
	[2603505012] = 4532074010
}
t.BaseURL = "http://www.roblox.com/asset/?id="
t.ModelBaseURL = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID="
t.PetPrice = 7000
t.FreeMode = false
t.PetProductId = if t.IsTestPlace then 30393855 else 19024606
t.ChristmasPresentProduct = if t.IsTestPlace then 437805193 else 437806471
t.NeonTimeProductId = if t.IsTestPlace then 1287808393 else 1287809900
t.OutsideDisplayProductId1 = if t.IsTestPlace then 1710145052 else 1710142941
t.OutsideDisplayProductId2 = if t.IsTestPlace then 1710145335 else 1710143686
t.TrophyLevels = {
	Streak = {
		{
			Goal = 14,
			AwardId = 783564647
		},
		{
			Goal = 60,
			AwardId = 739678967
		},
		{
			Goal = 182,
			AwardId = 957765753
		},
		{
			Goal = 365,
			AwardId = 490567345
		}
	},
	Inviter = {
		{
			Goal = 1,
			AwardId = 694759837
		},
		{
			Goal = 3,
			AwardId = 719549938
		},
		{
			Goal = 5,
			AwardId = 810298453
		}
	}
}
local ReplicatedStorage = game.ReplicatedStorage
local t14 = {}
local t15 = {
	NameId = "EmotePack",
	ImageId = 2647783368,
	Name = "Emoji Pack",
	Category = "GamePasses",
	Sale = 25,
	Index = 17,
	IsEmotePack = true,
	Description = "EmotePackDescription"
}
t15.ProductId = if t.IsTestPlace then 4346740 else 4347329
t14.EmotePack = t15
local t16 = {
	NameId = "PizzaSlicer",
	ImageId = 16041764341,
	Name = "Golden Pizza Slicer",
	Category = "GamePasses",
	Index = 16,
	Sale = 0,
	Description = "PizzaSlicerDescription"
}
t16.ProductId = if t.IsTestPlace then 680988190 else 681022199
t14.PizzaSlicer = t16
local t17 = {
	NameId = "ManagerTeleport",
	ImageId = 2308549313,
	Name = "Manager Teleport",
	Category = "GamePasses",
	Index = 15,
	Sale = 0,
	Description = "ManagerTeleportDescription"
}
t17.ProductId = if t.IsTestPlace then 87070 else 86893
t14.ManagerTeleport = t17
local t18 = {
	NameId = "HangGlider",
	ImageId = 2308549085,
	Name = "Hang Glider",
	Category = "GamePasses",
	Sale = 0,
	Index = 14,
	GearAssetId = 497501382,
	Description = "HangGliderDescription"
}
t18.ProductId = if t.IsTestPlace then 87078 else 87344
t14.HangGlider = t18
local t19 = {
	NameId = "GarageUpgrade",
	ImageId = 2308549367,
	Name = "Garage Upgrade",
	Category = "GamePasses",
	Index = 13,
	Sale = 0,
	Description = "GarageDescription"
}
t19.ProductId = if t.IsTestPlace then 953007 else 953263
t14.GarageUpgrade = t19
local t20 = {
	NameId = "AnimalMorph",
	ImageId = 116584835646353,
	Name = "Animal Morph",
	Category = "GamePasses",
	Index = 12,
	Sale = 50,
	Description = "AnimalMorphDescription"
}
t20.ProductId = if t.IsTestPlace then 52086019 else 52086936
t20.LegacyGamePassId = if t.IsTestPlace then 7698175 else 7698167
t14.AnimalMorph = t20
local t21 = {
	NameId = "DeliveryBike",
	ImageId = 2308549298,
	Name = "Delivery Bike",
	Category = "GamePasses",
	Index = 11,
	GearAssetId = 497502431,
	Sale = 33,
	Description = "DeliveryBikeDescription"
}
t21.ProductId = if t.IsTestPlace then 850530 else 809502
t14.DeliveryBike = t21
local t22 = {
	NameId = "Radio",
	ImageId = 2481091745,
	Name = "Radio",
	Category = "GamePasses",
	Index = 10,
	Sale = 50,
	Description = "RadioDescription"
}
t22.ProductId = if t.IsTestPlace then 5260192 else 5260189
t14.Radio = t22
local t23 = {
	NameId = "VictorianUnlimitedSet",
	ImageId = 4509912207,
	Name = "Victorian Bundle",
	Category = "GamePasses",
	Index = 9,
	Sale = 50,
	Description = "VictorianUnlimitedSetDescription"
}
t23.ProductId = if t.IsTestPlace then 7744326 else 7744290
t14.VictorianUnlimitedSet = t23
local t24 = {
	NameId = "AutumnBundle",
	ImageId = 130497501585238,
	Name = "Autumn Bundle",
	Category = "GamePasses",
	Index = 8,
	Sale = 50,
	Description = "AutumnBundleDescription",
	Offsale = true
}
t24.ProductId = if t.IsTestPlace then 931886260 else 934600373
t14.AutumnBundle = t24
local t25 = {
	NameId = "PontoonBoat",
	ImageId = 2308549290,
	Name = "Pontoon Boat",
	Category = "GamePasses",
	Sale = 0,
	Index = 7,
	Description = "PontoonBoatDescription"
}
t25.ProductId = if t.IsTestPlace then 850822 else 850355
t14.PontoonBoat = t25
local t26 = {
	NameId = "FullyUpgradedHouse",
	ImageId = 620781798,
	Name = "Basement",
	Category = "GamePasses",
	Sale = 0,
	Index = 6,
	Description = "FullyUpgradedHouseDescription"
}
t26.ProductId = if t.IsTestPlace then 614101 else 649461
t14.FullyUpgradedHouse = t26
local t27 = {
	NameId = "VIP",
	ImageId = 2308548834,
	Name = "VIP",
	Category = "GamePasses",
	Sale = 10,
	Index = 5,
	Description = "VIPDescription"
}
t27.ProductId = if t.IsTestPlace then 3051068 else 58000
t14.VIP = t27
local t28 = {
	NameId = "Cabin",
	ImageId = 112279268963061,
	Name = "Christmas Bundle",
	Category = "GamePasses",
	Index = 4,
	Sale = 50,
	Description = "CabinDescription",
	Offsale = true
}
t28.ProductId = if t.IsTestPlace then 1626994433 else 1627852399
t14.Cabin = t28
local t29 = {
	NameId = "HalloweenBundle",
	ImageId = 134687492390665,
	Name = "Halloween Bundle",
	Category = "GamePasses",
	Index = 3,
	Sale = 50,
	Description = "HalloweenDescription",
	Offsale = true
}
t29.ProductId = if t.IsTestPlace then 951608240 else 951823232
t14.HalloweenBundle = t29
local t30 = {
	NameId = "Mansion",
	ImageId = 1836057218,
	Name = "Mansion",
	Category = "GamePasses",
	Index = 2,
	Sale = 50,
	Description = "MansionDescription"
}
t30.ProductId = if t.IsTestPlace then 4425633 else 4428831
t14.Mansion = t30
local t31 = {
	NameId = "Estate",
	ImageId = 4509912552,
	Name = "Estate",
	Category = "GamePasses",
	Index = 1,
	Sale = 50,
	Description = "EstateDescription"
}
t31.ProductId = if t.IsTestPlace then 7698175 else 7698167
t14.Estate = t31
t.GamePasses = t14
t.CoinBundles = {}
t.GamepassDescriptions = {
	X3Stickers = "Put up to 3 stickers on a wall!",
	AutumnBundleDescription = "",
	HalloweenDescription = "",
	CabinDescription = "",
	EmotePack = "Express yourself with this emote expansion pack!\n * Disgust\n * Pass out\n * Shocked\n * Evil Laugh",
	PizzaSlicer = "Boosts the value of pizzas by 10%. Also allows you to cut various things in half.",
	ManagerTeleport = "Teleports you to the manager\'s chair as soon as the manager quits their job.",
	HangGlider = "Get a bird\'s eye view of all the islands.",
	GarageUpgrade = "Adds a garage to your house and your own personal car that no one can steal. The colors you paint your car save.",
	AnimalMorph = "Become a dog or rat!",
	DeliveryBike = "Deliver pizzas in a timley manner with this speedy bike",
	Radio = "Play music from your car",
	VictorianUnlimitedSet = "",
	PontoonBoat = "Take your friends out to the high seas and visit different islands. Features a music player and seats up to 11 people.",
	FullyUpgradedHouse = "Basement + Backyard + Three Story House",
	Mansion = " * Tons of space\n * 2 more rooms!\n * You can put stuff in your front yard!\n * Second balcony!\n * Custom ceiling colors, stair colors, and much more",
	VIP = " * 50% more coins per paycheck\n * X2 more coins in daily checks\n * Unlocks new paint materials\n * Able to invite players to teleport to your house to have a party.\n * Able to teleport back to your house at any time.\n * Crown Icon + Yellow chat text\n\t",
	Estate = " * Free Jeep vehicle included\n * Nearly 2X the floor space!\n * New attic!\n * Giant garage! (Garage gamepass required)\n * Able to place furniture in the garage! (Garage gamepass required)\n * Able to place furniture on the side of your house\n\t"
}
local t32 = {}
local t33 = {
	ImageId = 92749384285748,
	Name = "2,500",
	Amount = 2500,
	Category = "Moneyz",
	Index = 1
}
t33.ProductId = if t.IsTestPlace then 18938283 else 45123832
t32.CoinsSmall = t33
local t34 = {
	ImageId = 109876490429086,
	Name = "4,000",
	Amount = 4000,
	Category = "Moneyz",
	Index = 2
}
t34.ProductId = if t.IsTestPlace then 18938289 else 45123967
t32.CoinsMedium = t34
local t35 = {
	ImageId = 97537218477883,
	Name = "22,000",
	Amount = 22000,
	Category = "Moneyz",
	Index = 3
}
t35.ProductId = if t.IsTestPlace then 18938299 else 45124003
t32.CoinsLarge = t35
local t36 = {
	ImageId = 131488710266577,
	Name = "50,000",
	Amount = 50000,
	Category = "Moneyz",
	Index = 4
}
t36.ProductId = if t.IsTestPlace then 38148916 else 45124061
t32.CoinsChest = t36
local t37 = {
	ImageId = 140084567561694,
	Name = "200,000",
	Amount = 200000,
	Category = "Moneyz",
	Sale = 30,
	Index = 5
}
t37.ProductId = if t.IsTestPlace then 38148945 else 23491618
t32.CoinsDoubleChest = t37
local t38 = {
	ImageId = 495323030,
	Name = "4,000",
	Amount = 4000,
	Category = "Moneyz",
	Sale = 10,
	Index = 6,
	GearAssetId = 495315981
}
t38.ProductId = if t.IsTestPlace then 19762535 else 45123732
t32.MoneyBag = t38
t.Moneyz = t32
t.noteIds = {
	869111684,
	869112058,
	868964990,
	868965072,
	868965201,
	868965292,
	868965388,
	868965458,
	868965559,
	868965711,
	868965797,
	868965936,
	869111262,
	869111431
}
t.PaintableParts = {
	Wall = true,
	Window = true,
	Roof = true,
	Door = true,
	Knob = true,
	DoorTouch = true,
	Frame = true,
	Shutter = true,
	Outline = true,
	HandRail = true,
	HandRail2 = true,
	Stairs0 = true,
	Stairs = true,
	Stairs2 = true,
	Stairs3 = true,
	Stairs4 = true,
	Trim = true,
	Gate = true,
	TrimSecondFloor = true,
	TrimSecondFloor2 = true,
	TrimThirdFloor = true,
	TrimThirdFloor2 = true,
	Ceiling = true,
	OutdoorTrim = true,
	Pillar = true,
	DecoWall1 = true,
	DecoWall2 = true,
	RoofTopper = true,
	OutdoorStairs = true,
	OutdoorCeiling = true,
	Walkway = true,
	Walkway2 = true,
	Base = true,
	Base2 = true,
	PillarRing = true,
	PillarBase = true,
	StaircasePillar = true,
	PorchWood = true,
	Exterior = true
}
t.DefaultMaterials = {
	Manor = {
		Wall = "Cobblestone",
		Window = "SmoothPlastic",
		Roof = "RoofShingles",
		Door = "Wood",
		Knob = "Metal",
		DoorTouch = "Wood",
		Frame = "Cobblestone",
		Stairs = "Wood",
		Stairs0 = "Wood",
		Stairs2 = "Wood",
		Ceiling = "Concrete",
		RoofTopper = "Metal",
		DecoWall1 = "Cobblestone",
		DecoWall2 = "Cobblestone",
		Walkway = "Rubber",
		OutdoorStairs = "Pavement",
		OutdoorCeiling = "WoodPlanks",
		BackyardStairs = "Pavement"
	},
	Brick = {
		Wall = "Brick",
		Window = "SmoothPlastic",
		Roof = "Brick",
		Door = "Wood",
		Knob = "SmoothPlastic",
		DoorTouch = "Wood",
		Frame = "Wood",
		Shutter = "SmoothPlastic",
		Outline = "SmoothPlastic",
		HandRail = "SmoothPlastic",
		HandRail2 = "SmoothPlastic",
		Stairs = "Wood",
		Stairs2 = "Wood",
		Stairs3 = "Wood",
		Stairs4 = "Wood",
		Trim = "SmoothPlastic",
		TrimSecondFloor = "SmoothPlastic",
		TrimSecondFloor2 = "SmoothPlastic",
		TrimThirdFloor = "SmoothPlastic",
		TrimThirdFloor2 = "SmoothPlastic",
		Ceiling = "Concrete",
		OutdoorTrim = "SmoothPlastic",
		Pillar = "SmoothPlastic"
	},
	Brick2 = {
		Wall = "Brick",
		Window = "SmoothPlastic",
		Roof = "Brick",
		Door = "Wood",
		Knob = "SmoothPlastic",
		DoorTouch = "Wood",
		Frame = "Wood",
		Shutter = "SmoothPlastic",
		Outline = "SmoothPlastic",
		HandRail = "SmoothPlastic",
		HandRail2 = "SmoothPlastic",
		Stairs = "Wood",
		Stairs2 = "Wood",
		Stairs3 = "Wood",
		Stairs4 = "Wood",
		Trim = "SmoothPlastic",
		TrimSecondFloor = "SmoothPlastic",
		TrimSecondFloor2 = "SmoothPlastic",
		TrimThirdFloor = "SmoothPlastic",
		TrimThirdFloor2 = "SmoothPlastic",
		Ceiling = "Concrete",
		OutdoorTrim = "SmoothPlastic",
		Pillar = "SmoothPlastic"
	},
	Modern = {
		Wall = "SmoothPlastic",
		Window = "SmoothPlastic",
		Roof = "SmoothPlastic",
		Door = "Wood",
		Knob = "SmoothPlastic",
		DoorTouch = "Wood",
		Frame = "Wood"
	},
	Cabin = {
		Wall = "WoodPlanks",
		Window = "SmoothPlastic",
		Roof = "WoodPlanks",
		Door = "Wood",
		Knob = "SmoothPlastic",
		DoorTouch = "Wood",
		Frame = "WoodPlanks",
		Base = "Cobblestone",
		Base2 = "Cobblestone",
		Stairs = "Cobblestone",
		Pillar = "WoodPlanks",
		PillarRing = "WoodPlanks",
		PillarBase = "WoodPlanks",
		StaircasePillar = "Cobblestone",
		PorchWood = "WoodPlanks",
		Exterior = "WoodPlanks",
		Walkway = "Cobblestone",
		Walkway2 = "Cobblestone"
	}
}
t.HouseTypeInfo = {
	Brick = {
		FirstUpgrade = "Shack"
	},
	Brick2 = {
		FirstUpgrade = "Shack"
	},
	Modern = {
		FirstUpgrade = "Tiny",
		YMarkerOffset = 1.6
	},
	Cabin = {
		FirstUpgrade = "Cabin"
	},
	Manor = {
		FirstUpgrade = "Manor"
	}
}
t.HouseInfo = {
	Brick = {
		Shack = {
			Name = "Shack",
			Index = 1,
			Price = nil,
			ModelId = 8729084725,
			MaxFurnitureMemory = 12,
			NextUpgrade = "Tiny"
		},
		Tiny = {
			Name = "Tiny",
			Index = 2,
			Price = 50,
			ModelId = 8729100304,
			MaxFurnitureMemory = 16,
			NextUpgrade = "Small"
		},
		Small = {
			Name = "Small",
			Index = 3,
			Price = 1200,
			ModelId = 8729038004,
			MaxFurnitureMemory = 32,
			NextUpgrade = "Medium"
		},
		Medium = {
			Name = "Medium",
			Index = 4,
			Price = 3700,
			ModelId = 8729063439,
			MaxFurnitureMemory = 70,
			NextUpgrade = "Large"
		},
		Large = {
			Name = "Large",
			Index = 5,
			Price = 5200,
			ModelId = 8729051323,
			MaxFurnitureMemory = 85,
			NextUpgrade = "TwoStory"
		},
		TwoStory = {
			Name = "Two Story",
			Index = 6,
			Price = 14900,
			ModelId = 8728984695,
			MaxFurnitureMemory = 150,
			NextUpgrade = "ThreeStory"
		},
		ThreeStory = {
			Name = "Three Story",
			Index = 7,
			Price = 36000,
			ModelId = 8728926634,
			MaxFurnitureMemory = 230,
			NextUpgrade = "Backyard"
		},
		Backyard = {
			Name = "Backyard",
			Index = 8,
			Price = 40000,
			ModelId = 8728947094,
			MaxFurnitureMemory = 290,
			NextUpgrade = "Basement",
			CanAccommodateLargeItems = true
		},
		Basement = {
			Name = "Basement",
			Index = 9,
			Price = 45000,
			ModelId = 1684646291,
			MaxFurnitureMemory = 390,
			NextUpgrade = "Mansion",
			CanAccommodateLargeItems = true,
			GamepassId = "FullyUpgradedHouse"
		},
		Mansion = {
			Name = "Mansion",
			Index = 10,
			Price = 200000,
			ModelId = 1677234302,
			MaxFurnitureMemory = 1200,
			NextUpgrade = "Estate",
			CanAccommodateLargeItems = true,
			GamepassId = "Mansion"
		},
		Estate = {
			Name = "Estate",
			Index = 11,
			Price = 600000,
			ModelId = 4509912552,
			MaxFurnitureMemory = 1980,
			NextUpgrade = nil,
			CanAccommodateLargeItems = true,
			GamepassId = "Estate"
		}
	},
	Brick2 = {
		Shack = {
			Name = "Shack",
			Index = 1,
			Price = nil,
			ModelId = 8729084725,
			MaxFurnitureMemory = 12,
			NextUpgrade = "Tiny"
		},
		Tiny = {
			Name = "Tiny",
			Index = 2,
			Price = 9000,
			ModelId = 8729100304,
			MaxFurnitureMemory = 16,
			NextUpgrade = "Small"
		},
		Small = {
			Name = "Small",
			Index = 3,
			Price = 17000,
			ModelId = 8729038004,
			MaxFurnitureMemory = 32,
			NextUpgrade = "Medium"
		},
		Medium = {
			Name = "Medium",
			Index = 4,
			Price = 25000,
			ModelId = 8729063439,
			MaxFurnitureMemory = 70,
			NextUpgrade = "Large"
		},
		Large = {
			Name = "Large",
			Index = 5,
			Price = 35000,
			ModelId = 8729051323,
			MaxFurnitureMemory = 85,
			NextUpgrade = "TwoStory"
		},
		TwoStory = {
			Name = "Two Story",
			Index = 6,
			Price = 46000,
			ModelId = 8728984695,
			MaxFurnitureMemory = 150,
			NextUpgrade = "ThreeStory"
		},
		ThreeStory = {
			Name = "Three Story",
			Index = 7,
			Price = 65000,
			ModelId = 8728926634,
			MaxFurnitureMemory = 230,
			NextUpgrade = "Backyard"
		},
		Backyard = {
			Name = "Backyard",
			Index = 8,
			Price = 70000,
			ModelId = 8728947094,
			MaxFurnitureMemory = 290,
			NextUpgrade = "Basement",
			CanAccommodateLargeItems = true
		},
		Basement = {
			Name = "Basement",
			Index = 9,
			Price = 75000,
			ModelId = 1684646291,
			MaxFurnitureMemory = 390,
			NextUpgrade = "Mansion",
			CanAccommodateLargeItems = true
		},
		Mansion = {
			Name = "Mansion",
			Index = 10,
			Price = 300000,
			ModelId = 1677234302,
			MaxFurnitureMemory = 1200,
			NextUpgrade = "Estate",
			CanAccommodateLargeItems = true
		},
		Estate = {
			Name = "Estate",
			Index = 11,
			Price = 900000,
			ModelId = 4509912552,
			MaxFurnitureMemory = 1980,
			NextUpgrade = nil,
			CanAccommodateLargeItems = true
		}
	},
	Modern = {
		Tiny = {
			Name = "Tiny",
			Index = 1,
			Price = nil,
			ModelId = 8912771230,
			MaxFurnitureMemory = 16,
			NextUpgrade = "Small",
			MailboxOffsetZ = -8
		},
		Small = {
			Name = "Small",
			Index = 2,
			Price = 40000,
			ModelId = 8912706035,
			MaxFurnitureMemory = 32,
			NextUpgrade = "Garage"
		},
		Garage = {
			Name = "Garage",
			Index = 3,
			Price = 80000,
			ModelId = 8912709104,
			MaxFurnitureMemory = 70,
			NextUpgrade = nil
		}
	},
	Manor = {
		Manor = {
			Name = "Manor",
			Index = 1,
			Price = nil,
			ModelId = nil,
			ImageId = 121451298791274,
			MaxFurnitureMemory = 1980,
			NextUpgrade = nil,
			MailboxOffsetZ = 10,
			GamepassId = "HalloweenBundle",
			IsBundle = true
		}
	},
	Cabin = {
		Cabin = {
			Name = "Cabin",
			Index = 1,
			Price = nil,
			ModelId = nil,
			ImageId = 87636830769015,
			MaxFurnitureMemory = 1200,
			NextUpgrade = nil,
			MailboxOffsetZ = 10,
			GamepassId = "Cabin",
			IsBundle = true
		}
	}
}
function t.GetHouseInfoFromIndex(p1, p2, p3) --[[ GetHouseInfoFromIndex | Line: 1665 | Upvalues: t (copy) ]]
	for k, v in pairs(t.HouseInfo[p2]) do
		if v.Index == p3 then
			return v
		end
	end
end
function t.GetNextUpgradeInfo(p1, p2, p3) --[[ GetNextUpgradeInfo | Line: 1673 | Upvalues: t (copy) ]]
	return t.HouseInfo[p2][t.HouseInfo[p2][p3].NextUpgrade]
end
t.OrderNameToIndex = {
	CheesePizza = 1,
	PepperoniPizza = 2,
	SausagePizza = 3,
	MountainDew = 4
}
t.OrderIndexToName = { "CheesePizza", "PepperoniPizza", "SausagePizza", "MountainDew" }
t.OrderBoardImages = {
	CheesePizza = "rbxassetid://3540529228",
	PepperoniPizza = "rbxassetid://3540529917",
	SausagePizza = "rbxassetid://3540530535",
	MountainDew = "rbxassetid://2512571151"
}
t.IngredientImages = {
	Cheese = "http://www.roblox.com/asset/?id=167850840",
	Pepperoni = "http://www.roblox.com/asset/?id=167850850",
	Sausage = "http://www.roblox.com/asset/?id=167850856",
	TomatoSauce = "http://www.roblox.com/asset/?id=167850867",
	MountainDew = "rbxassetid://2512571151",
	Dough = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=170260912",
	Box = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=170260735"
}
t.IngredientIcons = {
	Cheese = "rbxassetid://11751455776",
	Pepperoni = "rbxassetid://11751455515",
	Sausage = "rbxassetid://11751455256",
	TomatoSauce = "rbxassetid://11751455182",
	MountainDew = "rbxassetid://11751556059",
	Dough = "rbxassetid://11751455695",
	Box = "rbxassetid://11751455369"
}
t.MenuItemImages = {
	Cheese = "rbxassetid://3540529228",
	Pepperoni = "rbxassetid://3540529917",
	Sausage = "rbxassetid://3540530535",
	MountainDew = "rbxassetid://2512571151"
}
t.Lanes = {
	Right = "Right",
	Left = "Left",
	DriveThrough = "DriveThrough"
}
t.CategoryToType = {
	All = "Furniture",
	Cars = "Vehicles",
	Boats = "Vehicles",
	Trucks = "Vehicles",
	Hats = "Clothing",
	Gear = "Gear",
	Shirts = "Clothing",
	Pants = "Clothing",
	Packages = "Clothing",
	Walls = "WallsFloors",
	Floors = "WallsFloors",
	Beds = "Furniture",
	Doors = "Furniture",
	Lights = "Furniture",
	Seats = "Furniture",
	Tables = "Furniture",
	["Kitchen/Bath"] = "Furniture",
	Decoration = "Furniture",
	Entertainment = "Furniture",
	Customization = "Furniture",
	Seasonal = "Furniture",
	PetHats = "PetHats",
	Stickers = "Stickers",
	Mailboxes = "Mailboxes"
}
t.TypeToCategoryInventoryList = {
	Clothing = { "Hats", "Shirts", "Pants", "Packages" },
	WallsFloors = { "Walls", "Floors" },
	Furniture = {
		"All",
		"Beds",
		"Lights",
		"Seats",
		"Tables",
		"Kitchen/Bath",
		"Decoration",
		"Entertainment",
		"Customization",
		"Doors",
		"Seasonal"
	},
	Gear = {},
	Vehicles = {},
	GamePasses = {},
	Moneyz = {},
	Stickers = {}
}
t.InventorySubcategoryIcons = {
	Entertainment = 2619189841,
	Lights = 2619188950,
	Seats = 2619188949,
	Floors = 2619188925,
	["Kitchen/Bath"] = 2619188922,
	All = 2619188923,
	Seasonal = 2619188926,
	Decoration = 2619188921,
	Walls = 2619254177,
	Beds = 2619265626,
	Doors = 133207785753871,
	Tables = 2619267206,
	Customization = 2619265624
}
t.TypeToCatalogCategoryList = {
	Clothing = { "Hats", "Shirts", "Pants", "Packages" },
	WallsFloors = { "Walls", "Floors" },
	Furniture = {
		"All",
		"Beds",
		"Lights",
		"Seats",
		"Tables",
		"Kitchen/Bath",
		"Decoration",
		"Entertainment",
		"Customization",
		"Doors",
		"Seasonal",
		"VIP only"
	},
	Gear = {},
	Vehicles = {},
	GamePasses = {},
	Moneyz = {}
}
t.TeamNameToBrickColor = {
	Cashier = 21,
	Cook = 24,
	Delivery = 23,
	Manager = 37,
	["On Break"] = 194,
	["Pizza Boxer"] = 106,
	Supplier = 1
}
t.BrickColorToTeamName = {
	[21] = "Cashier",
	[24] = "Cook",
	[23] = "Delivery",
	[37] = "Manager",
	[194] = "On Break",
	[106] = "Pizza Boxer",
	[1] = "Supplier"
}
t.AvatarCategories = {
	"Hats",
	"Shirts",
	"Pants",
	"Hair",
	"Face",
	"Faces",
	"Neck",
	"Back",
	"Shoulder",
	"Waist",
	"Front",
	"Heads"
}
t.AvatarCategoriesChina = { "Hats", "Hair", "Face", "Faces", "Neck", "Back", "Shoulder", "Waist" }
t.AvatarCategoryIcons = {
	Hats = 2617616611,
	Shirts = 2617537854,
	Pants = 2617537845,
	Hair = 2617537791,
	Shoulder = 2617537853,
	Back = 2617537790,
	Face = 2617537786,
	Faces = 2617537787,
	Waist = 2617537855,
	Front = 8010743930,
	Heads = 2617752549,
	Neck = 2617537782
}
t.AssetTypeToSlotSize = {
	HatAccessory = 3,
	Shirt = 0,
	Pants = 0,
	HairAccessory = 2,
	FaceAccessory = 1,
	NeckAccessory = 1,
	ShouldersAccessory = 1,
	FrontAccessory = 1,
	BackAccessory = 1,
	WaistAccessory = 1,
	Head = 0,
	Face = 0
}
t.ValidAccessoryTypes = {
	[8] = true,
	[41] = true,
	[42] = true,
	[43] = true,
	[44] = true,
	[45] = true,
	[46] = true,
	[47] = true
}
t.ValidClothingTypes = {
	[11] = "Shirt",
	[12] = "Pants"
}
t.ValidAssetTypeNumbers = {
	Shirt = 11,
	Pants = 12,
	Audio = 3,
	Decal = 13,
	Place = 9,
	Face = 18,
	["Head Accessory"] = {
		[8] = true,
		[41] = true,
		[42] = true
	},
	Accessory = {
		[8] = true,
		[41] = true,
		[42] = true,
		[43] = true,
		[44] = true,
		[45] = true,
		[46] = true,
		[47] = true
	}
}
t.AssetTypeIdToAssetType = {
	[8] = "HatAccessory",
	[11] = "Shirt",
	[12] = "Pants",
	[41] = "HairAccessory",
	[42] = "FaceAccessory",
	[43] = "NeckAccessory",
	[44] = "ShouldersAccessory",
	[45] = "FrontAccessory",
	[46] = "BackAccessory",
	[47] = "WaistAccessory",
	[17] = "Head",
	[18] = "Face"
}
t.AvatarCategoryToAssetType = {
	Hats = "HatAccessory",
	Shirts = "Shirt",
	Pants = "Pants",
	Hair = "HairAccessory",
	Face = "FaceAccessory",
	Neck = "NeckAccessory",
	Shoulder = "ShouldersAccessory",
	Front = "FrontAccessory",
	Back = "BackAccessory",
	Waist = "WaistAccessory",
	Heads = "Head",
	Faces = "Face"
}
t.EditToolUnlockIndex = {
	Patterns = 3,
	RotateMode = 5
}
t.AddressImages = {
	A1 = 168771465,
	A2 = 168772610,
	A3 = 168772626,
	B1 = 168772634,
	B2 = 168772640,
	B3 = 168772648,
	B4 = 168772663,
	B5 = 168772676,
	B6 = 168772694,
	C1 = 168772702,
	C2 = 168772707,
	C3 = 168772718,
	X1 = 8090471537,
	X2 = 8090471424,
	X3 = 8090471360,
	Y1 = 8090471297,
	Y2 = 8090471220,
	Y3 = 8090471133,
	Z1 = 8090471074,
	Z2 = 8090470978,
	Z3 = 8090470829
}
t.Bundles = {
	VictorianUnlimitedSet = {
		{
			Type = "Asset",
			AssetId = 4514969796,
			Quantity = 12
		},
		{
			Type = "Asset",
			AssetId = 4323142037,
			Quantity = 5
		},
		{
			Type = "Asset",
			AssetId = 4323138801,
			Quantity = 7
		},
		{
			Type = "Asset",
			AssetId = 4323124960,
			Quantity = 6
		},
		{
			Type = "Asset",
			AssetId = 4318181564,
			Quantity = 8
		},
		{
			Type = "Asset",
			AssetId = 4318176323,
			Quantity = 12
		},
		{
			Type = "Asset",
			AssetId = 4318172802,
			Quantity = 9
		},
		{
			Type = "Asset",
			AssetId = 4318169979,
			Quantity = 9
		},
		{
			Type = "Asset",
			AssetId = 4318162438,
			Quantity = 7
		},
		{
			Type = "Asset",
			AssetId = 4318160008,
			Quantity = 6
		},
		{
			Type = "Asset",
			AssetId = 4318155367,
			Quantity = 6
		},
		{
			Type = "Asset",
			AssetId = 4318153180,
			Quantity = 6
		},
		{
			Type = "Asset",
			AssetId = 4318150819,
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 4308435452,
			Quantity = 2
		},
		{
			Type = "Asset",
			AssetId = 4515275986,
			Quantity = 8
		},
		{
			Type = "Asset",
			AssetId = 4515276339,
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 4515276882,
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 4515277412,
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 4515279612,
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 4515280446,
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 4515285461,
			Quantity = 5
		},
		{
			Type = "Asset",
			AssetId = 4504309001,
			Quantity = 5
		}
	},
	Cabin = {
		{
			Type = "House",
			HouseType = "Cabin",
			HouseFirstUpgrade = "Cabin",
			Quantity = 1,
			Visible = false
		},
		{
			Type = "Pet",
			Exclusive = true,
			Image = "rbxassetid://85765505992421",
			PetInfo = {
				EyeColor = "lifeforce_blue",
				Type = "SnowBird",
				Level = 2
			}
		},
		{
			Type = "Asset",
			AssetId = 705297287,
			Exclusive = true,
			Quantity = 1
		},
		{
			Type = "Asset",
			AssetId = 889206850,
			Exclusive = true,
			Quantity = 6
		},
		{
			Type = "Asset",
			AssetId = 651191705,
			Exclusive = true,
			Quantity = 6
		},
		{
			Type = "Asset",
			AssetId = 394567456,
			Quantity = 6
		},
		{
			Type = "Asset",
			AssetId = 4532074010,
			Quantity = 6
		},
		{
			Type = "Asset",
			AssetId = 4521620501,
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 4531584703,
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 678456323,
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 1948983984,
			Exclusive = true,
			Quantity = 1
		},
		{
			Type = "Capsule",
			Rarity = "Legendary",
			Quantity = 1
		},
		{
			Type = "Coins",
			Amount = 10000,
			Image = "rbxassetid://1684427805"
		},
		{
			Type = "Present",
			PresentType = "Christmas",
			Quantity = 5
		}
	},
	HalloweenBundle = {
		{
			Type = "House",
			HouseType = "Manor",
			HouseFirstUpgrade = "Manor",
			Quantity = 1,
			Visible = false
		},
		{
			Type = "Asset",
			AssetId = 7564733867,
			Image = "rbxassetid://94936859076239",
			ThumbnailScale = 1.2,
			Quantity = 1
		},
		{
			Type = "Asset",
			AssetId = 745625715,
			Image = "rbxassetid://89661853437855",
			ThumbnailScale = 1.2,
			Quantity = 1
		},
		{
			Type = "Pet",
			Image = "rbxassetid://113460651393678",
			PetInfo = {
				EyeColor = "hypervoid_red",
				Type = "Dog",
				Level = 2
			}
		},
		{
			Type = "Capsule",
			Rarity = "Legendary",
			Quantity = 1
		},
		{
			Type = "Coins",
			Amount = 15000,
			Image = "rbxassetid://1684427805"
		},
		{
			Type = "Asset",
			AssetId = 653645746,
			Image = "rbxassetid://132918453666182",
			Quantity = 1
		},
		{
			Type = "Asset",
			AssetId = 564583549,
			Quantity = 7
		},
		{
			Type = "Asset",
			AssetId = 736734786,
			Image = "rbxassetid://82811347614532",
			Quantity = 2
		},
		{
			Type = "Asset",
			AssetId = 903743673,
			Image = "rbxassetid://83536363464049",
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 634567878,
			Image = "rbxassetid://88668654313671",
			Quantity = 8
		},
		{
			Type = "Asset",
			AssetId = 738357936,
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 463838957,
			Quantity = 9
		},
		{
			Type = "Asset",
			AssetId = 753783589,
			Image = "rbxassetid://75162138174500",
			Quantity = 12
		},
		{
			Type = "Asset",
			AssetId = 367946745,
			Image = "rbxassetid://76057031713548",
			Quantity = 5
		},
		{
			Type = "Asset",
			AssetId = 923454630,
			Image = "rbxassetid://132918453666182",
			Quantity = 2
		},
		{
			Type = "Asset",
			AssetId = 590496574,
			Image = "rbxassetid://126772430802672",
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 136713574,
			Image = "rbxassetid://88668654313671",
			Quantity = 10
		},
		{
			Type = "Present",
			PresentType = "Halloween",
			Quantity = 5
		}
	},
	AutumnBundle = {
		{
			Type = "Asset",
			AssetId = 395845983,
			Quantity = 1
		},
		{
			Type = "Capsule",
			Rarity = "Legendary",
			Quantity = 1
		},
		{
			Type = "Coins",
			Amount = 10000,
			Image = "rbxassetid://1684427805"
		},
		{
			Type = "Asset",
			AssetId = 734754645,
			Quantity = 15
		},
		{
			Type = "Asset",
			AssetId = 729384734,
			Quantity = 5
		},
		{
			Type = "Asset",
			AssetId = 672349085,
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 968596735,
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 940375667,
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 519751974,
			Quantity = 4
		},
		{
			Type = "Asset",
			AssetId = 930945680,
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 789677676,
			Quantity = 3
		},
		{
			Type = "Pet",
			Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=82373213318591",
			PetInfo = {
				EyeColor = "autumn_orange",
				Type = "BrownCat",
				Level = 2
			}
		},
		{
			Type = "Present",
			PresentType = "Fall",
			Quantity = 3
		},
		{
			Type = "Asset",
			AssetId = 675483345,
			Quantity = 1
		},
		{
			Type = "Asset",
			AssetId = 667346345,
			Quantity = 1
		}
	}
}
t.CapsuleTypeToColor = {
	Common = Color3.fromRGB(0, 0, 255),
	Uncommon = Color3.fromRGB(0, 255, 0),
	Rare = Color3.fromRGB(255, 255, 0),
	Legendary = Color3.fromRGB(255, 0, 191),
	Mythic = Color3.fromRGB(0, 255, 255),
	Limited = Color3.fromRGB(73, 179, 49)
}
t.CapsuleTypeToImage = {
	Common = "rbxassetid://2258850699",
	Uncommon = "rbxassetid://2258852098",
	Rare = "rbxassetid://2258851782",
	Legendary = "rbxassetid://2258851487"
}
t.CapsuleDuplicateAmount = {
	Common = 25,
	Uncommon = 50,
	Rare = 100,
	Legendary = 200
}
t.PresentVideoAdProductId = if t.IsTestPlace then 3303963777 else 3304010141
local t39 = {}
t39.Common = if t.IsTestPlace then 367306001 else 372315247
t39.Uncommon = if t.IsTestPlace then 367306511 else 372315513
t39.Rare = if t.IsTestPlace then 367306293 else 372315710
t39.Legendary = if t.IsTestPlace then 367305780 else 372315960
t.CapsuleProductIds = t39
t.EmoteToEmoji = {
	Hi = "\240\159\145\139",
	Bye = "\240\159\145\139",
	Glee = "\240\159\152\132",
	Laugh = "\240\159\164\163",
	Sad = "\240\159\152\173",
	Think = "\240\159\164\148",
	Scared = "\240\159\152\177",
	Amazed = "\240\159\152\174",
	Angry = "\240\159\152\161",
	Confused = "\240\159\152\149",
	Sleep = "\240\159\152\180",
	Clap = "\240\159\145\143",
	Disgust = "\240\159\164\162",
	Evil = "\240\159\152\136",
	Shocked = "\240\159\152\178",
	Die = "\240\159\152\181",
	Whistle = "\240\159\142\181"
}
t.DiscountColors = {
	[0] = Color3.fromRGB(255, 255, 255),
	[10] = Color3.fromRGB(255, 255, 255),
	[25] = Color3.fromRGB(0, 0, 255),
	[50] = Color3.fromRGB(0, 255, 0),
	[75] = Color3.fromRGB(255, 255, 0),
	[90] = Color3.fromRGB(255, 0, 191),
	[100] = Color3.fromRGB(0, 0, 0)
}
t.LickableObjects = {
	BoxClosed = true,
	BoxOpen = true,
	Dough = true,
	MountainDew = true,
	Dew = true,
	Pizza = true,
	SupplyBox = true
}
t.InitialStarPoints = 100
t.PenaltyAmount = {
	WrongOrder = -10,
	IncorrectDialogResponse = -10,
	BurnedObject = -5,
	SlicedObject = -6,
	BurnedSoda = -5,
	BugsOnDough = -5,
	ClosedEmptyBox = -5,
	HeldDeliveryToolLong = -3,
	KickedOutOfOrderHole = -1
}
t.StarRating = {
	[0] = { 0, 10 },
	[1] = { 11, 30 },
	[2] = { 31, 80 },
	[3] = { 81, 100 }
}
t.StarPenalty = {
	[0] = 0,
	[1] = 0.3,
	[2] = 0.8,
	[3] = 1
}
t.CoolDownTimes = {
	GiveBonus = 10,
	BackToWork = 4,
	EmployeeOfTheDay = 15,
	NominateForBan = 11
}
t.JobXPAmount = {
	Cashier = 2,
	Cook = 2,
	Delivery = 2,
	Boxer = 2,
	Supplier = 1
}
t.ActionXP = {
	Feed = 30,
	Hold = 20,
	Pet = 20,
	Fetch = 20,
	Sleep = 20,
	CureSickness = 40,
	MedicineNotSick = 2
}
t.ShopPrices = {
	["Aura Pink"] = { 1111111 },
	PetHat = { -2 },
	Sausage = { 200, 2600, 8500, 12000, 15000, 30000 },
	Pepperoni = { 200, 2600, 8500, 12000, 15000, 30000 },
	Cheese = { 200, 2600, 8500, 12000, 15000, 30000 },
	Medicine = {
		50,
		60,
		70,
		80,
		90,
		100,
		110,
		120,
		130,
		140,
		150,
		160
	},
	Egg = { 2000, 9000, 15000, 30000 }
}
t.InventorySlotPrices = { 0, 12000, 40000, 100000 }
t.DoCutsceneForTraits = {
	Hatch = true,
	EyeColor = true,
	Teen = true,
	SkinColor = true,
	Adult = true
}
t.PetLifeStage = {
	Hatch = { 2, 2 },
	FavoriteFood = { 3, 6 },
	Personality = { 6, 12 },
	EyeColor = { 10, 15 },
	Teen = { 11, 13 },
	Buff = { 3, 8 },
	Buff2 = { 20, 25 },
	Buff3 = { 30, 40 },
	Adult = { 19, 22 },
	PetCommand = { 3, 4 },
	FetchCommand = { 6, 12 },
	StayCommand = { 14, 20 }
}
t.ShopPriceReductionTime = if t.IsStudio then 20 else 72000
t.FavoriteFoodImage = {
	Cheese = "rbxassetid://14110624467",
	Pepperoni = "rbxassetid://14110420836",
	Sausage = "rbxassetid://14111536550"
}
if game:GetService("RunService"):IsClient() or game:GetService("RunService"):IsStudio() and not game:GetService("RunService"):IsServer() then
	local v65 = game:GetService("GuiService"):IsTenFootInterface()
	if not v65 then
		game:GetService("RunService"):IsStudio()
		local isPizzaPlaceTestId = game.PlaceId == t.PizzaPlaceTestId
		v65 = false
	end
	t.GamepadEnabled = v65
	_G.GamepadEnabled = t.GamepadEnabled
	t.Plateform = if _G.GamepadEnabled then "Console" elseif game:GetService("UserInputService").TouchEnabled and not (game:GetService("UserInputService").MouseEnabled or game:GetService("UserInputService").KeyboardEnabled) then "Mobile" else "Computer"
	t.IsMobile = t.Plateform == "Mobile"
	require(game.ReplicatedStorage:WaitForChild("Library"))
	local Localization = require(game.ReplicatedStorage:WaitForChild("Localization"))
	t.Localization = Localization
	t.Translate = Localization.Translate
	t.IsEnglish = Localization.IsEnglish
	t.FormatNumber = Localization.FormatNumber
	t.RobloxLocaleId = if game:GetService("LocalizationService").RobloxLocaleId == "" then "en-us" else game:GetService("LocalizationService").RobloxLocaleId or "en-us"
end
t.PetNames = {}
for v68 in string.gmatch("Acorn\nAlvin\nAsia\nAudi\nBagel\nBalou\nBarclay\nBarney\nBeck\nBellatrix\nBianca\nBiloxi\nBirdie\nBiscuit\nBlanca\nBobbafett\nBodie\nBono\nBooboo\nBootsie\nBordeaux\nBrandy\nBren\nBronco\nBruin\nBubbles\nBuffy\nBurt\nButler\nButton\nCalvin\nCandy\nCarter\nCece\nCessa\nChandler\nChaucer\nChevy\nChina\nChoochoo\nCisco\nClaire\nCleopatra\nClooney\nCoconut\nConnor\nCosmo\nCrosby\nCupcake\nDaisy\nDallas\nDaphne\nDelilah\nDiva\nDoc\nDomino\nDonna\nDonovan\nDulus\nDutch\nEd\nElton\nElwood\nErnie\nFaith\nFaya\nFelix\nFig\nFiona\nFoxy\nFritz\nFuse\nGiblet\nGibson\nGingi\nGoofy\nGraysen\nGreystoke\nGuinness\nHershey\nHolly\nHoney\nHuck Finn\nHudson\nHutch\nIke\nIndira\nIris\nIvory\nJasmine\nJasper\nJazzy\nJeeves\nJenna\nJenne\nJoy\nKai\nKalua\nKaly\nKassie\nKaya\nKeanna\nKeesha\nKeiko\nKiefer\nKingston\nKoby\nKona\nLaguna\nLandon\nLarissa\nLefty\nLeia\nLexi\nLil\226\128\153bit\nLilypie\nLinus\nLogan\nLola\nLuca\nLucy\nLuke\nMadonna\nMalble\nMalibu\nMargo\nMarshmellow\nMarti\nMax\nMaya\nMeadow\nMercedes\nMerlot\nMerry\nMia\nMidnight\nMidori\nMika\nMilan\nMira\nMischa\nMitzi\nMoby\nMochi\nMonet\nMonkey\nMooshie\nMozart\nMr Big\nMuggles\nMulder\nMulligan\nMurphy\nMylo\nNanda\nNate\nNell\nNiana\nNico\nNoodle\nNugget\nOlive\nOnyx\nOtis\nOwen\nOzzie\nPaddington\nPaisley\nParis\nParker\nPaulie\nPazzo\nPeanut\nPearl\nPepper\nPersia\nPesci\nPhoenix\nPicasso\nPinot\nPipsie\nPixie\nPorche\nQuattro\nRamona\nRedford\nReece\nRico\nRobin Hood\nRocco\nRocky\nRomeo\nRoxie\nRufus\nRusty\nScotty\nScout\nShadow\nShaggy\nShane\nShaq\nSheba\nSilas\nSkip\nSkitty\nSkyler\nSmitty\nSnooky\nSnoopy\nSookie\nSpark\nSprite\nStitch\nStrsky\nSugar\nSummer\nSunny\nSushi\nSweetpea\nSyrah\nTallulah\nTango\nTank\nTanner\nTatertot\nTheo\nTibbs\nTimber\nTink\nToast\nToffee\nTonka\nVegas\nWednesday\nWilbur\nWillow\nWinnie\nWolfie\nYoshiko\nZach\nZara\nZeke\nZelda\nZeppelin\nZsaZsa", "%w+") do
	table.insert(t.PetNames, v68)
end
t.PetProperties = {
	["???"] = {
		Buff = nil,
		TeenColor = Color3.fromRGB(0, 0, 0)
	},
	Dog = {
		Name = "Dog",
		TeenColor = Color3.fromRGB(0, 0, 0)
	},
	Cat = {
		Name = "Cat",
		TeenColor = Color3.fromRGB(0, 0, 0)
	},
	BrownCat = {
		Name = "BrownCat",
		TeenColor = Color3.fromRGB(0, 0, 0)
	},
	SnowBird = {
		Name = "SnowBird",
		TeenColor = Color3.fromRGB(0, 0, 0)
	},
	Bunny = {
		Name = "Bunny",
		TeenColor = Color3.fromRGB(0, 0, 0)
	},
	Mouse = {
		Name = "Mouse",
		TeenColor = Color3.fromRGB(0, 0, 0)
	},
	Hamster = {
		Name = "Hamster",
		TeenColor = Color3.fromRGB(0, 0, 0)
	}
}
function t.ShortFormNumber(p1) --[[ ShortFormNumber | Line: 3118 ]]
	local v1 = tonumber(p1)
	if v1 >= 1000000 then
		return ("%0.1f"):format(v1 / 1000000) .. "M"
	end
	if v1 >= 1000 then
		return math.floor(v1 / 1000) .. "K"
	else
		return v1
	end
end
return t