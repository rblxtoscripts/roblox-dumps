-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("TimeSeedClass")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("WeightedProbability")
local v6 = Sonar("ActivityUpgradesService")
local v7 = Sonar("PlaceTypeService")
local v8 = Sonar("Constants")
local TreasureChestRewards = v8.TreasureChestRewards
local ShovelNodeRewards = v8.ShovelNodeRewards
local t2 = { "ExplorationChests", "Digging" }
local t3 = {
	Start = v8.TimeSyncStart
}
t3.Duration = if v7.IsTestGame() or game:GetService("RunService"):IsStudio() then 1200 else 72000
local v11 = v2.new(t3)
function t.Init(p1) --[[ Init | Line: 33 | Upvalues: v1 (copy), v3 (copy), v11 (copy), t2 (copy), v4 (copy), v6 (copy), TreasureChestRewards (copy), v5 (copy), ShovelNodeRewards (copy) ]]
	if not v1 then
		return
	end
	v3.bindToPlayers(function(p1) --[[ Line: 35 | Upvalues: v3 (ref), v11 (ref), t2 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if v1 then
			local function resetChests() --[[ resetChests | Line: 39 | Upvalues: v1 (copy), v11 (ref), t2 (ref) ]]
				for v12, v2 in v1.PlayerData.TreasureChests:GetChildren() do
					local v3 = v11.CurrentSeed + v1.Player.UserId + table.find(t2, v2.Name) * 1000
					if v2.Value == v3 then
						return
					end
					v2.Value = v3
					for k, v in pairs(v2:GetChildren()) do
						v.Value = false
					end
				end
				for v4, v5 in v1.PlayerData.Clues:GetChildren() do
					v5.Value = false
				end
			end
			v1.Maid:GiveTask(v11.SeedChanged:Connect(resetChests))
			resetChests()
		end
	end)
	v4.GetRemoteFunction("OpenTreasureChestRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 58 | Upvalues: v3 (ref), v6 (ref), TreasureChestRewards (ref), v5 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1.PlayerData.TreasureChests.ExplorationChests:FindFirstChild((tostring(p2)))
		if not v2 then
			return
		end
		if v2.Value then
			return
		end
		v2.Value = true
		v1:IncrementMission({
			Type = "FindChest",
			Amount = 1,
			Data = { "ExplorationChests" }
		})
		local v4 = TreasureChestRewards.ExplorationChests.TotalRewards + v6.GetBoostForType(v1, "DailyChests", "ItemsAdded")
		v1:GiveItem({
			Name = "Coins",
			Source = "TreasureChest",
			IgnoreLimit = true,
			Amount = math.floor(TreasureChestRewards.ExplorationChests.Coins * (1 + v6.GetBoostForType(v1, "DailyChests", "RewardAdded")))
		})
		for i = 1, v4 do
			local v7 = TreasureChestRewards.ExplorationChests.Rewards[v5.getRandomWeightedItem(TreasureChestRewards.ExplorationChests.Rewards)]
			v1:GiveItem({
				Source = "TreasureChest",
				IgnoreLimit = true,
				Name = v7.Name,
				Amount = v7.Amount,
				Theme = v7.Theme or "Random"
			})
		end
		return true
	end
	v4.GetRemoteFunction("OpenDiggingRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 111 | Upvalues: v3 (ref), ShovelNodeRewards (ref), v5 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1.PlayerData.TreasureChests.Digging:FindFirstChild((tostring(p2)))
		if not v2 then
			return
		end
		if not v2.Value then
			v2.Value = true
			local v32 = ShovelNodeRewards[v5.getRandomWeightedItem(ShovelNodeRewards)]
			v1:IncrementMission({
				Type = "FindShovels",
				Amount = 1
			})
			v1:GiveOrDropItem({
				TotalDrops = 1,
				ApplyModifiers = true,
				Source = "TreasureChest",
				IgnoreLimit = true,
				Name = v32.Reward,
				Amount = v32.Amount,
				Position = workspace.Interactions.ShovelSpawnNodes[tostring(p3)].Main.Position,
				Theme = v32.Theme or "Random"
			})
		end
	end
end
t:Init()
return t