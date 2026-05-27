-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnalyticsService", "Server")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("TimeSeedClass")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("LevelUtils")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("WeightedProbability")
local v9 = Sonar("StorageUtils")
local v10 = Sonar("Constants")
local v11 = game:GetService("RunService"):IsStudio() or Sonar("Constants").IsTestGame
local v12 = 1
local v13 = v3.new({
	Duration = 2592000,
	Start = 1624742400
})
local t2 = {}
t2.Duration = if v11 then 300 else 86400
local v16 = v3.new(t2)
local sum = 0
for k, v in pairs(Sonar(v9.Get("UpgradeStats"))) do
	sum = sum + v.MaxLevel
end
t.RefreshTimer = v13
t.SpeciesTimer = v16
function t.CanTurnin(p1, p2) --[[ CanTurnin | Line: 40 | Upvalues: v2 (copy) ]]
	local v1 = p1.PlayerData.Animals:FindFirstChild(p2.Name)
	if not v1 then
		return false, "NotMet"
	end
	local _, v22 = v2.GetTotalTraits(v1)
	if not (v22.Patterns and (v22.Paints and v22.Cosmetics)) then
		return false, "NotMet"
	end
	if p2.Favorite.Value then
		return false, "Favorited"
	end
	if v22.Paints >= 1 and (v22.Patterns >= 2 and v22.Cosmetics >= 2) then
		return true
	else
		return false, "NotMet"
	end
end
function t.GetTimeTillEnd() --[[ GetTimeTillEnd | Line: 57 | Upvalues: v13 (copy), v12 (copy), v4 (copy) ]]
	return math.max(0, v13.EndTime - v12 - v4.Get())
end
function t.GetSpecies() --[[ GetSpecies | Line: 61 | Upvalues: v16 (copy), v10 (copy) ]]
	return v10.AnySpeciesTable[Random.new(v16.CurrentSeed):NextInteger(1, #v10.AnySpeciesTable)]
end
function t.GetPointsWorth(p1, p2) --[[ GetPointsWorth | Line: 69 | Upvalues: v2 (copy), t (copy), v5 (copy), sum (ref), v10 (copy) ]]
	local v1 = p1.PlayerData.Animals:FindFirstChild(p2.Name)
	if not v1 then
		return 0
	end
	local v22 = 3
	local t2 = {}
	local _, v3 = v2.GetTotalTraits(v1)
	if v3.Patterns and (v3.Paints and v3.Cosmetics) then
		if v3.Paints >= 2 and (v3.Patterns >= 4 and v3.Cosmetics >= 4) then
			t2.BasePoints = 5
			t2.BaseText = "2 Paint, 4 Patterns, 4 Cosmetics"
			v22 = 5
		elseif v3.Paints >= 1 and (v3.Patterns >= 2 and v3.Cosmetics >= 2) then
			t2.BasePoints = 3
			t2.BaseText = "1 Paint, 2 Patterns, 2 Cosmetics"
			v22 = 3
		end
	end
	if v1.Species.Value == t.GetSpecies() then
		t2.Species = 0.5
		v22 = v22 * 1.5
	end
	local v52 = math.floor(v5.GetTotalSkillLevels(p2) / sum * 100)
	local HorseShrine = v10.HorseShrine
	local list = {}
	local v6 = 1
	for k, v in pairs(HorseShrine.LevelBonus) do
		table.insert(list, k)
	end
	table.sort(list)
	for i, v in ipairs(list) do
		if v <= v52 then
			v6 = 1 + HorseShrine.LevelBonus[v]
		end
	end
	t2.SkillLevel = v52
	t2.SkillMultiplier = v6
	return math.floor(v22 * v6 + 0.5), t2
end
local function GiveMilestoneRewards(p1, p2) --[[ GiveMilestoneRewards | Line: 132 | Upvalues: v10 (copy), Sonar (copy), v1 (copy) ]]
	local v12 = v10.HorseShrineMilestones[p2]
	if not v12 then
		return
	end
	local v2 = v12[math.random(1, #v12)]
	if not v2 then
		return
	end
	if v2.Species then
		local v3 = Sonar("ItemSetService"):_giveHorse(p1, v2)
		v1.ReportResourceEvent(p1.Player, "Source", "HorseSlot", v3.Species.Value, "HorseShrine", 1)
		return true, v3.Name
	end
	local Theme = v2.Theme
	if type(Theme) == "table" then
		Theme = Theme[math.random(1, #Theme)]
	end
	p1:GiveItem({
		IgnoreLimit = true,
		Source = "HorseShrine",
		Name = v2.Name,
		Amount = v2.Amount,
		Theme = Theme or nil
	})
	return true
end
function t.CheckMilestones(p1) --[[ CheckMilestones | Line: 169 | Upvalues: v10 (copy), GiveMilestoneRewards (copy) ]]
	local TurninAmount = p1.PlayerData.HorseShrine.TurninAmount.Value
	local LastMilestone = p1.PlayerData.HorseShrine.LastMilestone.Value
	local list = {}
	local v1 = false
	local v2 = nil
	for k in pairs(v10.HorseShrineMilestones) do
		table.insert(list, k)
	end
	table.sort(list)
	for i, v in ipairs(list) do
		if LastMilestone < v and v <= TurninAmount then
			local v3, v4 = GiveMilestoneRewards(p1, v)
			if v3 then
				v1 = true
				v2 = v4
			end
			p1.PlayerData.HorseShrine.LastMilestone.Value = v
		end
	end
	return v1, v2
end
local function CheckTenPointRewards(p1, p2, p3) --[[ CheckTenPointRewards | Line: 203 | Upvalues: v10 (copy), v8 (copy) ]]
	local v2 = math.floor(p2 / v10.HorseShrine.SmallMilestone)
	local v4 = math.floor(p3 / v10.HorseShrine.SmallMilestone)
	local v5 = false
	if v2 < v4 then
		local PointsRewards = v10.HorseShrine.PointsRewards
		if not PointsRewards then
			return false
		end
		for i = v2 + 1, v4 do
			local v6 = PointsRewards[v8.getRandomWeightedItem(PointsRewards)]
			p1:GiveItem({
				IgnoreLimit = true,
				Source = "HorseShrine10Points",
				Name = v6.Name,
				Amount = v6.Amount,
				Theme = v6.Theme or nil
			})
			v5 = true
		end
	end
	return v5
end
function t.Init() --[[ Init | Line: 233 | Upvalues: v6 (copy), v7 (copy), t (copy), CheckTenPointRewards (copy), v1 (copy), v13 (copy) ]]
	if not game:GetService("RunService"):IsServer() then
		return
	end
	v6.GetRemoteFunction("ShrineTurninRemote").OnServerInvoke = function(p1, p2) --[[ Line: 235 | Upvalues: v7 (ref), t (ref), CheckTenPointRewards (ref), v1 (ref) ]]
		local v12 = v7.getWrapperFromPlayer(p1)
		local v2 = v12.PlayerData.Animals:FindFirstChild(p2)
		if not v2 then
			return false
		end
		if not t.CanTurnin(v12, v2) then
			return false
		end
		local v3 = t.GetPointsWorth(v12, v2)
		if v3 then
			v12:IncrementMission({
				Type = "ShrineSubmit",
				Amount = 1
			})
			local TurninAmount = v12.PlayerData.HorseShrine.TurninAmount.Value
			local TurninAmount_2 = v12.PlayerData.HorseShrine.TurninAmount
			TurninAmount_2.Value = TurninAmount_2.Value + v3
			local v4 = CheckTenPointRewards(v12, TurninAmount, TurninAmount + v3)
			local _, v5 = t.CheckMilestones(v12)
			v1.ReportResourceEvent(v12.Player, "Sink", "HorseSlot", v2.Species.Value, "HorseShrineTurnin", 1)
			v2:Destroy()
			return true, v5, v4
		else
			return false
		end
	end
	v7.bindToPlayers(function(p1) --[[ Line: 265 | Upvalues: v7 (ref), v13 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local function setShrineSeed() --[[ setShrineSeed | Line: 269 | Upvalues: v1 (copy), v13 (ref) ]]
			if v1.PlayerData.HorseShrine.LastSeed.Value ~= v13.CurrentSeed then
				v1.PlayerData.HorseShrine.LastSeed.Value = v13.CurrentSeed
				v1.PlayerData.HorseShrine.TurninAmount.Value = 0
				v1.PlayerData.HorseShrine.LastMilestone.Value = 0
			end
		end
		v1.Maid:GiveTask(v13.SeedChanged:Connect(setShrineSeed))
		if v1.PlayerData.HorseShrine.LastSeed.Value ~= v13.CurrentSeed then
			v1.PlayerData.HorseShrine.LastSeed.Value = v13.CurrentSeed
			v1.PlayerData.HorseShrine.TurninAmount.Value = 0
			v1.PlayerData.HorseShrine.LastMilestone.Value = 0
		end
	end, function(p1) --[[ Line: 279 ]] end)
end
t.Init()
return t