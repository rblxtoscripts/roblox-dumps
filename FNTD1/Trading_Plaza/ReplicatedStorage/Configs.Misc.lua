-- https://lua.expert/
local t = {
	BanVersion = "Banned.v1",
	TradeHistory = {},
	PurchaseHistory = {},
	MarketHistory = {},
	CanBan = {},
	SellValues = {
		Uncommon = 10,
		Rare = 20,
		Epic = 30,
		Mythic = 50,
		Secret = 100,
		Nightmare = 500,
		Apex = 10000,
		Forgotten = 50000
	},
	SpecialSettings = {
		InfoPosition = { "Tower", "Left", "Right" }
	},
	ClanImages = {
		"rbxassetid://17758801602",
		"rbxassetid://18149057321",
		"rbxassetid://17866795652",
		"rbxassetid://17866932531",
		"rbxassetid://17851327972",
		"rbxassetid://16781506061",
		"rbxassetid://16767302117",
		"rbxassetid://16767097723",
		"rbxassetid://16767255332",
		"rbxassetid://16767201699",
		"rbxassetid://16767178920",
		"rbxassetid://16767154477",
		"rbxassetid://18161347460",
		"rbxassetid://18151573285",
		"rbxassetid://18151575297",
		"rbxassetid://17851205149",
		"rbxassetid://17689695988",
		"rbxassetid://17689713814",
		"rbxassetid://17690383931",
		"rbxassetid://17851638702",
		"rbxassetid://17802016570",
		"rbxassetid://17629034232",
		"rbxassetid://16781122207",
		"rbxassetid://16781077553",
		"rbxassetid://17270065249",
		"rbxassetid://16781119726",
		"rbxassetid://16781017510",
		"rbxassetid://16781095520",
		"rbxassetid://16780983603",
		"rbxassetid://16781197179",
		"rbxassetid://16632217188",
		"rbxassetid://16632239120",
		"rbxassetid://16632135968",
		"rbxassetid://16632209265",
		"rbxassetid://16620268084",
		"rbxassetid://16620218689",
		"rbxassetid://16620303027",
		"rbxassetid://16620053009",
		"rbxassetid://17645435518",
		"rbxassetid://17645357275",
		"rbxassetid://17628866369",
		"rbxassetid://17645359361",
		"rbxassetid://17645427747",
		"rbxassetid://18101588558",
		"rbxassetid://18255813345",
		"rbxassetid://130168982034034",
		"rbxassetid://138634254895239",
		"rbxassetid://95407534025882",
		"rbxassetid://86604943457071",
		"rbxassetid://75495154036126",
		"rbxassetid://87312476983878",
		"rbxassetid://95564353539990",
		"rbxassetid://130800122285848",
		"rbxassetid://79281029634533",
		"rbxassetid://128903190044752",
		"rbxassetid://89683904091075",
		"rbxassetid://134318454455185",
		"rbxassetid://86213031666835",
		"rbxassetid://78775426136136"
	},
	SlotCosts = {
		["4"] = 5,
		["5"] = 20,
		["6"] = 125
	},
	SoulsCap = 2000000,
	BypassCooldown = {},
	ProServerRequirement = 300,
	GameIndexes = {
		6,
		6,
		6,
		6,
		6,
		6,
		6,
		6
	},
	IndexRewards = {
		GameRewards = {
			15,
			20,
			25,
			30,
			35,
			40,
			45,
			50
		}
	},
	AuctionLeftGameStore = "AuctionLeftGame.v1",
	Rarities = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Mythic",
		"Secret",
		"Nightmare",
		"Forgotten",
		"Apex"
	},
	EnchantShines = { "Vengeance", "Springlock", "Developer", "Overclock" },
	SameTowers = {
		["Gilded Knight"] = "Dark Knight Puppet",
		["Gilded Jester Puppet"] = "Jester Puppet",
		["Neo Titan Freddy"] = "Titan Crusher Freddy"
	},
	SpecialShinyBooster = {
		["Eclipse Ballora"] = "(+12.5%)"
	},
	ClanRewards = {
		{
			Requirement = 50,
			Reward = { "Present_ClanSeason5_1" }
		},
		{
			Requirement = 70,
			Reward = { "Item_Souls_5" }
		},
		{
			Requirement = 90,
			Reward = { "Present_ClanSeason5_1" }
		},
		{
			Requirement = 110,
			Reward = { "Tokens_400" }
		},
		{
			Requirement = 130,
			Reward = { "Present_ClanSeason5_1" }
		},
		{
			Requirement = 150,
			Reward = { "Item_EpicRemnant_1" }
		},
		{
			Requirement = 170,
			Reward = { "Present_ClanSeason5_2" }
		},
		{
			Requirement = 190,
			Reward = { "Item_Souls_7" }
		},
		{
			Requirement = 210,
			Reward = { "Present_ClanSeason5_2" }
		},
		{
			Requirement = 230,
			Reward = { "Tokens_500" }
		},
		{
			Requirement = 250,
			Reward = { "Present_ClanSeason5_2" }
		},
		{
			Requirement = 270,
			Reward = { "Item_MythicRemnant_1" }
		},
		{
			Requirement = 290,
			Reward = { "Present_ClanSeason5_3" }
		},
		{
			Requirement = 310,
			Reward = { "Item_Souls_10" }
		},
		{
			Requirement = 330,
			Reward = { "Present_ClanSeason5_3" }
		},
		{
			Requirement = 350,
			Reward = { "Tokens_700" }
		},
		{
			Requirement = 370,
			Reward = { "Present_ClanSeason5_3" }
		},
		{
			Requirement = 390,
			Reward = { "Item_Souls_10" }
		},
		{
			Requirement = 410,
			Reward = { "Present_ClanSeason5_5" }
		},
		{
			Requirement = 430,
			Reward = { "Present_ClanSeason5_5" }
		}
	},
	ClanQuestRewards = {
		Solo = {
			ClanPoints = 4
		},
		Multi = {
			ClanPoints = 10
		}
	}
}
t.ClanQuests = {
	Beat_1_1 = {
		Message = "Beat game 1 night 1",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_1_1 = {
		Message = "Beat game 1 night 1 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_1_2 = {
		Message = "Beat game 1 night 1 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_1_3 = {
		Message = "Beat game 1 night 1 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_1_4 = {
		Message = "Beat game 1 night 1 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_2 = {
		Message = "Beat game 1 night 2",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_2_1 = {
		Message = "Beat game 1 night 2 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_2_2 = {
		Message = "Beat game 1 night 2 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_2_3 = {
		Message = "Beat game 1 night 2 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_2_4 = {
		Message = "Beat game 1 night 2 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_3 = {
		Message = "Beat game 1 night 3",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_3_1 = {
		Message = "Beat game 1 night 3 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_3_2 = {
		Message = "Beat game 1 night 3 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_3_3 = {
		Message = "Beat game 1 night 3 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_3_4 = {
		Message = "Beat game 1 night 3 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_4 = {
		Message = "Beat game 1 night 4",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_4_1 = {
		Message = "Beat game 1 night 4 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_4_2 = {
		Message = "Beat game 1 night 4 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_4_3 = {
		Message = "Beat game 1 night 4 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_4_4 = {
		Message = "Beat game 1 night 4 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_5 = {
		Message = "Beat game 1 night 5",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_5_1 = {
		Message = "Beat game 1 night 5 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_5_2 = {
		Message = "Beat game 1 night 5 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_5_3 = {
		Message = "Beat game 1 night 5 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_5_4 = {
		Message = "Beat game 1 night 5 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_6 = {
		Message = "Beat game 1 night 6",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_6_1 = {
		Message = "Beat game 1 night 6 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_1_6_2 = {
		Message = "Beat game 1 night 6 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_6_3 = {
		Message = "Beat game 1 night 6 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_1_6_4 = {
		Message = "Beat game 1 night 6 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_1 = {
		Message = "Beat game 2 night 1",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_1_1 = {
		Message = "Beat game 2 night 1 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_1_2 = {
		Message = "Beat game 2 night 1 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_1_3 = {
		Message = "Beat game 2 night 1 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_1_4 = {
		Message = "Beat game 2 night 1 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_2 = {
		Message = "Beat game 2 night 2",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_2_1 = {
		Message = "Beat game 2 night 2 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_2_2 = {
		Message = "Beat game 2 night 2 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_2_3 = {
		Message = "Beat game 2 night 2 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_2_4 = {
		Message = "Beat game 2 night 2 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_3 = {
		Message = "Beat game 2 night 3",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_3_1 = {
		Message = "Beat game 2 night 3 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_3_2 = {
		Message = "Beat game 2 night 3 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_3_3 = {
		Message = "Beat game 2 night 3 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_3_4 = {
		Message = "Beat game 2 night 3 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_4 = {
		Message = "Beat game 2 night 4",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_4_1 = {
		Message = "Beat game 2 night 4 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_4_2 = {
		Message = "Beat game 2 night 4 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_4_3 = {
		Message = "Beat game 2 night 4 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_4_4 = {
		Message = "Beat game 2 night 4 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_5 = {
		Message = "Beat game 2 night 5",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_5_1 = {
		Message = "Beat game 2 night 5 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_5_2 = {
		Message = "Beat game 2 night 5 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_5_3 = {
		Message = "Beat game 2 night 5 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_5_4 = {
		Message = "Beat game 2 night 5 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_6 = {
		Message = "Beat game 2 night 6",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_6_1 = {
		Message = "Beat game 2 night 6 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_2_6_2 = {
		Message = "Beat game 2 night 6 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_6_3 = {
		Message = "Beat game 2 night 6 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_2_6_4 = {
		Message = "Beat game 2 night 6 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_1 = {
		Message = "Beat game 3 night 1",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_1_1 = {
		Message = "Beat game 3 night 1 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_1_2 = {
		Message = "Beat game 3 night 1 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_1_3 = {
		Message = "Beat game 3 night 1 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_1_4 = {
		Message = "Beat game 3 night 1 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_2 = {
		Message = "Beat game 3 night 2",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_2_1 = {
		Message = "Beat game 3 night 2 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_2_2 = {
		Message = "Beat game 3 night 2 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_2_3 = {
		Message = "Beat game 3 night 2 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_2_4 = {
		Message = "Beat game 3 night 2 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_3 = {
		Message = "Beat game 3 night 3",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_3_1 = {
		Message = "Beat game 3 night 3 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_3_2 = {
		Message = "Beat game 3 night 3 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_3_3 = {
		Message = "Beat game 3 night 3 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_3_4 = {
		Message = "Beat game 3 night 3 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_4 = {
		Message = "Beat game 3 night 4",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_4_1 = {
		Message = "Beat game 3 night 4 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_4_2 = {
		Message = "Beat game 3 night 4 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_4_3 = {
		Message = "Beat game 3 night 4 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_4_4 = {
		Message = "Beat game 3 night 4 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_5 = {
		Message = "Beat game 3 night 5",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_5_1 = {
		Message = "Beat game 3 night 5 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_5_2 = {
		Message = "Beat game 3 night 5 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_5_3 = {
		Message = "Beat game 3 night 5 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_5_4 = {
		Message = "Beat game 3 night 5 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_6 = {
		Message = "Beat game 3 night 6",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_6_1 = {
		Message = "Beat game 3 night 6 alone",
		Reward = t.ClanQuestRewards.Solo
	},
	Beat_3_6_2 = {
		Message = "Beat game 3 night 6 with 1 other player",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_6_3 = {
		Message = "Beat game 3 night 6 with 2 other players",
		Reward = t.ClanQuestRewards.Multi
	},
	Beat_3_6_4 = {
		Message = "Beat game 3 night 6 with 3 other players",
		Reward = t.ClanQuestRewards.Multi
	}
}
return table.freeze(t)