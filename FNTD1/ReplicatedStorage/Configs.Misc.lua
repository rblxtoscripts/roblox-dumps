-- https://lua.expert/
local Ranks = require(game.ReplicatedStorage.Configs.Ranks)
local t = {
	GameIndexes = {
		6,
		6,
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
			50,
			55,
			60
		}
	},
	CanViewTopSouls = {
		460220193,
		121224620,
		2040614232,
		3789107515,
		2967144947,
		1564642171,
		116298455,
		305924526,
		2270432957,
		123772916,
		607249713,
		476736886,
		165643699,
		2288162994,
		174157170,
		3210000893
	},
	BanVersion = "Banned.v1",
	AuctionLeftGameStore = "AuctionLeftGame.v1",
	CanBan = {
		460220193,
		7270916259,
		121224620,
		2040614232,
		485269356,
		3789107515,
		383538816,
		3210000893,
		1564642171,
		142483354,
		3210000893,
		411522144,
		305924526,
		834275458,
		2967144947,
		116298455,
		2270432957,
		123772916,
		607249713,
		476736886,
		165643699,
		2288162994,
		174157170,
		2967144947,
		834275458
	},
	CanDeleteClan = {
		460220193,
		121224620,
		2040614232,
		383538816,
		3789107515,
		3210000893,
		1564642171,
		411522144,
		305924526,
		834275458,
		2967144947,
		116298455,
		2270432957,
		123772916,
		607249713,
		476736886,
		165643699,
		2288162994,
		174157170,
		153188016
	},
	CanGiveItems = {
		460220193,
		121224620,
		2040614232,
		383538816,
		3789107515,
		3210000893,
		1564642171,
		266081235,
		411522144,
		834275458,
		2967144947,
		116298455,
		305924526,
		2270432957,
		123772916,
		607249713,
		476736886,
		165643699,
		2288162994,
		174157170,
		3572569034,
		6219601416
	},
	CanGiveClanWins = {
		460220193,
		121224620,
		2040614232,
		383538816,
		3789107515,
		3210000893,
		1564642171,
		411522144,
		834275458,
		116298455,
		2967144947,
		305924526,
		153188016
	},
	TradeHistory = {
		460220193,
		170968285,
		144951739,
		1423777490,
		314962732,
		568851181,
		121224620,
		4511478100,
		5529301898,
		7270916259,
		393351670,
		245376854,
		2040614232,
		3789107515,
		70419606,
		1552957911,
		1564642171,
		383538816,
		90804648,
		3210000893,
		2464539705,
		65745056,
		1637447828,
		73533562,
		45960028,
		2431204934,
		3210000893,
		3423392624,
		485269356,
		45960028,
		411522144,
		834275458,
		142483354,
		305924526,
		2967144947,
		116298455,
		2270432957,
		123772916,
		607249713,
		476736886,
		165643699,
		2288162994,
		7285516401,
		174157170,
		2967144947,
		2541627596,
		834275458,
		3572569034,
		383538816,
		229281756,
		6219601416
	},
	PurchaseHistory = {
		460220193,
		170968285,
		144951739,
		1423777490,
		314962732,
		568851181,
		121224620,
		4511478100,
		5529301898,
		7270916259,
		393351670,
		245376854,
		2040614232,
		3789107515,
		70419606,
		1552957911,
		1564642171,
		383538816,
		90804648,
		3210000893,
		2464539705,
		65745056,
		1637447828,
		73533562,
		45960028,
		2431204934,
		3210000893,
		3423392624,
		485269356,
		45960028,
		411522144,
		834275458,
		142483354,
		305924526,
		2967144947,
		116298455,
		2270432957,
		123772916,
		607249713,
		476736886,
		165643699,
		2288162994,
		7285516401,
		174157170,
		2541627596,
		834275458,
		3572569034,
		6219601416
	},
	MarketHistory = {
		460220193,
		170968285,
		144951739,
		1423777490,
		314962732,
		568851181,
		121224620,
		4511478100,
		5529301898,
		7270916259,
		393351670,
		245376854,
		2040614232,
		3789107515,
		70419606,
		1552957911,
		1564642171,
		383538816,
		90804648,
		3210000893,
		2464539705,
		65745056,
		1637447828,
		73533562,
		45960028,
		2431204934,
		3210000893,
		3423392624,
		485269356,
		45960028,
		411522144,
		834275458,
		142483354,
		305924526,
		2967144947,
		116298455,
		2270432957,
		123772916,
		607249713,
		476736886,
		165643699,
		2288162994,
		7285516401,
		174157170,
		2967144947,
		2541627596,
		834275458,
		3572569034,
		6219601416
	},
	CanViewItems = {
		460220193,
		170968285,
		144951739,
		1423777490,
		314962732,
		568851181,
		121224620,
		4511478100,
		5529301898,
		7270916259,
		393351670,
		245376854,
		2040614232,
		3789107515,
		70419606,
		1552957911,
		1564642171,
		383538816,
		90804648,
		3210000893,
		2464539705,
		65745056,
		1637447828,
		73533562,
		45960028,
		2431204934,
		3210000893,
		3423392624,
		485269356,
		45960028,
		411522144,
		834275458,
		142483354,
		305924526,
		2967144947,
		116298455,
		2270432957,
		123772916,
		607249713,
		476736886,
		165643699,
		2288162994,
		7285516401,
		174157170,
		2967144947,
		2541627596,
		834275458,
		3572569034,
		6219601416
	},
	BypassCooldown = { 460220193, 1406380108, 3974970462 },
	TestingInventory = { 460220193, 3439313482, 411522144, 1653699562, 73533562, 3789107515, 383538816 },
	TestingGiveWins = { 460220193, 3439313482, 411522144, 1653699562, 73533562, 3789107515, 383538816 },
	RankedBans = { "Queen of Hearts Ballora", "Kronos Endo Freddy", "Sentinel Bonnie" },
	RankedBansRotation = {
		{ "Planet Buster Scott", "Michael\'s Demise", "Titan Crusher Freddy" },
		{ "Blighted Endo Bonnie", "The Glitched", "Chicazilla" },
		{ "Fetch", "The Blob", "Paleontologist Springbonnie" },
		{ "Drained Coffee", "Funtime Chica", "Frostbite Freddy" },
		{ "Michael\'s Demise", "Titan Crusher Freddy", "Queen of Hearts Ballora" },
		{ "Kronos Endo Freddy", "Sentinel Bonnie", "Chicazilla" },
		{ "The Glitched", "Dark Knight Puppet/Gilded", "The Blob" },
		{ "Lolbit", "Planet Buster Scott", "Paleontologist Springbonnie" }
	},
	SameTowers = {
		["Gilded Knight"] = "Dark Knight Puppet",
		["Gilded Jester Puppet"] = "Jester Puppet",
		["Neo Titan Freddy"] = "Titan Crusher Freddy"
	},
	EnchantShines = { "Vengeance", "Springlock", "Developer", "Overclock", "Investigator", "bear5", "Prototype", "Champion" },
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
		InfoPosition = { "Left", "Right", "Tower" }
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
	SpecialShinyBooster = {
		["Eclipse Ballora"] = "(+12.5%)"
	},
	SoulsCap = 2000000,
	OnUpdate = 46,
	RankSave = "normal.v6",
	ClanRewards = {
		{
			Requirement = 50,
			Reward = { "Present_ClanSeason9_1" }
		},
		{
			Requirement = 70,
			Reward = { "Item_Souls_20" }
		},
		{
			Requirement = 90,
			Reward = { "Present_ClanSeason9_1" }
		},
		{
			Requirement = 110,
			Reward = { "Tokens_20000" }
		},
		{
			Requirement = 130,
			Reward = { "Present_ClanSeason9_1" }
		},
		{
			Requirement = 150,
			Reward = { "Present_ExclusivePack9_1" }
		},
		{
			Requirement = 170,
			Reward = { "Present_ClanSeason9_2" }
		},
		{
			Requirement = 190,
			Reward = { "Item_Souls_25" }
		},
		{
			Requirement = 210,
			Reward = { "Present_ClanSeason9_2" }
		},
		{
			Requirement = 230,
			Reward = { "Tokens_30000" }
		},
		{
			Requirement = 250,
			Reward = { "Present_ClanSeason9_2" }
		},
		{
			Requirement = 270,
			Reward = { "Item_StatChips_25" }
		},
		{
			Requirement = 290,
			Reward = { "Present_ClanSeason9_3" }
		},
		{
			Requirement = 310,
			Reward = { "Item_Souls_30" }
		},
		{
			Requirement = 330,
			Reward = { "Present_ClanSeason9_3" }
		},
		{
			Requirement = 350,
			Reward = { "Tokens_40000" }
		},
		{
			Requirement = 370,
			Reward = { "Present_ClanSeason9_3" }
		},
		{
			Requirement = 390,
			Reward = { "Item_StatChips_50" }
		},
		{
			Requirement = 410,
			Reward = { "Present_ClanSeason9_5" }
		},
		{
			Requirement = 430,
			Reward = { "Present_ClanSeason9_5" }
		}
	},
	ClanQuestRewards = {
		Solo = {
			ClanPoints = 4
		},
		Multi = {
			ClanPoints = 10
		}
	},
	ClanQuests = {}
}
for i = 1, 8 do
	for j = 1, 6 do
		t.ClanQuests[string.format("Beat_%d_%d", i, j)] = {
			Message = string.format("Beat game %d night %d", i, j),
			Reward = t.ClanQuestRewards.Solo
		}
		for k = 1, 4 do
			local v1, v2, v3
			local v4 = string.format("Beat_%d_%d_%d", i, j, k)
			local t2 = {}
			local format = string.format
			if k == 1 then
				v1 = i
				v2 = j
				v3 = "alone"
			else
				v3 = string.format("with %d other player%s", k - 1, if k - 1 > 1 then "s" else "")
				v1 = i
				v2 = j
			end
			t2.Message = format("Beat game %d night %d %s", v1, v2, v3)
			t2.Reward = t.ClanQuestRewards.Multi
			t.ClanQuests[v4] = t2
		end
	end
end
function t.GetBanWeek(p1) --[[ GetBanWeek | Line: 154 | Upvalues: t (copy) ]]
	local v1 = os.time({
		year = 2025,
		month = 8,
		day = 30,
		hour = 19,
		min = 0,
		sec = 0
	})
	local sum = 1 + math.floor((os.time() - v1 + 4233600) / 604800)
	if not p1 then
		return sum
	end
	if t.RankedBansRotation[sum] then
		return t.RankedBansRotation[sum]
	end
	repeat
		sum = sum - #t.RankedBansRotation
	until t.RankedBansRotation[sum] or sum <= 0
	if t.RankedBansRotation[sum] then
		return t.RankedBansRotation[sum]
	else
		return t.RankedBansRotation[1]
	end
end
function t.GetReward(p1) --[[ GetReward | Line: 191 ]]
	if typeof(p1) == "table" then
		for k, v in pairs(p1) do
			p1 = v
			break
		end
	end
	if not p1 or typeof(p1) == "table" then
		return nil
	end
	local v1 = 1
	local v2 = ""
	if not string.find(p1, "_") then
		return nil
	end
	local v3 = 2
	local v4 = string.split(p1, "_")
	if tonumber(v4[2]) then
		v1 = v4[2]
		v3 = 2
	elseif tonumber(v4[3]) then
		v1 = v4[3]
		v3 = 3
	elseif tonumber(v4[4]) then
		v1 = v4[4]
		v3 = 4
	else
		if v4[1] then
			v3 = 2
		end
		if v4[2] then
			v3 = 3
		end
		if v4[3] then
			v3 = 4
		end
		if v4[4] then
			v3 = 5
		end
		if v4[5] then
			v3 = 6
		end
		if v4[6] then
			v3 = 7
		end
		if v4[7] then
			v3 = 8
		end
		if v4[8] then
			v3 = 9
		end
		if v4[9] then
			v3 = 10
		end
		if v4[10] then
			v3 = 11
		end
	end
	for i = 1, v3 - 1 do
		v2 = v2 .. v4[i] .. (if i == v3 - 1 then "" else "_")
	end
	return { v1, v2 }
end
function t.GetRank(p1) --[[ GetRank | Line: 234 | Upvalues: Ranks (copy) ]]
	if not p1 or p1 < 0 then
		p1 = 0
	end
	local v1 = -1
	local v2 = nil
	for k, v in pairs(Ranks) do
		if v1 < v.Requirement and v.Requirement <= p1 then
			v1 = v.Requirement
			v2 = k
		end
	end
	return v2
end
return t