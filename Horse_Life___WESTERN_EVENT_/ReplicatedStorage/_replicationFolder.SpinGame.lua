-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("InputTypeDetector")
local v3 = Sonar("Button")
local v4 = Sonar("spr")
local v5 = Sonar("MathUtils")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("HotbarService")
local v8 = Sonar("NotificationsClient")
local v9 = Sonar("Constants")
local t = {}
local t2 = {
	Main = "rbxassetid://16289464916",
	Assist = "rbxassetid://17069995476"
}
local t3 = {}
for k, v in pairs(v6.GetRarities()) do
	t[v.Index] = k
end
local LocalPlayer = game.Players.LocalPlayer
local v10 = LocalPlayer and Sonar("PlayerWrapper").GetClient()
function t3.new(p1, p2, ...) --[[ new | Line: 32 | Upvalues: t3 (copy) ]]
	local v1 = setmetatable({}, {
		__index = t3
	})
	v1:_init(p1, p2, ...)
	return v1
end
function t3._init(p1, p2, p3, p4, p5, p6) --[[ _init | Line: 39 | Upvalues: v1 (copy), v6 (copy), LocalPlayer (copy), UserInputService (copy), v3 (copy), v2 (copy), v10 (copy), RunService (copy) ]]
	local Model = p3.Model
	p1.Maid = v1.new()
	p1.gui = p2
	p1.adornee = Model
	p1.needleStartAngle = 90
	p1.smallSegmentChance = p3.Data.TamingSmallRegionChance
	p1.reverseNeedleChance = p3.Data.TamingNeedleReverseChance
	p1.needleSpeedOnLastHeart = p3.Data.TamingNeedleLastHeartSpeed
	p1.preferredFoodRarityData = v6.GetRarity(p3.Data.PreferredFoodRarity)
	p1.startNeedleSpeed = type(p3.Data.TamingNeedleSpeed) == "number" and p3.Data.TamingNeedleSpeed or math.random(p3.Data.TamingNeedleSpeed.Min, p3.Data.TamingNeedleSpeed.Max)
	p1:setNeedleSpeed()
	p1.needleT0 = time()
	p1.cachedTamingHealth = p1.adornee:GetAttribute("TamingHealth")
	p1:randomizeGoalAngle()
	p1.OnSuccess = p4
	p1.OnFail = p5
	p1.CanTame = p6
	p2.Enabled = true
	p2.Adornee = Model
	p2.Parent = LocalPlayer.PlayerGui.WorkspaceGui
	p1.Maid:GiveTask(p2)
	p1.Maid:GiveTask(UserInputService.InputBegan:Connect(function(p12, p2) --[[ Line: 71 | Upvalues: p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.KeyCode ~= Enum.KeyCode.ButtonR2 then
			return
		end
		if not p2 then
			p1:Input()
		end
	end))
	p1.Maid:GiveTask(UserInputService.InputBegan:Connect(function(p12, p2) --[[ Line: 83 | Upvalues: p1 (copy) ]]
		if p12.KeyCode ~= Enum.KeyCode.F and p12.KeyCode ~= Enum.KeyCode.ButtonL2 then
			return
		end
		if not p2 then
			p1:tryEquipBestFood()
		end
	end))
	p1.Maid:GiveTask(v3.new(p1.gui.InnerFrame.ContainerFrame.CircleFrame.ControlsFrame.BestFood.MobileBind, {
		Active = true,
		HoverUpLabel = p1.gui.InnerFrame.ContainerFrame.CircleFrame.ControlsFrame.BestFood.MobileBind.ImageLabel,
		Click = function() --[[ Click | Line: 98 | Upvalues: p1 (copy) ]]
			p1:tryEquipBestFood()
		end
	}))
	p1.Maid:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 103 | Upvalues: p1 (copy) ]]
		if not p2 then
			p1:Input()
		end
	end))
	p1.Maid:GiveTask(v2.InputTypeChanged:Connect(function() --[[ Line: 111 | Upvalues: p1 (copy) ]]
		p1:updateInputType()
	end))
	p1:updateInputType()
	p1.Maid:GiveTask(v3.new(p1.gui.InnerFrame.ContainerFrame, {
		Active = true,
		Click = function() --[[ Click | Line: 119 | Upvalues: p1 (copy) ]]
			p1:Input()
		end
	}))
	p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.NotRarity.RarityLabel.Text = string.format("This species likes\n<font color=\"%s\">%s</font>\nquality food!", p1.preferredFoodRarityData.RichTextColor, p1.preferredFoodRarityData.Name)
	p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.IsRarity.RarityLabel.Text = p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.NotRarity.RarityLabel.Text
	p1.Maid:GiveTask(v10.EquippedToolChangedSignal:Connect(function() --[[ Line: 127 | Upvalues: p1 (copy) ]]
		p1:setPreferredFood()
	end))
	p1:setPreferredFood()
	p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.Visible = true
	p1.Maid:GiveTask(v3.new(p1.gui.InnerFrame.ContainerFrame.CircleFrame.ControlLabel["3"].InteractButton, {
		Active = true,
		HoverUpLabel = p1.gui.InnerFrame.ContainerFrame.CircleFrame.ControlLabel["3"].InteractButton.ImageLabel,
		Click = function() --[[ Click | Line: 137 | Upvalues: p1 (copy) ]]
			p1:Input()
		end
	}))
	p1.Maid:GiveTask(RunService.RenderStepped:Connect(function(p12) --[[ Line: 142 | Upvalues: p1 (copy), p2 (copy), LocalPlayer (ref), Model (copy) ]]
		p2.InnerFrame.ContainerFrame.CircleFrame.LineFrame.Rotation = p1:getNeedleAngle()
		if not ((LocalPlayer.Character.PrimaryPart.Position - Model.Position).Magnitude > 20) then
			return
		end
		p1:Destroy()
	end))
	p1.Maid:GiveTask(Model:GetAttributeChangedSignal("TamingId"):Connect(function() --[[ Line: 153 | Upvalues: Model (copy), p1 (copy) ]]
		if Model:GetAttribute("TamingId") then
			p1:setHeartImage()
		else
			p1:Destroy()
		end
	end))
	p1:setHeartImage()
	p1.Maid:GiveTask(Model:GetAttributeChangedSignal("Fleeing"):Connect(function() --[[ Line: 162 | Upvalues: Model (copy), p1 (copy) ]]
		if not Model:GetAttribute("Fleeing") then
			return
		end
		p1:Destroy()
	end))
	p1.Maid:GiveTask(Model:GetAttributeChangedSignal("TamingHealth"):Connect(function() --[[ Line: 168 | Upvalues: p1 (copy) ]]
		p1:setNeedleSpeed(true)
	end))
	p1.Maid:GiveTask(LocalPlayer.CharacterRemoving:Connect(function() --[[ Line: 172 | Upvalues: p1 (copy) ]]
		p1:Destroy()
	end))
	v10:SetActionState("FeedTaming", true)
	p3.Maid.spinGame = p1
	p1.Maid:GiveTask(function() --[[ Line: 179 | Upvalues: p3 (copy), p1 (copy) ]]
		if p3.Maid.spinGame ~= p1 then
			return
		end
		p3.Maid.spinGame = nil
	end)
end
function t3.setHeartImage(p1) --[[ setHeartImage | Line: 186 | Upvalues: LocalPlayer (copy), t2 (copy) ]]
	local v1 = if p1.adornee:GetAttribute("TamingId") == LocalPlayer.UserId then true elseif p1.adornee:GetAttribute("TamingId") == nil then true else false
	p1.gui.InnerFrame.ResultFrame.CorrectLabel.Image = v1 and t2.Main or t2.Assist
	for k, v in pairs(p1.gui.InnerFrame.ContainerFrame.CircleFrame.Segments:GetChildren()) do
		v.ImageColor3 = v1 and Color3.fromRGB(251, 90, 108) or Color3.fromRGB(155, 254, 255)
	end
end
function t3.isPreferredFood(p1) --[[ isPreferredFood | Line: 196 | Upvalues: v10 (copy) ]]
	local EquippedTool = v10.EquippedTool
	if not EquippedTool or EquippedTool.ToolData.ItemType ~= "Food" then
		return
	end
	return EquippedTool.ToolData.Rarity.Index >= p1.preferredFoodRarityData.Index
end
function t3._getPointsForFood(p1) --[[ _getPointsForFood | Line: 205 | Upvalues: v10 (copy) ]]
	return math.max(1 + (v10.EquippedTool.ToolData.Rarity.Index - p1.preferredFoodRarityData.Index), 1) + (v10.EquippedTool.ToolData.Points or 0)
end
function t3._getDifficultyMultplier(p1) --[[ _getDifficultyMultplier | Line: 209 | Upvalues: v10 (copy) ]]
	local v1 = v10.EquippedTool and v10.EquippedTool.ToolData.Rarity.Index or p1.preferredFoodRarityData.Index
	if p1.preferredFoodRarityData.Index <= v1 then
		return v1 - p1.preferredFoodRarityData.Index, true
	else
		return p1.preferredFoodRarityData.Index - v1
	end
end
function t3.setPreferredFood(p1) --[[ setPreferredFood | Line: 220 | Upvalues: v10 (copy) ]]
	if p1:isPreferredFood() then
		p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.IsRarity.Visible = true
		p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.NotRarity.Visible = false
		p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.HeartAmount.AmountLabel.Text = "x" .. p1:_getPointsForFood()
	else
		p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.IsRarity.Visible = false
		p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.NotRarity.Visible = true
		p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.HeartAmount.AmountLabel.Text = "x1"
	end
	p1.gui.InnerFrame.ContainerFrame.CircleFrame.RarityFrame.HeartAmount.Visible = v10.EquippedTool
	p1:setNeedleSpeed(true)
end
function t3.Input(p1) --[[ Input | Line: 237 ]]
	if not p1.CanInput then
		return
	end
	if p1.ShowingResult then
		return
	end
	if not p1.CanTame() then
		return
	end
	if p1:checkSuccess() then
		p1.OnSuccess()
		p1:showResult(true)
	else
		p1.OnFail()
		p1:showResult(false)
	end
	p1:newRound()
end
function t3.Destroy(p1) --[[ Destroy | Line: 255 | Upvalues: v10 (copy) ]]
	v10:SetActionState("FeedTaming", false)
	p1.Maid:Destroy()
end
function t3.getNeedleAngle(p1) --[[ getNeedleAngle | Line: 262 ]]
	return (p1.needleStartAngle + p1.needleSpeed * (if p1.reversed then -1 else 1) * (time() - p1.needleT0)) % 360
end
function t3.checkSuccess(p1) --[[ checkSuccess | Line: 270 ]]
	local v3 = math.abs(p1.goalAngle - p1:getNeedleAngle())
	if (if p1.ActiveSegmentSize == "Small" then 60 else 140) < v3 then
		v3 = math.abs(v3 - 360)
	end
	return v3 <= (if p1.ActiveSegmentSize == "Small" then 30 else 70) + 10
end
function t3.setNeedleSpeed(p1, p2) --[[ setNeedleSpeed | Line: 283 | Upvalues: v9 (copy), v5 (copy) ]]
	if not p1.cachedTamingHealth then
		p1.cachedTamingHealth = p1.adornee:GetAttribute("TamingHealth")
	end
	local v1 = p1.cachedTamingHealth or (p1.adornee:GetAttribute("TamingHealth") or Vector2.new(0, 1))
	if not p2 and math.random() <= p1.reverseNeedleChance then
		p1.reversed = not p1.reversed
	end
	local v2, v3 = p1:_getDifficultyMultplier()
	local v4 = if v3 then v9.TamingNeedleSpeedMultiplierPerValidRarityTier[v2] else v9.TamingNeedleSpeedMultiplierPerInvalidRarityTier[v2]
	p1.needleSpeed = v5.map(v1.X, 0, math.max(v1.Y - 1, 1), p1.startNeedleSpeed, p1.startNeedleSpeed * p1.needleSpeedOnLastHeart * (v4 or 1))
end
function t3.newRound(p1) --[[ newRound | Line: 310 ]]
	if p1.gui:FindFirstChild("InnerFrame") then
		p1.CanInput = false
		p1.cachedTamingHealth = p1.adornee:GetAttribute("TamingHealth")
		p1.needleStartAngle = p1:getNeedleAngle()
		p1:setNeedleSpeed()
		p1.needleT0 = time()
		p1:randomizeGoalAngle()
	end
end
function t3.randomizeGoalAngle(p1) --[[ randomizeGoalAngle | Line: 325 | Upvalues: v4 (copy) ]]
	p1.goalAngle = (p1.needleStartAngle + 180 + math.random(-90, 90)) % 360
	local v1 = if math.random() <= p1.smallSegmentChance then "Small" else "Large"
	local v2 = p1.gui.InnerFrame.ContainerFrame.CircleFrame.Segments[v1]
	for k, v in pairs(p1.gui.InnerFrame.ContainerFrame.CircleFrame.Segments:GetChildren()) do
		if p1.ActiveSegmentFrame then
			v.Rotation = p1.ActiveSegmentFrame.Rotation
		else
			v.ImageTransparency = 1
		end
		local t = {}
		t.ImageTransparency = if v2 == v then 0 else 1
		v4.target(v, 0.5, 2, t)
	end
	p1.ActiveSegmentSize = v1
	p1.ActiveSegmentFrame = v2
	game.ReplicatedStorage.Storage.SFX.Poof:Play()
	v4.target(v2, 0.5, 2, {
		Rotation = p1.goalAngle
	})
	task.delay(0.5, function() --[[ Line: 347 | Upvalues: p1 (copy) ]]
		p1.CanInput = true
	end)
end
function t3.showResult(p1, p2) --[[ showResult | Line: 355 ]]
	p1.ShowingResult = true
	p1.gui.InnerFrame.ContainerFrame.CircleFrame.LassoIcon.Visible = false
	local v2 = p1.gui.InnerFrame.ResultFrame:FindFirstChild((if p2 then "Correct" else "Incorrect") .. "Label")
	v2.UIScale.Scale = 0
	v2.Visible = true
	local v3 = game.TweenService:Create(v2.UIScale, TweenInfo.new(0.375, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		Scale = 1
	})
	v3:Play()
	v3.Completed:Wait()
	task.wait(0.5)
	if p1.gui:FindFirstChild("InnerFrame") then
		game.TweenService:Create(v2.UIScale, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			Scale = 0
		}):Play()
		task.delay(0.075, function() --[[ Line: 373 | Upvalues: p1 (copy) ]]
			p1.ShowingResult = false
			p1.gui.InnerFrame.ContainerFrame.CircleFrame.LassoIcon.Visible = true
		end)
	end
end
function t3.updateInputType(p1) --[[ updateInputType | Line: 379 | Upvalues: v2 (copy) ]]
	local v1 = v2.GetInputType()
	for v22, v3 in p1.gui.InnerFrame.ContainerFrame.CircleFrame.ControlLabel:GetChildren() do
		v3.Visible = tonumber(v3.Name) == v1
	end
end
function t3.tryEquipBestFood(p1) --[[ tryEquipBestFood | Line: 391 | Upvalues: v8 (copy), v10 (copy), v2 (copy), LocalPlayer (copy), v7 (copy) ]]
	local v1, v22 = p1:getBestFood(p1.preferredFoodRarityData.Name)
	if not v1 then
		v8.Notify({
			Message = "You do not have any food to use!",
			Preset = "Red",
			Type = "NoBestFood"
		})
		return
	end
	local EquippedTool = v10.EquippedTool
	if EquippedTool and (EquippedTool.ToolData.ItemType == "Food" and (v22 and (EquippedTool.ToolData.Name == v22.Name and EquippedTool.ToolData.Rarity.Index == v22.Rarity.Index))) then
		if v2.IsMobileInputType() then
			v8.Notify({
				Message = "Tap anywhere to feed the food!",
				Type = "AlreadyBestFood"
			})
		else
			v8.Notify({
				Message = "You already have the recommended food equipped!",
				Type = "AlreadyBestFood"
			})
		end
	else
		local v3 = LocalPlayer.Backpack:FindFirstChild(v1)
		if v3 then
			LocalPlayer.Character.Humanoid:EquipTool(v3)
			if v2.IsMobileInputType() then
				v8.Notify({
					Message = "Equipped recommended food! Tap anywhere to feed!",
					Type = "EquippedBestFood"
				})
			else
				v8.Notify({
					Message = "Equipped the recommended food!",
					Type = "EquippedBestFood"
				})
			end
		else
			local v4 = v7:GetEmptyToolSlot(v10) or v10.EquippedTool and v7:IsItemOnHotbar(v10, v10.EquippedTool.ToolData.Name)
			if v7:SetHotbarSlot(v4 and v4.Name or "1", v1) then
				v8.Notify({
					Message = "Equipped the recommended food!",
					Type = "EquippedBestFood"
				})
				LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:WaitForChild(v1))
			else
				v8.Notify({
					Message = "Unable to equip the recommended food!",
					Preset = "Red"
				})
			end
		end
	end
end
function t3.getBestFood(p1, p2) --[[ getBestFood | Line: 459 | Upvalues: t (copy), v6 (copy), v10 (copy) ]]
	local v1 = table.find(t, p2)
	local list = {}
	for i = v1, #t do
		table.insert(list, t[i])
	end
	for j = v1 - 1, 1, -1 do
		table.insert(list, t[j])
	end
	for i, v in ipairs(list) do
		local t2 = {}
		for k, v2 in pairs(v6.GetByTypeAndRarity("Food", v)) do
			local v4 = v10:GetItemValue(k).Value
			if not (v4 <= 0) then
				table.insert(t2, {
					Name = k,
					Amount = v4,
					ItemData = v2
				})
			end
		end
		table.sort(t2, function(p1, p2) --[[ Line: 480 ]]
			return p1.Amount > p2.Amount
		end)
		local v5 = t2[1]
		if v5 then
			return v5.Name, v5.ItemData
		end
	end
end
return t3