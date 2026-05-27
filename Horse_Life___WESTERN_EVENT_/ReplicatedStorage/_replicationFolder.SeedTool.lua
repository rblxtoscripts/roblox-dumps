-- https://lua.expert/
local t = {}
t.__index = t
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("NotificationsClient")
local v2 = Sonar("ItemDataService")
local v3 = Sonar("FarmingClient")
local v4 = Sonar("Maid")
local LocalPlayer = game.Players.LocalPlayer
local v5 = Sonar("PlayerWrapper").GetClient()
local v6 = LocalPlayer:GetMouse()
local v7 = Color3.fromRGB(100, 200, 100)
local v8 = Color3.fromRGB(200, 100, 100)
local v9 = Color3.fromRGB(150, 150, 150)
function t.new(p1) --[[ new | Line: 23 | Upvalues: t (copy), v4 (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Tool = p1
	v22.Object = p1.Object
	v22.Maid = v4.new()
	v22.Equipped = false
	v22.NextUse = 0
	v22.RepeatActions = true
	v22.Data = v2.GetByName(v22.Object.Name)
	v22.CurrentHighlightedPlot = nil
	v22.Highlight = nil
	return v22
end
function t._createHighlight(p1) --[[ _createHighlight | Line: 42 ]]
	if not p1.Highlight then
		p1.Highlight = Instance.new("Highlight")
		p1.Highlight.FillTransparency = 0.7
		p1.Highlight.OutlineTransparency = 0
		p1.Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
		p1.Maid:GiveTask(p1.Highlight)
	end
end
function t._updateHighlight(p1) --[[ _updateHighlight | Line: 52 | Upvalues: v3 (copy), v7 (copy), v9 (copy), v8 (copy) ]]
	local v1 = p1:_getPlotFromMouse()
	if v1 == p1.CurrentHighlightedPlot then
		return
	end
	p1.CurrentHighlightedPlot = v1
	if v1 then
		p1:_createHighlight()
		local v2 = v3.GetPlotFromModel(v1)
		local v32 = if v2 then v3.CanPlantOnPlot(v2) else v2
		local v4 = if v2 then not v2.IgnoreUnlocked and not v2.PlotData.Value else v2
		if v32 then
			p1.Highlight.FillColor = v7
			p1.Highlight.OutlineColor = v7
		elseif v4 then
			p1.Highlight.FillColor = v9
			p1.Highlight.OutlineColor = v9
		else
			p1.Highlight.FillColor = v8
			p1.Highlight.OutlineColor = v8
		end
		local Base = v1:FindFirstChild("Base")
		p1.Highlight.Adornee = Base or v1
		p1.Highlight.Parent = v1
	else
		if not p1.Highlight then
			return
		end
		p1.Highlight.Adornee = nil
		p1.Highlight.Parent = nil
	end
end
function t._getPlotFromMouse(p1) --[[ _getPlotFromMouse | Line: 86 | Upvalues: v6 (copy), CollectionService (copy) ]]
	local Target = v6.Target
	if not Target then
		return nil
	end
	local v1 = Target.Parent
	if v1 and CollectionService:HasTag(v1, "FarmingPlot") then
		return v1
	end
	if v1 and (v1.Parent and CollectionService:HasTag(v1.Parent, "FarmingPlot")) then
		return v1.Parent
	end
	if Target and CollectionService:HasTag(Target, "FarmingPlot") then
		return Target
	else
		return nil
	end
end
function t._startHighlightLoop(p1) --[[ _startHighlightLoop | Line: 106 | Upvalues: RunService (copy) ]]
	p1.Maid.HighlightLoop = RunService.RenderStepped:Connect(function() --[[ Line: 107 | Upvalues: p1 (copy) ]]
		p1:_updateHighlight()
	end)
end
function t._stopHighlightLoop(p1) --[[ _stopHighlightLoop | Line: 112 ]]
	p1.Maid.HighlightLoop = nil
	p1.CurrentHighlightedPlot = nil
	if not p1.Highlight then
		return
	end
	p1.Highlight.Adornee = nil
	p1.Highlight.Parent = nil
end
function t.Equip(p1) --[[ Equip | Line: 122 ]]
	p1.Equipped = true
	p1:_startHighlightLoop()
end
function t.Unequip(p1) --[[ Unequip | Line: 127 ]]
	p1.Equipped = false
	p1:_stopHighlightLoop()
end
function t._getSeedValue(p1) --[[ _getSeedValue | Line: 132 | Upvalues: v5 (copy) ]]
	local v1 = v5:GetItemFolder("Seeds")
	local v2 = p1.Object.Name
	for v3, v4 in v1:GetChildren() do
		if v4.Value == v2 then
			return v4
		end
	end
	return nil
end
function t._getPlotFromRaycast(p1) --[[ _getPlotFromRaycast | Line: 145 ]]
	return p1:_getPlotFromMouse()
end
function t.OnInput(p1, p2) --[[ OnInput | Line: 149 | Upvalues: v5 (copy), v1 (copy), v3 (copy) ]]
	if not p1.Equipped then
		return
	end
	if p2 and not (if p2.UserInputType == Enum.UserInputType.MouseButton1 or (p2.UserInputType == Enum.UserInputType.Touch or p2.KeyCode == Enum.KeyCode.ButtonX) then true else p2.KeyCode == Enum.KeyCode.ButtonA) then
		return
	end
	if tick() < p1.NextUse then
		return
	end
	if v5:IsInAction("Race") then
		return
	end
	local v2 = v5:GetCurrentAnimal()
	if v2 and v2.Flying then
		v1.Notify({
			Message = "You can\'t plant while flying!",
			Type = "Red"
		})
		return
	end
	local v32 = p1:_getSeedValue()
	if not v32 then
		v1.Notify({
			Message = "You don\'t have any of this seed!",
			Type = "Red"
		})
		return
	end
	local v4 = p1:_getPlotFromRaycast()
	if not v4 then
		v1.Notify({
			Message = "Click on a farming plot to plant!",
			Type = "SeedNoTarget"
		})
		return
	end
	local v52 = v3.GetPlotFromModel(v4)
	if not v52 then
		v1.Notify({
			Message = "Click on a farming plot to plant!",
			Type = "SeedNoTarget"
		})
		return
	end
	if v3.CanPlantOnPlot(v52) then
		p1.NextUse = tick() + 0.4
		v3.PlantSeedOnPlot(v52, v32)
		return
	end
	if v52.Seed.Value then
		v1.Notify({
			Message = "This plot already has something growing!",
			Type = "Red"
		})
	else
		v3.PromptUnlock(v52)
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 225 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t