-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local Manager = require(game.ServerScriptService.PlayerData.Manager)
local LocalPlayer = game.Players.LocalPlayer
local v1 = if LocalPlayer then nil else DataStoreService:GetDataStore("GlobalQuests.v1")
local t = {
	Global = {
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
	},
	DoTask = function(p1, p2, p3, p4) --[[ DoTask | Line: 24 | Upvalues: Manager (copy) ]]
		if not p3 then
			p3 = 1
		end
		local v1 = Manager.Profiles[p1]
		if not v1 then
			return
		end
		if not v1.Data.Quests.Normal then
			v1.Data.Quests.Normal = {}
		end
		if not v1.Data.Quests.Clans then
			v1.Data.Quests.Clans = {}
		end
		if not v1.Data.Quests.Event then
			v1.Data.Quests.Event = {}
		end
		if not v1.Data.Quests.Weekly then
			v1.Data.Quests.Weekly = {}
		end
		if not v1.Data.Quests.Special then
			v1.Data.Quests.Special = {}
		end
		if not v1.Data.Quests.Infinite then
			v1.Data.Quests.Infinite = {}
		end
		if not v1.Data.Quests.Personal then
			v1.Data.Quests.Personal = {}
		end
		if not v1.Data.Quests.Global then
			v1.Data.Quests.Global = {}
		end
		for k, v in pairs(v1.Data.Quests.Normal) do
			if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
				v.Progress = v.Progress + p3
			end
		end
		for k, v in pairs(v1.Data.Quests.Weekly) do
			if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
				v.Progress = v.Progress + p3
			end
		end
		for k, v in pairs(v1.Data.Quests.Clans) do
			if not v.Claimed and k == p2 then
				v.Progress = v.Progress + p3
			end
		end
		for k, v in pairs(v1.Data.Quests.Event) do
			if not v.Claimed and k == p2 then
				v.Progress = v.Progress + p3
			end
		end
		for k, v in pairs(v1.Data.Quests.Special) do
			if not v.Claimed and k == p2 then
				v.Progress = v.Progress + p3
			end
		end
		for k, v in pairs(v1.Data.Quests.Infinite) do
			if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
				v.Progress = v.Progress + p3
			end
		end
		for k, v in pairs(v1.Data.Quests.Personal) do
			if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
				v.Progress = v.Progress + p3
			end
		end
		for k, v in pairs(v1.Data.Quests.Global) do
			if not v.Claimed and (not p4 or (not v.Special or p4 == v.Special)) and string.gsub(k, "%d+", "") == p2 then
				v.Progress = v.Progress + p3
			end
		end
		task.spawn(doGlobalTask, p2, p3)
	end
}
local t2 = {}
function doGlobalTask(p1, p2) --[[ doGlobalTask | Line: 107 | Upvalues: t (copy), t2 (copy) ]]
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
function flushGlobalTasks() --[[ flushGlobalTasks | Line: 119 | Upvalues: t2 (copy), v1 (copy) ]]
	for k, v in pairs(t2) do
		if v ~= 0 then
			local v12, _ = pcall(function() --[[ Line: 122 | Upvalues: v1 (ref), k (copy), v (copy) ]]
				v1:IncrementAsync(k, v)
			end)
			if v12 then
				t2[k] = 0
			end
		end
	end
end
if LocalPlayer then
	return t
end
task.spawn(function() --[[ Line: 134 ]]
	while true do
		flushGlobalTasks()
		task.wait(60)
	end
end)
return t