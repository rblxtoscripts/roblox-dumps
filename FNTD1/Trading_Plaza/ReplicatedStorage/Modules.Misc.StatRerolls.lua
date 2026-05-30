-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local LocalPlayer = Players.LocalPlayer
local v1 = if LocalPlayer then require(ReplicatedStorage.Modules.PlayerData.ClientState) else require(ServerScriptService.PlayerData.Manager)
local Config = require(script.Config)
local v2 = if game.ReplicatedStorage:FindFirstChild("Configs") and game.ReplicatedStorage.Configs:FindFirstChild("Items") then require(game.ReplicatedStorage.Configs.Items) else nil
local Quests = require(game.ReplicatedStorage.Modules.Misc.Quests)
local t = {
	Config = Config
}
function returnSumOfWeight(p1) --[[ returnSumOfWeight | Line: 16 ]]
	local sum = 0
	for k, v in pairs(p1) do
		sum = sum + v.Chance
	end
	return sum
end
function getRandomItem(p1) --[[ getRandomItem | Line: 24 ]]
	local sum = Random.new():NextNumber(0, returnSumOfWeight(p1))
	for k, v in pairs(p1) do
		if sum <= v.Chance then
			return k
		end
		sum = sum - v.Chance
	end
end
function t.GetLetter() --[[ GetLetter | Line: 36 | Upvalues: Config (copy) ]]
	return getRandomItem(Config)
end
local t2 = {}
function t.Roll(p1, p2, p3, p4) --[[ Roll | Line: 41 | Upvalues: v1 (copy), t2 (copy), ReplicatedStorage (copy), v2 (copy), Config (copy), t (copy), Quests (copy) ]]
	local v12 = v1.Profiles[p1]
	if not v12 then
		return
	end
	if t2[p1.Name] then
		return
	end
	t2[p1.Name] = true
	task.delay(0.5, function() --[[ Line: 49 | Upvalues: t2 (ref), p1 (copy) ]]
		t2[p1.Name] = nil
	end)
	local v22 = v12.Data.Towers[p2]
	if not v22 then
		return
	end
	if v22.Stats then
		local v3 = if v12.Data.Items.StatChips then v12.Data.Items.StatChips else 0
		local count = 0
		if p3 then
			for k, v in pairs(p3) do
				count = count + 1
			end
		end
		if count >= 3 then
			return
		end
		local v4 = count * 1 + 1
		if v3 < v4 then
			ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, (("You don\'t have enough %*!"):format(v2.StatChips.Name)))
			return
		end
		local Stats = v12.Data.Towers[p2].Stats
		for k, v in pairs(Stats) do
			if Config[v].Chance <= 1 and not (p3[k] or p4) then
				return
			end
		end
		local Items = v12.Data.Items
		Items.StatChips = Items.StatChips - v4
		if v12.Data.Items.StatChips <= 0 then
			v12.Data.Items.StatChips = nil
		end
		local v5 = if p3 and (p3.Damage and Stats.Damage) then Stats.Damage else t.GetLetter()
		local v6 = if p3 and (p3.Range and Stats.Range) then Stats.Range else t.GetLetter()
		local v7 = if p3 and (p3.Cooldown and Stats.Cooldown) then Stats.Cooldown else t.GetLetter()
		v12.Data.Towers[p2].Stats = {
			Damage = v5,
			Range = v6,
			Cooldown = v7
		}
		if v5 == "X+" and Stats.Damage ~= "X+" or (v6 == "X+" and Stats.Range ~= "X+" or v7 == "X+" and Stats.Cooldown ~= "X+") then
			Quests.DoTask(p1, "GlitchedStat", 1)
		end
		Quests.DoTask(p1, "StatChip", v4)
		ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
		ReplicatedStorage.Remotes.Misc.StatReroll:FireClient(p1, p2)
	else
		if (if v12.Data.Items.AftonsWrench then v12.Data.Items.AftonsWrench else 0) < 1 then
			ReplicatedStorage.Remotes.Misc.Alert:FireClient(p1, (("You don\'t have enough %*!"):format(v2.AftonsWrench.Name)))
			return
		end
		local Items = v12.Data.Items
		Items.AftonsWrench = Items.AftonsWrench - 1
		if v12.Data.Items.AftonsWrench <= 0 then
			v12.Data.Items.AftonsWrench = nil
		end
		local v9 = t.GetLetter()
		local v10 = t.GetLetter()
		local v11 = t.GetLetter()
		v12.Data.Towers[p2].Stats = {
			Damage = v9,
			Range = v10,
			Cooldown = v11
		}
		if v9 == "X+" or (v10 == "X+" or v11 == "X+") then
			Quests.DoTask(p1, "GlitchedStat", 1)
		end
		ReplicatedStorage.Remotes.PlayerData.UpdateData:FireClient(p1, v12.Data)
		ReplicatedStorage.Remotes.Misc.StatReroll:FireClient(p1, p2, true)
	end
	ReplicatedStorage.Remotes.Towers.TowerUpdated:FireClient(p1, p2)
end
function t.GetLetterStats(p1, p2, p3) --[[ GetLetterStats | Line: 141 | Upvalues: Config (copy) ]]
	local t = {
		Letter = p2,
		Value = Config[p2].Buffs[p1][if p3 then "String" else "Real"],
		Chance = Config[p2].Chance
	}
	if script.Gradients:FindFirstChild(p2) then
		t.Gradient = script.Gradients[p2].Color
	else
		t.Gradient = script.Gradients.Default.Color
	end
	if Config[p2].Image then
		t.Image = Config[p2].Image
	end
	return t
end
function t.GetStatMulti(p1, p2, p3, p4) --[[ GetStatMulti | Line: 158 | Upvalues: LocalPlayer (copy), v1 (copy), Config (copy) ]]
	local v12 = if LocalPlayer then v1.GetData() else v1.Profiles[p1]
	if not v12 then
		return
	end
	if not LocalPlayer then
		v12 = v12.Data
	end
	local v2 = v12.Towers[p2]
	if not v2 then
		return
	end
	local v3, v4, v5
	if v2.Stats then
		local v6 = if Config[v2.Stats.Damage] then Config[v2.Stats.Damage] else Config["B-"]
		local v7 = if Config[v2.Stats.Range] then Config[v2.Stats.Range] else Config["B-"]
		local v8 = if Config[v2.Stats.Cooldown] then Config[v2.Stats.Cooldown] else Config["B-"]
		v3 = v6.Buffs.Damage.Real
		v4 = v7.Buffs.Range.Real
		v5 = v8.Buffs.Cooldown.Real
	else
		v3 = 1
		v4 = 1
		v5 = 1
	end
	local t = {
		Damage = v3,
		Range = v4,
		Cooldown = v5
	}
	local v9
	if p4 and p3 then
		local v10 = v2.Stats[p3]
		local t2 = {
			Letter = v10,
			Value = Config[v10].Buffs[p3].String
		}
		if script.Gradients:FindFirstChild(v10) then
			t2.Gradient = script.Gradients[v10].Color
		else
			t2.Gradient = script.Gradients.Default.Color
		end
		v9 = t2
		if Config[v10].Image then
			t2.Image = Config[v10].Image
			return t2
		end
	else
		if p3 and t[p3] then
			return t[p3]
		end
		v9 = t
	end
	return v9
end
if not LocalPlayer and ReplicatedStorage.Remotes.Misc:FindFirstChild("StatReroll") then
	ReplicatedStorage.Remotes.Misc.StatReroll.OnServerEvent:Connect(function(p1, p2, p3, p4) --[[ Line: 200 | Upvalues: t (copy) ]]
		task.spawn(t.Roll, p1, p2, p3, p4)
	end)
end
return t