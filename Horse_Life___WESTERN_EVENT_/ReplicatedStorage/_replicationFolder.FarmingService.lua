-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("Maid")
local v5 = Sonar("DataUtils")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("WeightedProbability")
local v8 = Sonar("MarketplaceUtils")
local v9 = v1 and Sonar("AnalyticsService")
local v10 = Sonar("StorageUtils")
local v11 = Sonar("Constants")
local v12 = Sonar(v10.Get("FarmingPlot"))
local t2 = {}
function t.SetupPlayer(p1) --[[ SetupPlayer | Line: 28 | Upvalues: t (copy), v4 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Plots = {}
	v2.Maid = v4.new()
	for v3, v42 in p1.PlayerData.FarmingPlots:GetChildren() do
		if not v42:FindFirstChild("TimePlanted") then
			local TimePlanted = Instance.new("IntValue")
			TimePlanted.Name = "TimePlanted"
			TimePlanted.Value = 0
			TimePlanted.Parent = v42
		end
		if v42:FindFirstChild("TimeRemaining") and v42.Seed.Value ~= "" then
			local TimeRemaining = v42.TimeRemaining.Value
			if TimeRemaining > 0 and TimeRemaining < (1 / 0) then
				v42.TimePlanted.Value = workspace:GetServerTimeNow() - (v42.GrowTime.Value - TimeRemaining)
			end
			v42.TimeRemaining:Destroy()
		elseif v42:FindFirstChild("TimeRemaining") then
			v42.TimeRemaining:Destroy()
		end
		v2.Plots[v42.Name] = {
			Plot = v42,
			Seed = v42.Seed
		}
	end
	v2.Maid:GiveTask(function() --[[ Line: 60 | Upvalues: v2 (copy) ]]
		setmetatable(v2, nil)
	end)
	t2[p1.Player] = v2
	return v2
end
function t.GetTimeRemaining(p1) --[[ GetTimeRemaining | Line: 69 ]]
	if p1.TimePlanted and p1.TimePlanted.Value ~= 0 then
		return math.max(0, p1.TimePlanted.Value + p1.GrowTime.Value - workspace:GetServerTimeNow())
	end
	if p1.Seed and #p1.Seed.Value > 0 then
		return 0
	else
		return (1 / 0)
	end
end
function t.CanPlantSeed(p1, p2, p3) --[[ CanPlantSeed | Line: 84 ]]
	local v1 = p1:GetItemValue(p3, "Seeds")
	if not v1 then
		return
	end
	local v2 = p1.PlayerData.FarmingPlots:FindFirstChild(p2)
	if not v2 then
		return
	end
	if not v2.Value then
		return "PlotLocked"
	end
	if #v2.Seed.Value > 0 then
		return "AlreadyPlanted"
	else
		return true, v1, v2
	end
end
function t.FindPlot(p1, p2) --[[ FindPlot | Line: 102 | Upvalues: t2 (copy) ]]
	for v2, v3 in t2[p1].Plots do
		if v3.Plot.Name == p2 then
			return v3
		end
	end
	return nil
end
function t.GetPlotPosition(p1) --[[ GetPlotPosition | Line: 116 | Upvalues: CollectionService (copy) ]]
	for v1, v2 in CollectionService:GetTagged("FarmingPlot") do
		if v2.Name == p1 then
			local Base = v2:FindFirstChild("Base")
			if Base then
				return Base.Position + Vector3.new(0, 3, 0)
			else
				return v2:GetPivot().Position + Vector3.new(0, 3, 0)
			end
		end
	end
	return nil
end
function t.CanClaimSeed(p1, p2) --[[ CanClaimSeed | Line: 129 | Upvalues: t (copy) ]]
	local v1 = p1.PlayerData.FarmingPlots:FindFirstChild(p2)
	if not v1 then
		return "NoPlot"
	end
	if #v1.Seed.Value <= 0 then
		return "NoSeedPlanted"
	end
	if t.GetTimeRemaining(v1) > 0 then
		return "NotGrown"
	end
	local v2 = p1:GetItemLimit("Inventory")
	if v2.GetLimit() < v2.Get() + v1.Yield.Value then
		return "MaxInventory"
	else
		return true, v1
	end
end
function t.UnlockFarmingPlot(p1, p2) --[[ UnlockFarmingPlot | Line: 156 | Upvalues: v11 (copy), v9 (copy) ]]
	local v1 = p1.PlayerData.FarmingPlots:FindFirstChild(p2)
	if not v1 then
		return "NoPlot"
	end
	if v1.Value then
		return "AlreadyUnlocked"
	end
	local v2 = v11.FarmingPlots[tonumber(p2)]
	if not v2 then
		return "NoPlot"
	end
	if not p1:CanAfford(v2.Cost, "Coins") then
		return "CannotAfford"
	end
	local v3 = p1:GetCurrencyValue("Coins")
	v3.Value = v3.Value - v2.Cost
	if not (v3.Value < 0) then
		v9.ReportResourceEvent(p1.Player, "Sink", "Currency", "Coins", "Plots", v2.Cost)
		v1.Value = true
		return true
	end
	v3.Value = 0
	v9.ReportResourceEvent(p1.Player, "Sink", "Currency", "Coins", "Plots", v2.Cost)
	v1.Value = true
	return true
end
function t.Init(p1) --[[ Init | Line: 191 | Upvalues: v1 (copy), v3 (copy), t (copy), t2 (copy), v2 (copy), v6 (copy), v7 (copy), v5 (copy), v8 (copy), v11 (copy), v12 (copy), v9 (copy) ]]
	if not v1 then
		return
	end
	v3.bindToPlayers(function(p1) --[[ Line: 193 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if v1 then
			t.SetupPlayer(v1)
		end
	end, function(p1) --[[ Line: 198 | Upvalues: t2 (ref) ]]
		if not t2[p1] then
			return
		end
		t2[p1].Maid:DoCleaning()
		t2[p1] = nil
	end)
	v2.GetRemoteFunction("PlantSeedRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 205 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return "NoPlayerWrapper"
		end
		if not workspace:FindFirstChild(p2, true) then
			return "NoPlot"
		end
		local v2, v32, v4 = t.CanPlantSeed(v1, p2, p3)
		if v2 ~= true then
			return v2
		end
		v4.Seed.Value = v32.Value
		for k, v in pairs(v4:GetChildren()) do
			if v32:FindFirstChild(v.Name) then
				v.Value = v32[v.Name].Value
			end
		end
		v4.TimePlanted.Value = workspace:GetServerTimeNow()
		v32:Destroy()
		return true
	end
	v2.GetRemoteFunction("ClaimSeedRemote").OnServerInvoke = function(p1, p2) --[[ Line: 229 | Upvalues: v3 (ref), t (ref), v6 (ref), v7 (ref), v5 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return "NoWrapper"
		end
		local v2, v32 = t.CanClaimSeed(v1, p2)
		if v2 ~= true then
			return v2
		end
		local v4 = v6.GetByName(v32.Seed.Value)
		v32.Seed.Value = ""
		v32.TimePlanted.Value = 0
		local v52 = t.GetPlotPosition(p2)
		local v62 = v32.Luck.Value / 100
		local t2 = {}
		for v72, v8 in v4.DropTable do
			local _ = if v8.P < 50 then v8.P * (1 + v62) else v8.P * (1 - v62)
			t2[v72] = v8
		end
		for i = 1, v32.Yield.Value do
			local v9 = t2[v7.getRandomWeightedItem(t2)]
			if v9 then
				v1:GiveOrDropItem({
					TotalDrops = 1,
					IgnoreLimit = true,
					Name = v9.Name,
					Amount = v9.Amount,
					Position = v52,
					Theme = v9.Theme,
					ThemeChance = v9.ThemeChance,
					Source = "Farming" .. v4.Name
				})
			end
		end
		v1:IncrementMission({
			Type = "HarvestPlant",
			Amount = 1,
			Data = {}
		})
		if math.random(1, 100) < v32.Luck.Value / 1.8 then
			local v10 = v5.CreateIndexedDataValue(v1:GetItemFolder("Seeds"), {
				DataValueName = "Seeds",
				Value = v4.Name
			})
			for k, v in pairs(v32:GetChildren()) do
				local v11 = v10:FindFirstChild(v.Name)
				if v11 then
					v11.Value = v.Value
				end
			end
			v10.Parent = v1:GetItemFolder("Seeds")
		end
		for k, v in pairs(v32:GetChildren()) do
			if v:IsA("IntValue") then
				v.Value = 0
				continue
			end
			if v:IsA("StringValue") then
				v.Value = ""
			end
		end
		return true
	end
	v2.GetRemoteFunction("UnlockFarmingPlot").OnServerInvoke = function(p1, p2) --[[ Line: 316 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if v1 then
			return t.UnlockFarmingPlot(v1, p2)
		else
			return "NoWrapper"
		end
	end
	v8.AddProductHandler("FarmingPlot", function(p1, p2) --[[ Line: 325 | Upvalues: v11 (ref) ]]
		local t = {}
		for v1, v2 in v11.FarmingPlots do
			if v2.Type == "Robux" and v2.ProductId == p2.ProductId then
				table.insert(t, v1)
			end
		end
		for v3, v4 in t do
			local v5 = p1.PlayerData.FarmingPlots:FindFirstChild(v4)
			if v5 then
				v5.Value = true
			end
		end
		return {
			ItemType = p2.Currency,
			ItemId = p2.Amount
		}
	end)
	v2.GetRemoteFunction("PlantBuildingPlotSeedRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 345 | Upvalues: v3 (ref), v12 (ref), v9 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return "NoPlayerWrapper"
		end
		local v2 = v1:GetItemValue(p3, "Seeds")
		if not v2 then
			return "NoSeed"
		end
		local InteractionData = v12.GetByData(p1, p2.Name).InteractionData
		if #InteractionData.Seed.Value > 0 then
			return "AlreadyPlanted"
		end
		InteractionData.Seed.Value = v2.Value
		for k, v in pairs(InteractionData:GetChildren()) do
			if v2:FindFirstChild(v.Name) then
				v.Value = v2[v.Name].Value
			end
		end
		InteractionData.TimePlanted.Value = workspace:GetServerTimeNow()
		v9.ReportResourceEvent(v1.Player, "Sink", "Seeds", v2.Value, "Planting", 1)
		v2:Destroy()
		return true
	end
	v2.GetRemoteFunction("ClaimBuildingPlotSeedRemote").OnServerInvoke = function(p1, p2) --[[ Line: 372 | Upvalues: v3 (ref), v12 (ref), t (ref), v6 (ref), v7 (ref), v5 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return "NoWrapper"
		end
		if #p2.Seed.Value <= 0 then
			return "NoSeedPlanted"
		end
		local v2 = v12.GetByData(p1, p2.Name)
		if t.GetTimeRemaining(v2.InteractionData) > 0 then
			return "NotGrown"
		end
		local v32 = v1:GetItemLimit("Inventory")
		if v32.GetLimit() < v32.Get() + v2.InteractionData.Yield.Value then
			return "MaxInventory"
		end
		local v4 = v6.GetByName(v2.InteractionData.Seed.Value)
		v2.InteractionData.Seed.Value = ""
		v2.InteractionData.TimePlanted.Value = 0
		local v52, v62
		if v2.Model then
			v52 = v2.Model:GetPivot().Position + Vector3.new(0, 3, 0)
			v62 = v2
			if not v52 then
				v52 = nil
			end
		else
			v62 = v2
			v52 = nil
		end
		local v72 = v62.InteractionData.Luck.Value / 100
		local t2 = {}
		for v8, v9 in v4.DropTable do
			local _ = if v9.P < 50 then v9.P * (1 + v72) else v9.P * (1 - v72)
			t2[v8] = v9
		end
		for i = 1, v62.InteractionData.Yield.Value do
			local v10 = t2[v7.getRandomWeightedItem(t2)]
			if v10 then
				v1[if i % 4 == 0 then "GiveOrDropItem" else "GiveItem"](v1, {
					TotalDrops = 1,
					IgnoreLimit = true,
					Name = v10.Name,
					Amount = v10.Amount,
					Position = v52,
					Theme = v10.Theme,
					ThemeChance = v10.ThemeChance,
					Source = "Farming" .. v4.Name
				})
			end
		end
		v1:IncrementMission({
			Type = "HarvestPlant",
			Amount = 1,
			Data = {}
		})
		if math.random(1, 100) < v62.InteractionData.Luck.Value / 1.8 then
			local v122 = v5.CreateIndexedDataValue(v1:GetItemFolder("Seeds"), {
				DataValueName = "Seeds",
				Value = v4.Name
			})
			for k, v in pairs(v62.InteractionData:GetChildren()) do
				local v13 = v122:FindFirstChild(v.Name)
				if v13 then
					v13.Value = v.Value
				end
			end
			v122.Parent = v1:GetItemFolder("Seeds")
		end
		for k, v in pairs(v62.InteractionData:GetChildren()) do
			if v:IsA("IntValue") then
				v.Value = 0
				continue
			end
			if v:IsA("StringValue") then
				v.Value = ""
			end
		end
		return true
	end
end
t:Init()
return t