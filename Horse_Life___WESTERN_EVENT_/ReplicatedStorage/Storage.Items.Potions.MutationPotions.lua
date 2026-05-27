-- https://lua.expert/
local v0 = "\240\159\167\172 Can be used on your horse to give the <b>Valentines</b> Mutations!"
return {
	WingUpgradePotion = {
		Rarity = "Epic",
		Image = 16841268147,
		Description = "\240\159\167\172 Can be used to upgrade Wing Mutations! \n<b>*\226\154\160\239\184\143</b><b><i> can only be used on horses that already have the mutation</i></b>",
		ToolType = "Consumable",
		ConsumableType = "UpgradeMutation",
		TargetMutationType = "Wings"
	},
	MorphoWingPotion = {
		Rarity = "Exclusive",
		Image = 79217861296059,
		Description = "\240\159\167\172 Can be used on your horse to give the morpho theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "DropletWings" }
	},
	BloxfestWingPotion = {
		Rarity = "Exclusive",
		Image = 100001032958733,
		Description = "\240\159\167\172 Can be used on your horse to give the Bloxfest theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "BloxfestWings" }
	},
	CupidWingPotion = {
		Rarity = "Valentines",
		Image = 94943624469472,
		Description = "\240\159\167\172 Can be used on your horse to give the Cupid theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "ThornedRosettesWings", "OvergrownWings", "LoveDoveWings" }
	},
	LemonadeWingPotion = {
		Rarity = "Exclusive",
		Image = 89928129906006,
		Description = "\240\159\167\172 Can be used on your horse to give the Lemonade theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "LemonadeWings" }
	},
	JewelWingPotion = {
		Rarity = "Exclusive",
		Image = 137665616887251,
		Description = "\240\159\167\172 Can be used on your horse to give the Jewel Butterfly theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "JewelButterflyWings" }
	},
	VaporwaveWingPotion = {
		Rarity = "Exclusive",
		Image = 125171908619196,
		Description = "\240\159\167\172 Can be used on your horse to give the Vaporwave theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "VaporwaveWings" }
	},
	RoyalWingPotion = {
		Rarity = "Royal",
		Image = 106774261871215,
		Description = "\240\159\167\172 Can be used on your horse to give the Royal theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "LookingGlassWings", "AdornedWings", "GeodeWings", "ChandelierWings" }
	},
	RainyWingPotion = {
		Rarity = "Exclusive",
		Image = 118422692360101,
		Description = "\240\159\167\172 Can be used on your horse to give the rainy theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "RainyWings" }
	},
	MedievalWingPotion = {
		Rarity = "95167727534027",
		Image = 127083361035547,
		Description = "\240\159\167\172 Can be used on your horse to give the medieval theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "AngelicWings", "RunicWings" }
	},
	LunarWingPotion = {
		Rarity = "Exclusive",
		Image = 73209087620678,
		Description = "\240\159\167\172 Can be used on your horse to give the lunar moth theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "LunarMothWings" }
	},
	RandomWingPotion = {
		Rarity = "Legendary",
		Image = 16841276193,
		Description = "\240\159\167\172 Can be used on your horse to give a random Wing Mutation!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings"
	},
	SpookyWingPotion = {
		Rarity = "Halloween",
		Image = 70744521193368,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Halloween</b> Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = {
			"DemonWings",
			"SkeletalDragonWing",
			"TornDragonWings",
			"ReaperWings",
			"SkeletonWings",
			"CreatureWings",
			"SoulBirdWings",
			"PhoenixGhostWings",
			"SkeletonSpiderWings"
		}
	},
	SweetWingPotion = {
		Rarity = "Valentines",
		Image = 79562136628362,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Valentines</b> Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "DrizzleflyWings", "FrostedWings", "SweetHeartBatWings", "GummyDragonWings", "LovelyFairyWings", "ThornedRosettesWings" }
	},
	FrozenWingPotion = {
		Rarity = "Christmas",
		Image = 83558646299333,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Christmas</b> Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "StarryWings", "BlizzardWings", "WyvernWings", "FrozenTitanWings", "FestiveDoubleWings", "TwinkleStarWings", "BorealisWings", "AuroraDragonWings" }
	},
	EasterWingPotion = {
		Rarity = "Easter",
		Image = 75680403033451,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Easter</b> Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "EasterEggWings", "PetalWings", "SpringFairyWings" }
	},
	CircusWingPotion = {
		Rarity = "Carnival",
		Image = 127687109366657,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Carnival</b> Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "ElegantScrollWings", "CarnivalWings", "JesterWings", "CircusTentWings" }
	},
	PlushWingPotion = {
		Rarity = "Legendary",
		Image = 86137164417211,
		Description = "\240\159\167\172 Can be used on your horse to give the plush theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "DIYPlushWings", "GlamPlushWings", "PlusherflyWings" }
	},
	PeryWingPotion = {
		Rarity = "Legendary",
		Image = 140595022163162,
		Description = "\240\159\167\172 Can be used on your horse to give the pery theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "RaptorWing", "FlaredWing", "PeacraneWings" }
	},
	FaeWingPotion = {
		Rarity = "Legendary",
		Image = 139393599588289,
		Description = "\240\159\167\172 Can be used on your horse to give the fae theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "ButterflyWings", "DragonflyWings", "CutlassWings" }
	},
	FloraWingPotion = {
		Rarity = "Legendary",
		Image = 90942561319374,
		Description = "\240\159\167\172 Can be used on your horse to give the flora theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "CloverWings", "LilyWings", "PetalLeafWings", "BloomingWings" }
	},
	HippoWingPotion = {
		Rarity = "Legendary",
		Image = 125585770031044,
		Description = "\240\159\167\172 Can be used on your horse to give the hippocampus theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "MantaRayWings", "SeahorseWings", "MermaidWings" }
	},
	CybredWingPotion = {
		Rarity = "Legendary",
		Image = 95458306793737,
		Description = "\240\159\167\172 Can be used on your horse to give the cybred theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "AeroFlapWings", "SteampunkBatWings", "FuturisticWings", "CyberWings" }
	},
	CelestialWingPotion = {
		Rarity = "Legendary",
		Image = 122634773703242,
		Description = "\240\159\167\172 Can be used on your horse to give the celestial theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "CelestialNovaWings", "MidnightDragonWings", "CrescentStardustWings" }
	},
	CactusWingPotion = {
		Rarity = "Legendary",
		Image = 96154910428046,
		Description = "\240\159\167\172 Can be used on your horse to give the cactaline theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "LocustWings", "CactusWings" }
	},
	SaurequineWingPotion = {
		Rarity = "Legendary",
		Image = 113772731898733,
		Description = "\240\159\167\172 Can be used on your horse to give the saurequine theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "FluffyPterosaurWings", "MicroraptorWings", "AmberMothWings" }
	},
	KirinWingPotion = {
		Rarity = "Legendary",
		Image = 86136878440348,
		Description = "\240\159\167\172 Can be used on your horse to give the kirin theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "AuricWings", "ScaledWings", "CloudWings", "ThornWings" }
	},
	SeraphWingPotion = {
		Rarity = "Legendary",
		Image = 71675716239061,
		Description = "\240\159\167\172 Can be used on your horse to give the seraph theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "DivineWings", "AngelicalFairyWings", "CorruptDivinityWings", "EyeWardenWings" }
	},
	AnticornWingPotion = {
		Rarity = "Legendary",
		Image = 130451859447075,
		Description = "\240\159\167\172 Can be used on your horse to give the Anticorn theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "CorruptedFlameWings", "WarWings", "DarkMagicWings", "CorruptedWings" }
	},
	BirdWingPotion = {
		NotReleasedYet = true,
		Rarity = "Legendary",
		Image = 87783714585857,
		Description = "\240\159\167\172 Can be used on your horse to give the bird theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "BirdWings", "NarrowWings", "BarredWings", "RavenWings", "RoundWings" }
	},
	FelorseWingPotion = {
		Rarity = "Legendary",
		Image = 119660395491271,
		Description = "\240\159\167\172 Can be used on your horse to give the felorse theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "FierceWings", "FelineWings", "PlayfulWings" }
	},
	AlienWingPotion = {
		Rarity = "Cosmic",
		Image = 94958018390645,
		Description = "\240\159\167\172 Can be used on your horse to give the equenari theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "ExtraterrestrialAnomalyWings", "EldritchWings", "MutatedTendrilWings", "FishEyedWings" }
	},
	TesterWingPotion = {
		Rarity = "Exclusive",
		Image = 111305840528989,
		Description = "\240\159\167\172 Can be used on your horse to give the tester theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "ShatteredIceWings" }
	},
	ModeratorWingPotion = {
		Rarity = "Exclusive",
		Image = 103153457445028,
		Description = "\240\159\167\172 Can be used on your horse to give the moderator theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "DawnFireWings" }
	},
	LegoWingPotion = {
		DisplayName = "LEGO\194\174 Wing Potion",
		ForcedDisplayName = "LEGO\194\174 Wing Potion",
		Rarity = "Exclusive",
		Image = 78227192062079,
		Description = "\240\159\167\172 Can be used on your LEGO Horse to give the LEGO theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "LEGOWings" }
	},
	HeartBreakWingPotion = {
		NotReleasedYet = true,
		Rarity = "Valentines",
		Image = 121939013178521,
		Description = "\240\159\167\172 Can be used on your horse to give the HeartBreak theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "HeartBreakWings" }
	},
	NewYearsWingPotion = {
		Rarity = "NewYears",
		Image = 102657975396920,
		Description = "\240\159\167\172 Can be used on your horse to give the NewYears theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "FireworkDragonWings" }
	},
	DangoWingPotion = {
		Rarity = "Exclusive",
		Image = 113723686730710,
		Description = "\240\159\167\172 Can be used on your horse to give the Dango theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "DangoWings" }
	},
	LunarNewYearsWingPotion = {
		Rarity = "NewYears",
		Image = 83036741196504,
		Description = "\240\159\167\172 Can be used on your horse to give the Lunar New Years theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "LunarNewYearWings" }
	},
	HauntedMutationPotion = {
		Rarity = "Halloween",
		Image = 80600061615152,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Halloween</b> Mutations!",
		QuickfeedDesc = "Rewards a random Halloween Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Halloween",
		SpecificPullTable = { "Ghost", "Ghoul" }
	},
	LoveMutationPotion = {
		Rarity = "Valentines",
		Image = 120792299438284,
		Description = v0,
		QuickfeedDesc = "Rewards a random Valentine Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "RoseInfection" }
	},
	LaceboundMutationPotion = {
		Rarity = "Valentines",
		Image = 130013338142807,
		Description = v0,
		QuickfeedDesc = "Rewards a random Valentine Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "Lacebound" }
	},
	SpiritMutationPotion = {
		Rarity = "Exclusive",
		Image = 75649040423706,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Spirit</b> Mutations!",
		QuickfeedDesc = "Rewards a random Spirit Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "Arisen" }
	},
	RoyalMutationPotion = {
		Rarity = "Royal",
		Image = 140301802415952,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Royal</b> Mutations!",
		QuickfeedDesc = "Rewards a random Royal Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "Crystalized" }
	},
	AlienMutationPotion = {
		Rarity = "Cosmic",
		Image = 77695482227136,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Alien</b> Mutations!",
		QuickfeedDesc = "Rewards a random Alien Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "Alien" }
	},
	NorthStarMutationPotion = {
		Rarity = "Christmas",
		Image = 70683473690874,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>North Star</b> Mutations!",
		QuickfeedDesc = "Rewards a random North Star Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "NorthStar" }
	},
	FestiveEyePotion = {
		Rarity = "Christmas",
		Image = 86392199912301,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Festive Eye</b> Mutations!",
		QuickfeedDesc = "Rewards a random Festive Eye Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "FestiveEye" }
	},
	FrostMutationPotion = {
		Rarity = "Christmas",
		Image = 86716231491577,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Frost</b> Mutations!",
		QuickfeedDesc = "Rewards a random Frost Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "Frost" }
	},
	FantasyWingPotion = {
		Rarity = "Exclusive",
		Image = 17560159838,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Fantasy Wings</b> Mutation!",
		ToolType = "Consumable",
		ConsumableType = "Mutation",
		TargetMutation = "FantasyWings"
	},
	SakuraWingPotion = {
		Rarity = "Exclusive",
		Image = 108957572859329,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Sakura Wings</b> Mutation!",
		ToolType = "Consumable",
		ConsumableType = "Mutation",
		TargetMutation = "SakuraWings"
	},
	AutumnWingPotion = {
		Rarity = "Autumn",
		Image = 75649493380748,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Autumn Wings</b> Mutation!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "MapleWings", "MapleMonarchWings", "FriedChickenWings" }
	},
	MutationDeletePotion = {
		Rarity = "Legendary",
		Image = 18195547700,
		Description = "\240\159\167\172\226\157\140 Can be used to <b>delete</b> a mutation off your horse!",
		ToolType = "Consumable"
	},
	MutationPotion = {
		Rarity = "Legendary",
		Image = 18240700876,
		Description = "\240\159\167\172\226\153\187\239\184\143 Can be used to roll a random mutation on your horse!"
	},
	MutationSlotPotion = {
		Rarity = "Legendary",
		Image = 97352271797248,
		Description = "\240\159\167\172\226\158\149 Can be used to add an empty mutation slot to your horse!",
		ToolType = "Consumable",
		Tradelocked = true
	},
	CandyFlossWingPotion = {
		Rarity = "Exclusive",
		Image = 91070620614492,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>CandyFlossWing</b> Mutation!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "CandyFlossWings" }
	},
	NephyrianWingPotion = {
		Rarity = "Legendary",
		Image = 109919406726988,
		Description = "\240\159\167\172 Can be used on your horse to give them the Soft Cloud Wings Mutation!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "SoftcloudWings" }
	},
	FestiveWingPotion = {
		Rarity = "Christmas",
		Image = 90402514913701,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Festive Wing</b> Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "FestiveFeatherWings" }
	},
	HoneyWingPotion = {
		Rarity = "Easter",
		Image = 133527642730544,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Honey Wing</b> Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "EmberhiveWings", "FlowingHoneyWings", "PollinatorWings", "HoneybeeWings" }
	},
	BunnyWingPotion = {
		Rarity = "Easter",
		Image = 88836629419262,
		Description = "\240\159\167\172 Can be used on your horse to give them Bunny theme Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "BunnyWings" }
	},
	SakuraMutationPotion = {
		Rarity = "Easter",
		Image = 108026644396879,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Flowering Sakura</b> Mutation!",
		QuickfeedDesc = "Rewards Flowering Sakura Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "FloweringSakura" }
	},
	PorcelainMutationPotion = {
		Rarity = "Easter",
		Image = 126718971312383,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Porcelain</b> Mutation!",
		QuickfeedDesc = "Rewards Porcelain Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "Porcelain" }
	},
	ArcaneWingPotion = {
		Rarity = "Exclusive",
		Image = 124102114626841,
		Description = "\240\159\167\172 Can be used on your horse to give them Arcane themed Wing Mutations!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "FeatheredArcaneWings", "FlutteringArcaneWings" }
	},
	ArtisanMutationPotion = {
		Rarity = "Exclusive",
		Image = 111030008500160,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Artisan</b> Mutation!",
		QuickfeedDesc = "Rewards Artisan Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "Artisan" }
	},
	CaniquineWingPotion = {
		Rarity = "Rare",
		Image = 113749041288838,
		Description = "\240\159\167\172 Can be used on your horse to give them the Wild Wings mutation!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "WildWings" }
	},
	ArcaneMutationPotion = {
		Rarity = "Exclusive",
		Image = 73975758311269,
		Description = "\240\159\167\172 Can be used on your horse to give the <b>Arcane</b> Mutation!",
		QuickfeedDesc = "Rewards Arcane Mutation",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Mutation",
		SpecificPullTable = { "Arcane" }
	},
	WesternWingPotion = {
		Rarity = "Western",
		Image = 83865063745939,
		Description = "\240\159\167\172 Can be used on your horse to give them the Sheriff wings mutation!",
		ToolType = "Consumable",
		ConsumableType = "RandomMutation",
		TargetMutationType = "Wings",
		SpecificPullTable = { "SheriffWings" }
	}
}