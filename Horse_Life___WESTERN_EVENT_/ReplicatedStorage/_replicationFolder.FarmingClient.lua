-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("TimeUtils")
local v3 = Sonar("Maid")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("EventUtils")
local v6 = Sonar("MathUtils")
local v7 = Sonar("spr")
local v8 = Sonar("PromptClient")
local v9 = Sonar("ColorCorrectionUtils")
local v10 = Sonar("IssueResponseClient")
local v11 = Sonar("Binder")
local v12 = Sonar("MarketplaceUtils")
local v13 = Sonar("Octree")
local v14 = Sonar("ParticleUtils")
local v15 = Sonar("FormatString")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v16 = Sonar("PlayerWrapper").GetClient()
local v17 = Sonar("Constants")
local SFX = game.ReplicatedStorage.Storage.SFX
local t2 = {
	[true] = {
		Image = "rbxassetid://16661322264",
		Color = Color3.fromRGB(255, 190, 200)
	},
	[false] = {
		Image = "rbxassetid://16651378674",
		Color = Color3.fromRGB(142, 122, 143)
	}
}
local v18 = v13.new("FarmingPlots", 4, 512)
local v19 = true
local t3 = {}
function t.new(p1, p2, p3) --[[ new | Line: 50 | Upvalues: v16 (copy), t (copy), v3 (copy), v17 (copy), v18 (copy), t3 (copy), t2 (copy), ReplicatedStorage (copy), v5 (copy), v6 (copy), v7 (copy), v15 (copy), v2 (copy), v19 (ref), v4 (copy), v8 (copy), v12 (copy), v1 (copy), v9 (copy), v10 (copy), LocalPlayer (copy), SFX (copy), v14 (copy) ]]
	local v13 = v16.PlayerData.FarmingPlots:FindFirstChild(p1.Name) or p2
	if not v13 then
		return nil
	end
	local v32 = setmetatable({}, t)
	v32.Maid = v3.new()
	v32.Model = p1
	v32.PlotData = v13
	v32.PlotInfo = v17.FarmingPlots[tonumber(p1.Name)]
	v32.IgnoreUnlocked = p3
	v32.Seed = Instance.new("BoolValue")
	v32.Maid:GiveTask(v32.Seed)
	v18:Add(p1, p1:GetPivot().p)
	t3[p1] = v32
	v32.Maid:GiveTask(function() --[[ Line: 72 | Upvalues: t3 (ref), p1 (copy), v32 (copy), v18 (ref) ]]
		t3[p1] = nil
		if v32.IgnoreUnlocked then
			return
		end
		v18:Remove(p1, p1.Position)
	end)
	v32.SeedType = nil
	if v32.PlotData.Seed.Value == "" then
		v32.Seed.Value = false
	else
		v32.Seed.Value = true
		v32.SeedType = v32.PlotData.Seed.Value
	end
	local function _getTimeRemaining() --[[ _getTimeRemaining | Line: 88 | Upvalues: v32 (copy) ]]
		local TimePlanted = v32.PlotData:FindFirstChild("TimePlanted")
		if TimePlanted and TimePlanted.Value ~= 0 then
			return math.max(0, TimePlanted.Value + v32.PlotData.GrowTime.Value - workspace:GetServerTimeNow())
		end
		if v32.PlotData.Seed and #v32.PlotData.Seed.Value > 0 then
			return 0
		else
			return (1 / 0)
		end
	end
	local function _setUnlockedAppearance() --[[ _setUnlockedAppearance | Line: 102 | Upvalues: p3 (copy), v32 (copy), t2 (ref) ]]
		local Base = v32.Model:FindFirstChild("Base")
		if not Base then
			return
		end
		Base.Color = t2[(p3 or v32.PlotData.Value) == true].Color
	end
	local v62 = if (if p3 then p3 else v32.PlotData.Value) == true then true else false
	local Base = v32.Model:FindFirstChild("Base")
	if Base then
		Base.Color = t2[v62].Color
	end
	if not p3 then
		v32.Maid:GiveTask(v32.PlotData:GetPropertyChangedSignal("Value"):Connect(_setUnlockedAppearance))
	end
	local function _setPlant() --[[ _setPlant | Line: 116 | Upvalues: v32 (copy), ReplicatedStorage (ref), v5 (ref), _getTimeRemaining (copy), v6 (ref), v7 (ref), v15 (ref), v2 (ref) ]]
		if v32.Seed.Value then
			if v32.Model:WaitForChild("Base", 5) then
				v32.PlantModel = ReplicatedStorage.Storage.Assets.Plants:FindFirstChild(v32.SeedType):Clone()
				v32.Maid:GiveTask(v32.PlantModel)
				v32.Maid:GiveTask(v5.spawnLoop(function() --[[ Line: 125 | Upvalues: v32 (ref) ]]
					if not (v32.PlantModel and v32.Model:FindFirstChild("Base")) then
						return
					end
					v32.PlantModel:PivotTo(v32.Model.Base.CFrame)
				end, 0))
				v32.PlantModel:PivotTo(v32.Model:FindFirstChild("Base").CFrame)
				v32.PlantModel.Parent = workspace
				local v1 = _getTimeRemaining()
				local v22 = v6.map(v1, v32.PlotData.GrowTime.Value, 0, 0.1, 2)
				local PlantModel = v32.PlantModel
				local t = {
					Scale = v22
				}
				local v3 = v32.PlantModel:GetPivot()
				t.Pivot = v3 * CFrame.Angles(0, math.rad((math.random(2, 20))), 0)
				v7.target(PlantModel, 0.3, 1, t)
				v32.FarmingDisplay = ReplicatedStorage.Storage.Assets.FarmingDisplay:Clone()
				v32.FarmingDisplay.Frame.Title.Text = v15.separateWordsInString(v32.SeedType)
				v32.FarmingDisplay.Adornee = v32.Model
				v32.FarmingDisplay.Parent = v32.Model
				v32.Maid:GiveTask(v32.FarmingDisplay)
				v32.Maid:GiveTask(v5.spawnLoop(function() --[[ Line: 148 | Upvalues: v32 (ref), _getTimeRemaining (ref), v2 (ref) ]]
					if not v32.FarmingDisplay then
						return
					end
					local v1 = _getTimeRemaining()
					if v1 <= 0 then
						v32.FarmingDisplay.Frame.FullLabel.Text = "Ready to harvest"
					else
						v32.FarmingDisplay.Frame.FullLabel.Text = v2.FormatString(v1)
					end
				end, 1))
			end
		else
			if v32.PlantModel then
				local PlantModel = v32.PlantModel
				local t = {
					Scale = 0.1
				}
				local v52 = v32.PlantModel:GetPivot()
				local Angles = CFrame.Angles
				t.Pivot = v52 * Angles(0, math.rad((math.random(120, 360))), 0)
				v7.target(PlantModel, 0.8, 1, t)
				v32.Maid:GiveTask(task.delay(1, function() --[[ Line: 166 | Upvalues: v32 (ref) ]]
					if not v32.PlantModel then
						return
					end
					v32.PlantModel:Destroy()
					v32.PlantModel = nil
				end))
			end
			if not v32.FarmingDisplay then
				return
			end
			v32.FarmingDisplay:Destroy()
			v32.FarmingDisplay = nil
		end
	end
	v32.Seed:GetPropertyChangedSignal("Value"):Connect(_setPlant)
	_setPlant()
	v32.Maid:GiveTask(v5.spawnLoop(function() --[[ Line: 184 | Upvalues: v32 (copy), _getTimeRemaining (copy), v19 (ref), v6 (ref), v7 (ref) ]]
		if not (v32.Seed.Value and v32.PlantModel) then
			return
		end
		local v1 = _getTimeRemaining()
		if not (v1 > 0 and v19) then
			return
		end
		local t = {
			Scale = v6.map(v1, v32.PlotData.GrowTime.Value, 0, 0.1, 2)
		}
		local v3 = v32.PlantModel:GetPivot()
		t.Pivot = v3 * CFrame.Angles(0, math.rad((math.random(2, 20))), 0)
		v7.target(v32.PlantModel, 0.3, 1, t)
	end, 1))
	local v72 = if v32.IgnoreUnlocked then nil else v32.PlotData:GetPropertyChangedSignal("Value")
	v32.Maid:GiveTask(v4.new(v32.Model, {
		ShowHintLabel = true,
		Hint = "Unlock Plot",
		Run = function() --[[ Run | Line: 205 | Upvalues: v16 (ref), p3 (copy), v32 (copy), v8 (ref), v12 (ref), v1 (ref), v9 (ref), v10 (ref), LocalPlayer (ref), t2 (ref) ]]
			if v16:HasUnlockedSpecies("Pony") then
				if not (p3 or v32.PlotData.Value) then
					v8.Prompt({
						Type = "BuyPlot",
						Setup = function(p1) --[[ Setup | Line: 210 | Upvalues: v32 (ref), v12 (ref) ]]
							if v32.PlotInfo.Type == "Coins" then
								p1.Content.CoinPrice.TextLabel.Text = v32.PlotInfo.Cost
								p1.Content.CoinPrice.Visible = true
								p1.Content.RobuxPrice.Visible = false
							else
								p1.Content.CoinPrice.Visible = false
								p1.Content.RobuxPrice.Visible = true
								p1.Content.RobuxPrice.Robux.Text = "\238\128\130" .. v12.GetProductInfo(v32.PlotInfo.ProductId, Enum.InfoType.Product).PriceInRobux
							end
						end,
						Run = function() --[[ Run | Line: 224 | Upvalues: v32 (ref), v1 (ref), v9 (ref), v10 (ref), v12 (ref), LocalPlayer (ref) ]]
							if v32.PlotInfo.Type == "Coins" then
								local v13 = v1.GetRemoteFunction("UnlockFarmingPlot"):InvokeServer(v32.Model.Name)
								if v13 == true then
									v9:Tween()
								else
									v10.NotifyIssue(v13)
								end
							else
								v12.PromptPurchase(LocalPlayer, v32.PlotInfo.ProductId, "Product")
							end
							return true
						end,
						Cancel = function() --[[ Cancel | Line: 240 ]]
							return true
						end
					})
				end
			else
				v8.Prompt({
					Type = "UnlockFarming",
					Setup = function(p1) --[[ Setup | Line: 248 | Upvalues: v16 (ref), t2 (ref) ]]
						local v1 = v16:HasUnlockedSpecies("Pony")
						p1.Content.SpeciesUnlocked.Status.Image = t2[v1].Image
						p1.Content.SpeciesUnlocked.Status.ImageColor3 = t2[v1].Color
					end,
					Run = function() --[[ Run | Line: 255 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 258 ]]
						return true
					end
				})
			end
		end,
		Visibility = function() --[[ Visibility | Line: 264 | Upvalues: p3 (copy), v32 (copy) ]]
			return not p3 and (not v32.Seed.Value and not v32.PlotData.Value)
		end,
		GetRange = function() --[[ GetRange | Line: 267 ]]
			return 15
		end,
		HintChanged = v72
	}))
	v32.Maid:GiveTask(v4.new(v32.Model, {
		ShowHintLabel = true,
		Hint = "Harvest",
		Run = function() --[[ Run | Line: 277 | Upvalues: v32 (copy), v1 (ref), SFX (ref), v14 (ref), v10 (ref) ]]
			local v12 = if v32.IgnoreUnlocked then v1.GetRemoteFunction("ClaimBuildingPlotSeedRemote"):InvokeServer(v32.PlotData) else v1.GetRemoteFunction("ClaimSeedRemote"):InvokeServer(v32.Model.Name)
			if v12 == true then
				v32.Seed.Value = false
				v32.TimeElapsed = 0
				SFX.HarvestedSound:Play()
				v14.CreateParticleAtPosition({
					ParticleName = "CollectParticles",
					Duration = 5,
					Position = v32.Model:GetPivot().Position
				})
			else
				v10.NotifyIssue(v12)
			end
		end,
		Visibility = function() --[[ Visibility | Line: 301 | Upvalues: v32 (copy), _getTimeRemaining (copy) ]]
			if not v32.Seed.Value then
				return false
			end
			return _getTimeRemaining() <= 0
		end,
		GetRange = function() --[[ GetRange | Line: 307 ]]
			return 15
		end
	}))
	return v32
end
function t.Destroy(p1) --[[ Destroy | Line: 315 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.PlantSeed(p1, p2) --[[ PlantSeed | Line: 321 ]] end
function t.IsSeeding() --[[ IsSeeding | Line: 362 ]]
	return nil
end
function t.GetPlotFromModel(p1) --[[ GetPlotFromModel | Line: 366 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.CanPlantOnPlot(p1) --[[ CanPlantOnPlot | Line: 370 ]]
	if not p1 then
		return false
	end
	if not (p1.IgnoreUnlocked or p1.PlotData.Value) then
		return false
	end
	return not p1.Seed.Value
end
function t.PromptUnlock(p1) --[[ PromptUnlock | Line: 386 | Upvalues: v16 (copy), v8 (copy), v12 (copy), v1 (copy), v9 (copy), v10 (copy), LocalPlayer (copy), t2 (copy) ]]
	if not p1 then
		return
	end
	if p1.IgnoreUnlocked then
		return
	end
	if p1.PlotData.Value then
		return
	end
	if v16:HasUnlockedSpecies("Pony") then
		v8.Prompt({
			Type = "BuyPlot",
			Setup = function(p12) --[[ Setup | Line: 400 | Upvalues: p1 (copy), v12 (ref) ]]
				if p1.PlotInfo.Type == "Coins" then
					p12.Content.CoinPrice.TextLabel.Text = p1.PlotInfo.Cost
					p12.Content.CoinPrice.Visible = true
					p12.Content.RobuxPrice.Visible = false
				else
					p12.Content.CoinPrice.Visible = false
					p12.Content.RobuxPrice.Visible = true
					p12.Content.RobuxPrice.Robux.Text = "" .. v12.GetProductInfo(p1.PlotInfo.ProductId, Enum.InfoType.Product).PriceInRobux
				end
			end,
			Run = function() --[[ Run | Line: 413 | Upvalues: p1 (copy), v1 (ref), v9 (ref), v10 (ref), v12 (ref), LocalPlayer (ref) ]]
				if p1.PlotInfo.Type == "Coins" then
					local v13 = v1.GetRemoteFunction("UnlockFarmingPlot"):InvokeServer(p1.Model.Name)
					if v13 == true then
						v9:Tween()
					else
						v10.NotifyIssue(v13)
					end
				else
					v12.PromptPurchase(LocalPlayer, p1.PlotInfo.ProductId, "Product")
				end
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 427 ]]
				return true
			end
		})
	else
		v8.Prompt({
			Type = "UnlockFarming",
			Setup = function(p1) --[[ Setup | Line: 434 | Upvalues: v16 (ref), t2 (ref) ]]
				local v1 = v16:HasUnlockedSpecies("Pony")
				p1.Content.SpeciesUnlocked.Status.Image = t2[v1].Image
				p1.Content.SpeciesUnlocked.Status.ImageColor3 = t2[v1].Color
			end,
			Run = function() --[[ Run | Line: 439 ]]
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 442 ]]
				return true
			end
		})
	end
end
function t.PlantSeedOnPlot(p1, p2) --[[ PlantSeedOnPlot | Line: 449 | Upvalues: v1 (copy), v16 (copy), v14 (copy), SFX (copy) ]]
	if not (p1 and p2) then
		return false
	end
	if (if p1.IgnoreUnlocked then v1.GetRemoteFunction("PlantBuildingPlotSeedRemote"):InvokeServer(p1.PlotData, p2.Name) else v1.GetRemoteFunction("PlantSeedRemote"):InvokeServer(p1.Model.Name, p2.Name)) ~= true then
		return false
	end
	p1.SeedType = p2.Value
	p1.Seed.Value = true
	if not v16.PlayerData.Settings.States.VisualEffects.Value then
		SFX.Dig:Play()
		return true
	end
	v14.CreateParticleAtPosition({
		ParticleName = "DigDirt",
		Duration = 5,
		Position = p1.Model:GetPivot().Position
	})
	SFX.Dig:Play()
	return true
end
function t.Init(p1) --[[ Init | Line: 482 | Upvalues: v11 (copy), t (copy), LocalPlayer (copy), v18 (copy), v19 (ref) ]]
	v11.new("FarmingPlot", t):Init()
	while p1.Player and p1.Player.Parent do
		task.wait(5)
		if LocalPlayer.Character then
			v19 = #v18:RadiusSearch(LocalPlayer.Character.Position, 50) > 0
		end
	end
end
t:Init()
return t