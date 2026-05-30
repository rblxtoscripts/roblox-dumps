-- https://lua.expert/
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Quests = ReplicatedStorage.Remotes.Quests
local Notify = ReplicatedStorage.Remotes.Misc.Notify
local UpdateData = ReplicatedStorage.Remotes.PlayerData.UpdateData
local v1 = if LocalPlayer then nil else require(ServerScriptService.PlayerData.Manager)
require(ReplicatedStorage.Libs.Formatter)
local Misc = require(ReplicatedStorage.Configs.Misc)
local v3 = if LocalPlayer then nil else (if LocalPlayer then nil else game:GetService("DataStoreService")):GetDataStore("GlobalQuests.v1")
local t = {
	Rewards = {
		Easy = { "Tokens_200", "SeasonPassXP_30" },
		Medium = { "Tokens_500", "SeasonPassXP_75" },
		Hard = { "Tokens_1000", "SeasonPassXP_150" }
	},
	EventRewards = {
		Easy = {
			Tokens = 500,
			XP = 30
		},
		Medium = {
			Tokens = 750,
			XP = 75
		},
		Hard = {
			Tokens = 1000,
			XP = 150
		}
	},
	Ranks = {
		{
			Name = "New Recruit",
			Wins = 0
		},
		{
			Name = "Experienced Nightguard",
			Wins = 100
		},
		{
			Name = "Veteran Nightguard",
			Wins = 200
		}
	},
	Normal = {
		NightShift1 = {
			Title = "Night Shift",
			Message = "Complete 5 nights",
			Requirement = 5,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		NightShift2 = {
			Title = "Night Shift",
			Message = "Complete 6 nights in game -x-",
			Requirement = 6,
			Special = { "1", "2", "3" },
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		NightShift3 = {
			Title = "Night Shift",
			Message = "Complete 6 nights in game -x-",
			Requirement = 6,
			Special = { "4", "5", "6", "7" },
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		EndlessNights1 = {
			Title = "Endless Nights",
			Message = "Complete 50 waves in any Endless Game",
			Requirement = 50,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		EndlessNights2 = {
			Title = "Endless Nights",
			Message = "Complete 100 waves in any Endless Game",
			Requirement = 100,
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		EndlessNights3 = {
			Title = "Endless Nights",
			Message = "Complete 150 waves in Endless -x-",
			Requirement = 150,
			Special = { "4", "5", "6", "7" },
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		BossRaider1 = {
			Title = "Boss Raider",
			Message = "Complete 100 waves of Boss Raids",
			Requirement = 100,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		BossRaider2 = {
			Title = "Boss Raider",
			Message = "Complete 150 waves of Boss Raids",
			Requirement = 150,
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		BossRaider3 = {
			Title = "Boss Raider",
			Message = "Complete 200 waves of Boss Raids",
			Requirement = 200,
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		BossRaidKiller1 = {
			Title = "Boss Raid Killer",
			Message = "Defeat 5 Bosses in Boss Raids",
			Requirement = 5,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		BossRaidKiller2 = {
			Title = "Boss Raid Killer",
			Message = "Defeat 10 Bosses in Boss Raids",
			Requirement = 10,
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		BossRaidKiller3 = {
			Title = "Boss Raid Killer",
			Message = "Defeat 15 Bosses in Boss Raids",
			Requirement = 15,
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		Summon1 = {
			Title = "Summoner",
			Message = "Summon 50 times",
			Requirement = 50,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		Summon2 = {
			Title = "Summoner",
			Message = "Summon 100 times",
			Requirement = 100,
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		Summon3 = {
			Title = "Summoner",
			Message = "Summon 250 times",
			Requirement = 250,
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		StatChip1 = {
			Title = "Animatronic Engineer",
			Message = "Use 3 stat chips",
			Requirement = 3,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		StatChip2 = {
			Title = "Animatronic Engineer",
			Message = "Use 5 stat chips",
			Requirement = 5,
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		StatChip3 = {
			Title = "Animatronic Engineer",
			Message = "Use 10 stat chips",
			Requirement = 10,
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		Enchant1 = {
			Title = "Enchanter",
			Message = "Enchant a unit 10 times",
			Requirement = 10,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		Enchant2 = {
			Title = "Enchanter",
			Message = "Enchant a unit 50 times",
			Requirement = 50,
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		Enchant3 = {
			Title = "Enchanter",
			Message = "Enchant a unit 200 times",
			Requirement = 200,
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		Salvager1 = {
			Title = "Salvager",
			Message = "Salvage 5 materials",
			Requirement = 5,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		Salvager2 = {
			Title = "Salvager",
			Message = "Salvage 15 materials",
			Requirement = 15,
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		Salvager3 = {
			Title = "Salvager",
			Message = "Salvage 30 materials",
			Requirement = 30,
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		ClockedIn1 = {
			Title = "Clocked In",
			Message = "Play for 20 minutes",
			Requirement = 20,
			Reward = { "Tokens_1000", "Item_Souls_50", "Item_StatChips_1", "SeasonPassXP_50" }
		},
		ClockedIn2 = {
			Title = "Clocked In",
			Message = "Play for 30 minutes",
			Requirement = 30,
			Reward = { "Death Tokens_2000", "Item_Souls_75", "Item_StatChips_3", "SeasonPassXP_50" }
		},
		ClockedIn3 = {
			Title = "Clocked In",
			Message = "Play for 40 minutes",
			Requirement = 40,
			Reward = { "Death Tokens_2000", "Item_Souls_100", "Item_StatChips_3", "SeasonPassXP_50" }
		}
	},
	Weekly = {
		BossKiller1 = {
			Title = "Boss Killer",
			Message = "Defeat 50 Bosses",
			Requirement = 50,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		BossKiller2 = {
			Title = "Boss Killer",
			Message = "Defeat 100 Bosses",
			Requirement = 100,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		BossKiller3 = {
			Title = "Boss Killer",
			Message = "Defeat 150 Bosses",
			Requirement = 150,
			Reward = { "Item_Souls_1000", "Item_StatChips_10", "SeasonPassXP_150" }
		},
		Salvager1 = {
			Title = "Master Salvager",
			Message = "Salvage 50 materials",
			Requirement = 50,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		Salvager2 = {
			Title = "Master Salvager",
			Message = "Salvage 100 materials",
			Requirement = 100,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		Salvager3 = {
			Title = "Master Salvager",
			Message = "Salvage 250 materials",
			Requirement = 250,
			Reward = { "Item_Souls_1000", "Item_StatChips_10", "SeasonPassXP_150" }
		},
		Summon1 = {
			Title = "Master Summoner",
			Message = "Summon 250 times",
			Requirement = 250,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		Summon2 = {
			Title = "Master Summoner",
			Message = "Summon 1000 times",
			Requirement = 1000,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		Summon3 = {
			Title = "Master Summoner",
			Message = "Summon 2500 times",
			Requirement = 2500,
			Reward = { "Item_Souls_1000", "Item_StatChips_10", "SeasonPassXP_150" }
		},
		Enchant1 = {
			Title = "Enchanter",
			Message = "Enchant a unit 250 times",
			Requirement = 250,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		Enchant2 = {
			Title = "Enchanter",
			Message = "Enchant a unit 1000 times",
			Requirement = 1000,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		Enchant3 = {
			Title = "Enchanter",
			Message = "Enchant a unit 5000 times",
			Requirement = 5000,
			Reward = { "Item_Souls_1000", "Item_StatChips_10", "SeasonPassXP_150" }
		},
		StatChip1 = {
			Title = "Circuit Breaker",
			Message = "Use 25 stat chips",
			Requirement = 25,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		StatChip2 = {
			Title = "Circuit Breaker",
			Message = "Use 50 stat chips",
			Requirement = 50,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		StatChip3 = {
			Title = "Circuit Breaker",
			Message = "Use 100 stat chips",
			Requirement = 100,
			Reward = { "Item_Souls_1000", "Item_StatChips_10", "SeasonPassXP_150" }
		},
		HoursPlaytime1 = {
			Title = "Playtime",
			Message = "Play for 3 hours",
			Requirement = 3,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		HoursPlaytime2 = {
			Title = "Playtime",
			Message = "Play for 5 hours",
			Requirement = 5,
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		HoursPlaytime3 = {
			Title = "Playtime",
			Message = "Play for 10 hours",
			Requirement = 10,
			Reward = { "Item_Souls_1000", "Item_StatChips_10", "SeasonPassXP_150" }
		},
		NightShift1 = {
			Title = "Overtime",
			Message = "Complete 12 nights in game -x-",
			Requirement = 12,
			Special = { "1", "2", "3" },
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		NightShift2 = {
			Title = "Overtime",
			Message = "Complete 12 nights in game -x-",
			Requirement = 12,
			Special = { "3", "4", "5" },
			Reward = { "Item_Souls_1000", "Item_StatChips_5", "SeasonPassXP_150" }
		},
		NightShiftNightmare3 = {
			Title = "Overtime",
			Message = "Complete 12 nights in game -x- on nightmare or above",
			Requirement = 12,
			Special = { "4", "5", "6", "7" },
			Reward = { "Item_Souls_1000", "Item_StatChips_10", "SeasonPassXP_150" }
		}
	},
	Special = {
		UltimatePower = {
			Title = "Ultimate Power",
			Message = "Roll a 0.01% Enchant on a unit",
			Requirement = 1,
			Reward = { "Item_Souls_5000", "Item_StatChips_50" }
		},
		TheStrongest = {
			Title = "The Strongest?",
			Message = "Summon or Open an Apex unit",
			Requirement = 1,
			Reward = { "Item_Souls_5000", "Item_StatChips_50" }
		},
		Freddy = {
			Title = "Freddy",
			Message = "Summon 200 Shiny Freddies",
			Requirement = 200,
			Reward = { "Item_Souls_5000", "Item_StatChips_50" }
		},
		GlitchedStat = {
			Title = "RWQFSFASXC",
			Message = "Obtain a glitched stat on a unit",
			Requirement = 1,
			Reward = { "Item_Souls_5000", "Item_StatChips_100" }
		}
	},
	Infinite = {
		InfiniteBossKiller1 = {
			Title = "Infinite Boss Killer",
			Message = "Defeat 3 Bosses in the event",
			Requirement = 3,
			Reward = { "NewSummer Tokens_9000", "Present_NewSummer1_3", "Item_Souls_100" }
		},
		InfiniteBossKiller2 = {
			Title = "Infinite Boss Killer",
			Message = "Defeat 4 Bosses in the event",
			Requirement = 5,
			Reward = { "NewSummer Tokens_12000", "Present_NewSummer1_6", "Item_Souls_125" }
		},
		InfiniteBossKiller3 = {
			Title = "Infinite Boss Killer",
			Message = "Defeat 10 Bosses in the event",
			Requirement = 10,
			Reward = { "NewSummer Tokens_15000", "Present_NewSummer1_9", "Item_Souls_200" }
		},
		InfiniteNightShifts1 = {
			Title = "Infinite Night Shift",
			Message = "Complete Night -x- 3 times in event game 1",
			Requirement = 3,
			Special = { "1", "2", "3", "4", "5" },
			Reward = { "NewSummer Tokens_3000", "Present_NewSummer1_1", "Item_Souls_30" }
		},
		InfiniteNightShiftsOther2 = {
			Title = "Infinite Night Shift",
			Message = "Complete Night -x- 3 times in event game 2",
			Requirement = 3,
			Special = { "1", "2", "3", "4", "5" },
			Reward = { "NewSummer Tokens_4000", "Present_NewSummer1_2", "Item_Souls_50" }
		},
		InfiniteNightShiftsNightmare3 = {
			Title = "Infinite Night Shift",
			Message = "Complete Night -x- on nightmare mode or above 3 times in event game 2",
			Requirement = 3,
			Special = { "1", "2", "3", "4", "5" },
			Reward = { "NewSummer Tokens_5000", "Present_NewSummer1_3", "Item_Souls_75" }
		},
		InfiniteSummoner1 = {
			Title = "Infinite Summoner",
			Message = "Summon in the event 50 times",
			Requirement = 50,
			Reward = { "NewSummer Tokens_3000", "Present_NewSummer1_1", "Item_Souls_50" }
		},
		InfiniteSummoner2 = {
			Title = "Infinite Summoner",
			Message = "Summon in the event 75 times",
			Requirement = 75,
			Reward = { "NewSummer Tokens_4000", "Present_NewSummer1_2", "Item_Souls_75" }
		},
		InfiniteSummoner3 = {
			Title = "Infinite Summoner",
			Message = "Summon in the event 100 times",
			Requirement = 100,
			Reward = { "NewSummer Tokens_5000", "Present_NewSummer1_3", "Item_Souls_100" }
		}
	}
}
t.Event = {
	WinNewSummer1 = {
		Message = "Win 5 NewSummer games",
		Requirement = 5,
		Reward = t.EventRewards.Easy
	},
	WinNewSummer2 = {
		Message = "Win 10 NewSummer games",
		Requirement = 10,
		Reward = t.EventRewards.Medium
	},
	WinNewSummer3 = {
		Message = "Win 20 NewSummer games",
		Requirement = 20,
		Reward = t.EventRewards.Hard
	},
	NewSummerSummon1 = {
		Message = "NewSummer summon 10 times",
		Requirement = 10,
		Reward = t.EventRewards.Easy
	},
	NewSummerSummon2 = {
		Message = "NewSummer summon 20 times",
		Requirement = 20,
		Reward = t.EventRewards.Medium
	},
	NewSummerSummon3 = {
		Message = "NewSummer summon 30 times",
		Requirement = 30,
		Reward = t.EventRewards.Hard
	},
	ShinyNewSummer = {
		Message = "Get a shiny unit from NewSummer summons",
		Requirement = 1,
		Reward = t.EventRewards.Hard
	},
	Salvage1 = {
		Message = "Salvage 5 items",
		Requirement = 5,
		Reward = t.EventRewards.Easy
	},
	Salvage2 = {
		Message = "Salvage 15 items",
		Requirement = 15,
		Reward = t.EventRewards.Medium
	},
	Salvage3 = {
		Message = "Salvage 30 items",
		Requirement = 30,
		Reward = t.EventRewards.Hard
	},
	Beat_900_1 = {
		Message = "Beat NewSummer game 1 night 1",
		Reward = t.EventRewards.Medium
	},
	Beat_900_2 = {
		Message = "Beat NewSummer game 1 night 2",
		Reward = t.EventRewards.Medium
	},
	Beat_900_3 = {
		Message = "Beat NewSummer game 1 night 3",
		Reward = t.EventRewards.Medium
	},
	Beat_900_4 = {
		Message = "Beat NewSummer game 1 night 4",
		Reward = t.EventRewards.Medium
	},
	Beat_900_5 = {
		Message = "Beat NewSummer game 1 night 5",
		Reward = t.EventRewards.Medium
	},
	Beat_901_1 = {
		Message = "Beat NewSummer game 2 night 1",
		Reward = t.EventRewards.Medium
	},
	Beat_901_2 = {
		Message = "Beat NewSummer game 2 night 2",
		Reward = t.EventRewards.Medium
	},
	Beat_901_3 = {
		Message = "Beat NewSummer game 2 night 3",
		Reward = t.EventRewards.Medium
	},
	Beat_901_4 = {
		Message = "Beat NewSummer game 2 night 4",
		Reward = t.EventRewards.Medium
	},
	Beat_901_5 = {
		Message = "Beat NewSummer game 2 night 5",
		Reward = t.EventRewards.Medium
	}
}
t.Global = {
	SpendTokens = {
		Message = "75 Million Coins Spent",
		Requirement = 75000000
	},
	SpendSouls = {
		Message = "50 Million Souls Spent",
		Requirement = 50000000
	},
	OpenPresents = {
		Message = "10 Million Presents Opened",
		Requirement = 10000000
	},
	CompleteGames = {
		Message = "5 Million Games Completed",
		Requirement = 5000000
	},
	Evolve = {
		Message = "75k Units Evolved",
		Requirement = 75000
	},
	Salvager = {
		Message = "50 Million Items salvaged",
		Requirement = 50000000
	},
	EloChange = {
		Message = "25k Elo Gained and Loss",
		Requirement = 25000
	},
	SpendMoney = {
		Message = "10 Billion Money spent",
		Requirement = 10000000000
	},
	SellMarket = {
		Message = "500k Items Sold on the market",
		Requirement = 500000
	}
}
t.Clans = Misc.ClanQuests
function t.GetPlayerRank(p1) --[[ GetPlayerRank | Line: 177 | Upvalues: v1 (copy), t (copy) ]]
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	local Wins = v12.Data.Wins
	local v2 = 0
	local v3 = 1
	for k, v in pairs(t.Ranks) do
		if v.Wins <= Wins and v2 < v.Wins then
			v2 = v.Wins
			v3 = k
		end
	end
	return v3
end
function t.GetRandomQuest(p1, p2) --[[ GetRandomQuest | Line: 195 | Upvalues: v1 (copy), t (copy), Misc (copy) ]]
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	local v2 = t[p2]
	local v3 = nil
	local v4 = nil
	if p2 == "Normal" or (p2 == "Weekly" or p2 == "Infinite") then
		local v5 = t.GetPlayerRank(p1)
		local t2 = {}
		for k, v in pairs(v2) do
			if string.find(k, v5) then
				t2[k] = v
			end
		end
		v2 = t2
	end
	local count = 0
	for k, v in pairs(v2) do
		count = count + 1
	end
	local v6 = false
	if p2 == "Clans" then
		local v7 = false
		for k, v in pairs(v12.Data.Quests[p2]) do
			if t.Clans[k].Reward == Misc.ClanQuestRewards.Solo then
				v7 = true
			end
		end
		if not v7 then
			v6 = true
		end
	end
	local v8 = nil
	while true do
		local v9
		local v10 = math.random(1, count)
		local count_2 = 0
		for k, v in pairs(v2) do
			count_2 = count_2 + 1
			if count_2 == v10 then
				v3 = k
			end
		end
		if t.Clans[v3] then
			v8 = t.Clans[v3]
		end
		task.wait()
		if not v12.Data.Quests[p2][v3] then
			v9 = if v6 and (v8 and v8.Reward == Misc.ClanQuestRewards.Solo) then true elseif v6 then false else true
			if v9 then
				local v11 = t[p2][v3]
				print(v11)
				if v11.Special then
					local count_3 = 0
					for k, v in pairs(v11.Special) do
						count_3 = count_3 + 1
					end
					local v122 = math.random(1, count_3)
					local count_4 = 0
					for k, v in pairs(v11.Special) do
						count_4 = count_4 + 1
						if count_4 == v122 then
							return v3, v
						end
					end
				end
				return v3, v4
			end
		end
	end
end
function t.Add(p1, p2) --[[ Add | Line: 271 | Upvalues: v1 (copy), t (copy), UpdateData (copy), Quests (copy) ]]
	if game.PlaceId ~= 17770150441 and game.PlaceId ~= 15846919378 then
		return
	end
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	if not v12.Data.Quests.Normal then
		v12.Data.Quests.Normal = {}
	end
	if not v12.Data.Quests.Clans then
		v12.Data.Quests.Clans = {}
	end
	if not v12.Data.Quests.Event then
		v12.Data.Quests.Event = {}
	end
	if not v12.Data.Quests.Weekly then
		v12.Data.Quests.Weekly = {}
	end
	if not v12.Data.Quests.Special then
		v12.Data.Quests.Special = {}
	end
	if not v12.Data.Quests.Infinite then
		v12.Data.Quests.Infinite = {}
	end
	local count = 0
	local v2 = false
	for k, v in pairs(v12.Data.Quests.Normal) do
		if v.Began and (not (os.time() - v.Began >= 86400) and (v.Version and v.Version == ".v4")) then
			count = count + 1
			continue
		end
		v12.Data.Quests.Normal[k] = nil
		v2 = true
	end
	local count_2 = 0
	for k, v in pairs(v12.Data.Quests.Clans) do
		if v.Began and (not (os.time() - v.Began >= 86400) and (v.Version and (v.Version == "clans.v2" and not v.Claimed))) then
			count_2 = count_2 + 1
			continue
		end
		v12.Data.Quests.Clans[k] = nil
		v2 = true
	end
	local count_3 = 0
	for k, v in pairs(v12.Data.Quests.Event) do
		if v.Began and (not (os.time() - v.Began >= 86400) and (v.Version and v.Version == "v3")) then
			count_3 = count_3 + 1
			continue
		end
		v12.Data.Quests.Event[k] = nil
		v2 = true
	end
	local count_4 = 0
	for k, v in pairs(v12.Data.Quests.Weekly) do
		if v.Began and (not (os.time() - v.Began >= 604800) and (v.Version and v.Version == ".v4")) then
			count_4 = count_4 + 1
			continue
		end
		v12.Data.Quests.Weekly[k] = nil
		v2 = true
	end
	local count_5 = 0
	for k, v in pairs(v12.Data.Quests.Special) do
		if v.Version and v.Version == ".v4" then
			count_5 = count_5 + 1
			continue
		end
		v12.Data.Quests.Special[k] = nil
		v2 = true
	end
	local count_6 = 0
	for k, v in pairs(v12.Data.Quests.Infinite) do
		if v.Version and (v.Version == "v3" and not v.Claimed) then
			count_6 = count_6 + 1
			continue
		end
		v12.Data.Quests.Infinite[k] = nil
		v2 = true
	end
	if count < 5 then
		for i = 1, 5 - count do
			local v3, v4 = t.GetRandomQuest(p1, "Normal")
			v12.Data.Quests.Normal[v3] = {
				Progress = 0,
				Version = ".v4",
				Name = v3,
				Began = os.time(),
				Special = v4
			}
			v2 = true
		end
	end
	if count_2 < 3 then
		for j = 1, 3 - count_2 do
			local v5 = t.GetRandomQuest(p1, "Clans")
			v12.Data.Quests.Clans[v5] = {
				Progress = 0,
				Version = "clans.v2",
				Name = v5,
				Began = os.time()
			}
			v2 = true
		end
	end
	if count_3 < 4 then
		for k = 1, 4 - count_3 do
			local v6 = t.GetRandomQuest(p1, "Event")
			v12.Data.Quests.Event[v6] = {
				Progress = 0,
				Version = "v3",
				Name = v6,
				Began = os.time()
			}
			v2 = true
		end
	end
	if count_4 < 5 then
		for n = 1, 5 - count_4 do
			local v7, v8 = t.GetRandomQuest(p1, "Weekly")
			v12.Data.Quests.Weekly[v7] = {
				Progress = 0,
				Version = ".v4",
				Name = v7,
				Began = os.time(),
				Special = v8
			}
			v2 = true
		end
	end
	if count_5 < 4 then
		for m = 1, 4 - count_5 do
			local v9 = t.GetRandomQuest(p1, "Special")
			v12.Data.Quests.Special[v9] = {
				Progress = 0,
				Version = ".v4",
				Name = v9,
				Began = os.time()
			}
			v2 = true
		end
	end
	if count_6 < 1 then
		for i = 1, 1 - count_6 do
			local v10, v11 = t.GetRandomQuest(p1, "Infinite")
			v12.Data.Quests.Infinite[v10] = {
				Progress = 0,
				Version = "v3",
				Name = v10,
				Began = os.time(),
				Special = v11
			}
			v2 = true
		end
	end
	if not (v2 or p2) then
		return
	end
	UpdateData:FireClient(p1, v12.Data)
	Quests.Update:FireClient(p1)
end
function t.DoTask(p1, p2, p3, p4) --[[ DoTask | Line: 400 | Upvalues: v1 (copy), t (copy) ]]
	if not p3 then
		p3 = 1
	end
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	if not v12.Data.Quests.Normal then
		v12.Data.Quests.Normal = {}
	end
	if not v12.Data.Quests.Clans then
		v12.Data.Quests.Clans = {}
	end
	if not v12.Data.Quests.Event then
		v12.Data.Quests.Event = {}
	end
	if not v12.Data.Quests.Weekly then
		v12.Data.Quests.Weekly = {}
	end
	if not v12.Data.Quests.Special then
		v12.Data.Quests.Special = {}
	end
	if not v12.Data.Quests.Infinite then
		v12.Data.Quests.Infinite = {}
	end
	if not v12.Data.Quests.Personal then
		v12.Data.Quests.Personal = {}
	end
	if not v12.Data.Quests.Global then
		v12.Data.Quests.Global = {}
	end
	for k, v in pairs(v12.Data.Quests.Normal) do
		if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
			local _ = t.Normal[k]
			v.Progress = v.Progress + p3
		end
	end
	for k, v in pairs(v12.Data.Quests.Weekly) do
		if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
			local _ = t.Weekly[k]
			v.Progress = v.Progress + p3
		end
	end
	for k, v in pairs(v12.Data.Quests.Clans) do
		if not v.Claimed and k == p2 then
			local _ = t.Clans[k]
			v.Progress = v.Progress + p3
		end
	end
	for k, v in pairs(v12.Data.Quests.Event) do
		if not v.Claimed and k == p2 then
			local _ = t.Event[k]
			v.Progress = v.Progress + p3
		end
	end
	for k, v in pairs(v12.Data.Quests.Special) do
		if not v.Claimed and k == p2 then
			local _ = t.Special[k]
			v.Progress = v.Progress + p3
		end
	end
	for k, v in pairs(v12.Data.Quests.Infinite) do
		if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
			local _ = t.Infinite[k]
			v.Progress = v.Progress + p3
		end
	end
	for k, v in pairs(v12.Data.Quests.Personal) do
		if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
			v.Progress = v.Progress + p3
		end
	end
	for k, v in pairs(v12.Data.Quests.Global) do
		if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
			v.Progress = v.Progress + p3
		end
	end
	task.spawn(doGlobalTask, p2, p3)
	t.Add(p1, true)
end
function t.Claim(p1, p2, p3) --[[ Claim | Line: 494 | Upvalues: v1 (copy), t (copy), ReplicatedStorage (copy) ]]
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	if not v12.Data.Quests.Normal then
		v12.Data.Quests.Normal = {}
	end
	if not v12.Data.Quests.Clans then
		v12.Data.Quests.Clans = {}
	end
	if not v12.Data.Quests.Event then
		v12.Data.Quests.Event = {}
	end
	if not v12.Data.Quests.Weekly then
		v12.Data.Quests.Weekly = {}
	end
	if not v12.Data.Quests.Special then
		v12.Data.Quests.Special = {}
	end
	if not v12.Data.Quests.Infinite then
		v12.Data.Quests.Infinite = {}
	end
	if not v12.Data.Quests[p3][p2] or v12.Data.Quests[p3][p2].Claimed then
		return
	end
	local v2 = t[p3][p2]
	if (if v2.Requirement then v2.Requirement else 1) <= v12.Data.Quests[p3][p2].Progress then
		pcall(function() --[[ Line: 511 | Upvalues: v2 (copy), p3 (copy), ReplicatedStorage (ref), p1 (copy) ]]
			local Reward = v2.Reward
			local t = {}
			if p3 == "Clans" then
				table.insert(t, "ClanPoints_" .. Reward.ClanPoints)
			elseif p3 == "Event" then
				table.insert(t, "NewSummer Tokens" .. "_" .. Reward.Tokens)
				table.insert(t, "NewSummerXP" .. "_" .. Reward.XP)
			else
				t = Reward
			end
			ReplicatedStorage.Remotes.PlayerData.GiveRewards:Fire(p1, t)
		end)
		v12.Data.Quests[p3][p2].Claimed = true
	end
	t.Add(p1, true)
end
local t2 = {}
function doGlobalTask(p1, p2) --[[ doGlobalTask | Line: 534 | Upvalues: t (copy), t2 (copy) ]]
	for k, v in pairs(t.Global) do
		if string.gsub(k, "%d+", "") == p1 then
			if not t2[p1] then
				t2[p1] = 0
			end
			local v1 = t2
			v1[p1] = v1[p1] + p2
		end
	end
end
function flushGlobalTasks() --[[ flushGlobalTasks | Line: 546 | Upvalues: t2 (copy), v3 (copy) ]]
	for k, v in pairs(t2) do
		if v ~= 0 then
			local v1, _ = pcall(function() --[[ Line: 549 | Upvalues: v3 (ref), k (copy), v (copy) ]]
				v3:IncrementAsync(k, v)
			end)
			if v1 then
				t2[k] = 0
			end
		end
	end
end
if not LocalPlayer then
	task.spawn(function() --[[ Line: 562 ]]
		while true do
			flushGlobalTasks()
			task.wait(60)
		end
	end)
	Quests.DoTask.Event:Connect(function(p1, p2, p3, p4) --[[ Line: 569 | Upvalues: t (copy) ]]
		t.DoTask(p1, p2, p3, p4)
	end)
end
if not LocalPlayer and (game.PlaceId == 17770150441 or game.PlaceId == 15846919378) then
	local t3 = {}
	function plrAdded(p1) --[[ plrAdded | Line: 576 | Upvalues: v1 (copy), t3 (copy), t (copy) ]]
		if v1.Profiles[p1] then
			t.Add(p1)
			return
		end
		if t3[p1.Name] then
			local v12 = t3
			local v2 = p1.Name
			v12[v2] = v12[v2] + 1
			if t3[p1.Name] >= 5 then
				t3[p1.Name] = nil
				return
			end
		else
			t3[p1.Name] = 1
		end
		task.wait(3)
		plrAdded(p1)
	end
	Players.PlayerAdded:Connect(plrAdded)
	local t4 = {}
	Quests.Claim.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 598 | Upvalues: t4 (copy), t (copy) ]]
		if not t4[p1.Name] then
			t4[p1.Name] = true
			delay(0.5, function() --[[ Line: 601 | Upvalues: t4 (ref), p1 (copy) ]]
				t4[p1.Name] = nil
			end)
			task.spawn(t.Claim, p1, p2, p3)
		end
	end)
	for i, v in ipairs(Players:GetPlayers()) do
		task.spawn(plrAdded, v)
	end
	task.spawn(function() --[[ Line: 614 | Upvalues: Players (copy), t (copy) ]]
		while true do
			task.wait(1)
			for i, v in ipairs(Players:GetPlayers()) do
				task.spawn(t.Add, v)
			end
		end
	end)
end
return t