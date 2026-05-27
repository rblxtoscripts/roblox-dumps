-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("ViewportModel")
local v4 = Sonar("ItemReplicationService")
local v5 = Sonar("AnimalCosmetics")
local v6 = Sonar("PlayerWrapper")
local v7 = Sonar("AnimalRiggerService")
local v8 = Sonar("Signal")
local v9 = Sonar("FormatNumber")
local v10 = Sonar("InputTypeDetector")
local v11 = Sonar("TimeUtils")
local v12 = Sonar("ButtonTest")
local v13 = Sonar("DisplayUtils")
local v14 = Sonar("AdClient")
local v15 = Sonar("Constants")
local t2 = {
	Equipped = Color3.fromRGB(155, 239, 214),
	Favorited = Color3.fromRGB(255, 203, 215),
	Default = Color3.fromRGB(255, 255, 255)
}
local v16 = v6.GetClient()
local t3 = {}
local function isValueObject(p1) --[[ isValueObject | Line: 39 ]]
	return p1.ClassName:match("Value$") ~= nil
end
function t._setupScrollingFrame(p1, p2) --[[ _setupScrollingFrame | Line: 43 | Upvalues: t3 (copy) ]]
	if not p2 then
		return
	end
	if not p2:IsA("ScrollingFrame") then
		return
	end
	local _ = t3[p2]
end
function t.new(p1) --[[ new | Line: 54 | Upvalues: t (copy), v1 (copy), v6 (copy), v10 (copy), v8 (copy), v12 (copy), v14 (copy), v2 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.ViewportMaid = v1.new()
	v22.Maid = v1.new()
	v22.PlayerWrapper = v6.getWrapperFromPlayer(v22.Owner)
	v22.Maid:GiveTask(v22.ViewportMaid)
	v22.Disabled = v22.Disabled or {}
	v22.ScrollingFrame = v22.ParentFrame and (v10.IsMobileInputType() and v22.ParentFrame:FindFirstChild("ContentMobile") or v22.ParentFrame:FindFirstChild("Content") or v22.ParentFrame)
	if v22.ParentFrame and not v22.ParentFrame:IsA("ScrollingFrame") then
		for k, v in pairs(v22.ParentFrame:GetChildren()) do
			if v:IsA("ScrollingFrame") then
				v.Visible = v22.ScrollingFrame == v
			end
		end
	end
	local v5 = v22.GuiObject or (v22.ScrollingFrame:FindFirstChild("Default", true) or v22.ParentFrame:FindFirstChild("Default", true))
	if v22.DoNotClone then
		v22.Frame = v5
	else
		v22.Frame = v5:Clone()
		v5.Visible = false
	end
	v22:_setupScrollingFrame(v22.ScrollingFrame)
	v22.ViewportFrame = v22.ViewportFrame or v22.Frame:FindFirstChild("HorseViewport", true) or v22.Frame:FindFirstChild("Viewport", true) or v22.Frame:FindFirstChild("ViewportFrame", true)
	v22.SelectedGradient = v22.Frame:FindFirstChild("SelectedTab", true)
	v22.SelectedFrame = v22.Frame:FindFirstChild("Selected")
	v22.AllAttributes = {}
	v22.SlotAttributesChangedSignal = v8.new()
	v22.Maid:GiveTask(v22.SlotAttributesChangedSignal)
	v22.Maid:GiveTask(function() --[[ Line: 98 | Upvalues: v22 (copy) ]]
		for k, v in pairs(v22.AllAttributes) do
			v:Disconnect()
		end
	end)
	v22.Maid:GiveTask(v22.SlotValue.DescendantRemoving:Connect(function(p1) --[[ Line: 103 | Upvalues: v22 (copy) ]]
		v22:SlotAttributeRemoved(p1)
	end))
	v22.Maid:GiveTask(v22.SlotValue.DescendantAdded:Connect(function(p1) --[[ Line: 106 | Upvalues: v22 (copy) ]]
		v22:SlotAttributeAdded(p1)
	end))
	for k, v in pairs(v22.SlotValue:GetDescendants()) do
		v22:SlotAttributeAdded(v)
	end
	v22.Maid:GiveTask(v22.SlotValue:WaitForChild("Species"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 114 | Upvalues: v22 (copy) ]]
		v22:SetSpecies()
	end))
	v22:SetSpecies()
	v22.NameLabel = v22.Frame:FindFirstChild("NameLabel", true)
	if v22.NameLabel then
		v22.Maid:GiveTask(v22.SlotValue:WaitForChild("CustomName"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 122 | Upvalues: v22 (copy) ]]
			v22:SetName()
		end))
		if v22.SpeciesAsName then
			v22.Maid:GiveTask(v22.SlotValue:WaitForChild("Species"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 126 | Upvalues: v22 (copy) ]]
				v22:SetName()
			end))
		end
		v22:SetName()
	end
	v22.GenderLabel = v22.Frame:FindFirstChild("Gender", true)
	if v22.GenderLabel then
		v22.Maid:GiveTask(v22.SlotValue:WaitForChild("Gender"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 136 | Upvalues: v22 (copy) ]]
			v22:SetGender()
		end))
		v22:SetGender()
	end
	v22.EquippedLabel = v22.Frame:FindFirstChild("Equipped", true)
	if v22.EquippedLabel then
		v22.Maid:GiveTask(v22.PlayerWrapper.EquippedAnimalChangedSignal:Connect(function(p1) --[[ Line: 145 | Upvalues: v22 (copy) ]]
			if p1 == v22.SlotValue.Name then
				v22:SetEquipped()
			end
		end))
		v22:SetEquipped()
	end
	v22.AgeLabel = v22.Frame:FindFirstChild("Age", true)
	if v22.AgeLabel then
		v22.Maid:GiveTask(v22.SlotValue.Age:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 155 | Upvalues: v22 (copy) ]]
			v22:SetAge()
			local Age = v22.SlotValue.Age.Value
			local v1 = v22._previousAge or Age
			v22._previousAge = Age
			if v1 <= 44 and Age > 44 then
				v22:SetSpecies()
			end
			if Age ~= 0 then
				return
			end
			v22:SetSpecies()
		end))
		v22._previousAge = v22.SlotValue.Age.Value
		v22:SetAge()
	end
	v22.TraitsLabel = v22.Frame:FindFirstChild("Traits", true)
	if v22.TraitsLabel then
		v22:SetTraits()
	end
	if v22.DoNotClone then
		v22.UnableFrame = v22.Frame:FindFirstChild("Unable", true)
	else
		v22.UnableFrame = v22.UnableFrame or (v22.Frame:FindFirstChild("Unable", true) or v22.Frame.Parent and v22.Frame.Parent:FindFirstChild("Unable"))
	end
	if v22.UnableFrame then
		if v22.UnableCheck then
			v22.UnableChangedSignal = v8.new()
			v22.Maid:GiveTask(v22.UnableChangedSignal)
			for k, v in pairs(v22.UnableCheck.Changed) do
				v22.Maid:GiveTask(v:Connect(function() --[[ Line: 195 | Upvalues: v22 (copy) ]]
					v22:SetUnable()
				end))
			end
			if v22.UnableCheck.ListenForValueAttributes then
				v22.Maid:GiveTask(v22.SlotAttributesChangedSignal:Connect(function() --[[ Line: 201 | Upvalues: v22 (copy) ]]
					v22:SetUnable()
				end))
			end
			v22:SetUnable()
			if v22.DoNotClone then
				v22.Maid:GiveTask(function() --[[ Line: 208 | Upvalues: v22 (copy) ]]
					v22.UnableFrame.Visible = false
				end)
			end
		else
			v22.UnableFrame.Visible = false
		end
		v22.AdButton = v22.UnableFrame and v22.UnableFrame:FindFirstChild("AdButton")
		if v22.AdButton and not v22.DoNotClone then
			v22.Maid:GiveTask(v12.new(v22.AdButton, {
				Click = function() --[[ Click | Line: 219 | Upvalues: v14 (ref) ]]
					v14.ShowAdWithoutPrompt("BreedingSpeedUp")
				end
			}))
		end
	end
	v22.FavoriteLabel = v22.Frame:FindFirstChild("Favorite", true)
	v22.Maid:GiveTask(v22.SlotValue.Favorite:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 228 | Upvalues: v22 (copy) ]]
		v22:SetFavorite()
	end))
	v22:SetFavorite()
	v22.PregnantLabel = v22.Frame:FindFirstChild("Pregnant", true)
	if v22.PregnantLabel then
		v22.PregnantMaid = v1.new()
		v22.Maid:GiveTask(v22.PregnantMaid)
		v22.Maid:GiveTask(v22.SlotValue.Child:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 238 | Upvalues: v22 (copy) ]]
			v22:SetPregnant()
		end))
		v22:SetPregnant()
	end
	if v22.ShowBreedWaitIndicator then
		v22.BreedWaitLabel = v22.Frame:FindFirstChild("BreedWait", true)
		if not v22.BreedWaitLabel and v22.PregnantLabel then
			v22.BreedWaitLabel = v22.PregnantLabel:Clone()
			v22.BreedWaitLabel.Name = "BreedWait"
			v22.BreedWaitLabel.Visible = false
			local Position = v22.PregnantLabel.Position
			v22.BreedWaitLabel.Position = UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset + 36)
			v22.BreedWaitLabel.Parent = v22.PregnantLabel.Parent
		end
		if v22.BreedWaitLabel then
			v22.BreedWaitLabel.Image = "rbxassetid://113988791960442"
			v22.BreedWaitMaid = v1.new()
			v22.Maid:GiveTask(v22.BreedWaitMaid)
			local function scheduleBreedWaitUpdate() --[[ scheduleBreedWaitUpdate | Line: 261 | Upvalues: v22 (copy) ]]
				v22:SetBreedWait()
			end
			v22.Maid:GiveTask(v22.SlotValue.Species:GetPropertyChangedSignal("Value"):Connect(scheduleBreedWaitUpdate))
			local v9 = false
			local function connectLastBreedFixed() --[[ connectLastBreedFixed | Line: 268 | Upvalues: v9 (ref), v22 (copy), scheduleBreedWaitUpdate (copy) ]]
				if v9 then
					return
				end
				local LastBreedFixed = v22.SlotValue:FindFirstChild("LastBreedFixed")
				if not (LastBreedFixed and LastBreedFixed:IsA("ValueBase")) then
					return
				end
				v9 = true
				v22.Maid:GiveTask(LastBreedFixed:GetPropertyChangedSignal("Value"):Connect(scheduleBreedWaitUpdate))
				v22:SetBreedWait()
			end
			connectLastBreedFixed()
			if not v9 then
				v22.Maid:GiveTask(v22.SlotValue.DescendantAdded:Connect(function(p1) --[[ Line: 281 | Upvalues: connectLastBreedFixed (copy) ]]
					if p1.Name ~= "LastBreedFixed" or not p1:IsA("ValueBase") then
						return
					end
					connectLastBreedFixed()
				end))
			end
			v22:SetBreedWait()
		end
	end
	if v22.ShowSellValue == false then
		if v22.Icon then
			v22.IconImageLabel = v22.Frame:FindFirstChild("ImageLabel")
			v22.IconImageLabel.Image = v22.Icon
		end
	else
		v22.SellValueLabel = v22.Frame:FindFirstChild("SellValueLabel", true)
		v22.SellFrame = v22.Frame:FindFirstChild("Sell", true)
		if v22.SellValueLabel then
			for k, v in pairs(v2.GetPriceChangeValues(v22.SlotValue)) do
				v22.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 298 | Upvalues: v22 (copy) ]]
					v22:SetSellValue()
				end))
			end
			v22:SetSellValue()
		end
	end
	v22.MutationsChangedSignal = v8.new()
	v22.AllMutations = {}
	v22.Maid:GiveTask(v22.MutationsChangedSignal)
	v22.Maid:GiveTask(function() --[[ Line: 316 | Upvalues: v22 (copy) ]]
		for k, v in pairs(v22.AllMutations) do
			v:Destroy()
		end
	end)
	v22.Maid:GiveTask(v22.SlotValue:WaitForChild("Mutations").ChildRemoved:Connect(function(p1) --[[ Line: 321 | Upvalues: v22 (copy) ]]
		v22:MutationRemoved(p1)
	end))
	v22.Maid:GiveTask(v22.SlotValue.Mutations.ChildAdded:Connect(function(p1) --[[ Line: 324 | Upvalues: v22 (copy) ]]
		v22:MutationAdded(p1)
	end))
	for k, v in pairs(v22.SlotValue.Mutations:GetChildren()) do
		v22:MutationAdded(v, true)
	end
	v22:Deselect()
	v22:SetBackgroundColor()
	if not v22.Disabled.Storage then
		v22.InStorageValue = v22.SlotValue:FindFirstChild("InStorage")
		if v22.InStorageValue then
			v22.Maid:GiveTask(v22.InStorageValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 337 | Upvalues: v22 (copy) ]]
				v22:SetFrameVisibility(true)
			end))
		end
	end
	if not v22.DoNotClone then
		v22.Frame.Visible = v22.ForceVisible
		v22.Frame.Name = v22.SlotValue.Name
		v22.Frame.Parent = v22.ScrollingFrame
		v22.Maid:GiveTask(v22.Frame)
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 353 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.GiveTask(p1, ...) --[[ GiveTask | Line: 358 ]]
	return p1.Maid:GiveTask(...)
end
function t.UpdateIcon(p1, p2) --[[ UpdateIcon | Line: 362 ]]
	if p1.IconImageLabel then
		p1.IconImageLabel.Image = p2
	end
end
function t.SlotAttributeRemoved(p1, p2) --[[ SlotAttributeRemoved | Line: 367 ]]
	if p1.AllAttributes[p2] then
		p1.AllAttributes[p2]:Disconnect()
		p1.AllAttributes[p2] = nil
	end
end
function t.SlotAttributeAdded(p1, p2, p3) --[[ SlotAttributeAdded | Line: 373 ]]
	if not (if p2.ClassName:match("Value$") == nil then false else true) then
		return
	end
	p1.AllAttributes[p2] = p2:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 375 | Upvalues: p1 (copy) ]]
		p1.SlotAttributesChangedSignal:Fire()
	end)
	if p3 then
		return
	end
	p1.SlotAttributesChangedSignal:Fire()
end
function t.MutationAdded(p1, p2, p3) --[[ MutationAdded | Line: 383 | Upvalues: v1 (copy) ]]
	local v12 = v1.new()
	v12:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 385 | Upvalues: p1 (copy) ]]
		p1.MutationsChangedSignal:Fire()
	end))
	p1.AllMutations[p2] = v12
	if p3 then
		return
	end
	p1.MutationsChangedSignal:Fire()
end
function t.MutationRemoved(p1, p2) --[[ MutationRemoved | Line: 394 ]]
	if p1.AllMutations[p2] then
		p1.AllMutations[p2]:Destroy()
		p1.AllMutations[p2] = nil
		p1.MutationsChangedSignal:Fire()
	end
end
function t.SetBreedWait(p1) --[[ SetBreedWait | Line: 401 | Upvalues: v2 (copy), v16 (copy), v11 (copy) ]]
	if not (p1.BreedWaitLabel and p1.BreedWaitMaid) then
		return
	end
	p1.BreedWaitMaid:DoCleaning()
	local SlotValue = p1.SlotValue
	if v2.GetBreedWait(v16, SlotValue) and SlotValue:FindFirstChild("LastBreedFixed") then
		local function setProgress() --[[ setProgress | Line: 414 | Upvalues: v2 (ref), v16 (ref), SlotValue (copy), p1 (copy) ]]
			local v1 = v2.GetBreedWait(v16, SlotValue)
			if not v1 or v1 <= 0 then
				p1.BreedWaitLabel.Visible = false
				return
			end
			local v22 = v2.GetBirthWaitTimeLeft(v16, SlotValue)
			if v22 <= 0 then
				p1.BreedWaitLabel.Visible = false
				return
			end
			local v3 = math.clamp(v22 / v1, 0, 1)
			local UIGradient = p1.BreedWaitLabel:FindFirstChildOfClass("UIGradient")
			if UIGradient then
				UIGradient.Offset = Vector2.new(0, v3 - 0.5)
			end
			p1.BreedWaitLabel.Visible = true
		end
		p1.BreedWaitMaid:GiveTask(v11.AttachToTime(setProgress))
		setProgress()
	else
		p1.BreedWaitLabel.Visible = false
	end
end
function t.SetPregnant(p1) --[[ SetPregnant | Line: 439 | Upvalues: v2 (copy), v16 (copy), v11 (copy) ]]
	p1.PregnantMaid:DoCleaning()
	if #p1.SlotValue.Child.Value > 0 then
		local function setProgress() --[[ setProgress | Line: 443 | Upvalues: v2 (ref), v16 (ref), p1 (copy) ]]
			local v1 = v2.GetBreedCooldown(v16, p1.SlotValue)
			p1.PregnantLabel.UIGradient.Offset = Vector2.new(0, math.clamp(v2.GetBirthTimeLeft(v16, p1.SlotValue) / v1, 0, 1) - 0.5)
			if not p1.PregnancyChangedSignal then
				return
			end
			p1.PregnancyChangedSignal:Fire()
		end
		p1.PregnantMaid:GiveTask(v11.AttachToTime(setProgress))
		setProgress()
		p1.PregnantLabel.Visible = true
		return
	end
	p1.PregnantLabel.Visible = false
	if not p1.PregnancyChangedSignal then
		return
	end
	p1.PregnancyChangedSignal:Fire()
end
function t.SetSellValue(p1) --[[ SetSellValue | Line: 466 | Upvalues: v9 (copy), v2 (copy) ]]
	p1.SellValueLabel.Text = "$" .. v9.splice(v2.GetPriceForSlot(p1.SlotValue))
end
function t.SetSold(p1, p2) --[[ SetSold | Line: 470 ]]
	p1.SellFrame.SoldLabel.Visible = p2
end
function t.SetVisible(p1, p2) --[[ SetVisible | Line: 474 ]]
	p1.Visible = p2
	p1:SetFrameVisibility()
end
function t.SetFrameVisibility(p1, p2) --[[ SetFrameVisibility | Line: 480 ]]
	local Visible = p1.Visible
	if not p1.Disabled.Storage and p1.InStorageValue then
		if p2 and p1.PregnancyChangedSignal then
			p1.PregnancyChangedSignal:Fire()
		end
		if p1.InStorageValue.Value then
			Visible = false
		end
	end
	p1.Frame.Visible = Visible
end
function t.SetAge(p1) --[[ SetAge | Line: 498 | Upvalues: v15 (copy), v2 (copy) ]]
	p1.AgeLabel.Image = v15.AgeImages[v2.GetAge(p1.SlotValue)]
	p1.AgeLabel.Visible = v2.GetAge(p1.SlotValue) ~= "Adult"
end
function t.SetFavorite(p1) --[[ SetFavorite | Line: 503 ]]
	if p1.FavoriteLabel then
		p1.FavoriteLabel.Image = "rbxassetid://16171174133"
		p1.FavoriteLabel.Visible = p1.SlotValue.Favorite.Value
	end
	p1:SetBackgroundColor()
end
function t.SetUnable(p1) --[[ SetUnable | Line: 511 ]]
	local v1, v2 = p1.UnableCheck.Get(p1)
	local v3 = p1.UnableCheck.Reasons[v1]
	local v4 = type(v3) == "function" and v3(p1) or v3
	local v5 = if v1 == p1.UnableReason then false else true
	if v4 or type(v1) == "string" then
		p1.UnableReason = v1
		p1.AllUnableReasons = if v2 then v2 else { v1 }
		if type(v4) == "table" then
			local v7 = v4.Timer and p1.UnableFrame.Timer or p1.UnableFrame.Status
			if v4.Text then
				v7.Title.Text = v4.Text
			end
			if v4.Timer then
				v7.Counter.Text = v4.Timer
			end
			if p1.AdButton and not p1.DoNotClone then
				p1.AdButton.Visible = v4.ShowAdButton
			end
			if not p1.UnableFrame:GetAttribute("OriginalTransparency") then
				p1.UnableFrame:SetAttribute("OriginalTransparency", p1.UnableFrame.BackgroundTransparency)
			end
			p1.UnableFrame.BackgroundTransparency = v4.Transparency or p1.UnableFrame:GetAttribute("OriginalTransparency")
			local ImageLabel = v7:FindFirstChild("ImageLabel")
			if ImageLabel then
				ImageLabel.Image = v4.Image or ""
				ImageLabel.Visible = #ImageLabel.Image > 0
			end
			for k, v in pairs(p1.UnableFrame:GetChildren()) do
				if v:IsA("Frame") then
					v.Visible = v == v7
				end
			end
		else
			for k, v in pairs(p1.UnableFrame:GetChildren()) do
				if v:IsA("Frame") then
					v.Visible = false
				end
			end
		end
		p1.UnableFrame.Visible = true
	else
		p1.UnableReason = nil
		p1.AllUnableReasons = nil
		p1.UnableFrame.Visible = false
	end
	if not v5 then
		return
	end
	p1.UnableChangedSignal:Fire()
end
function t.HasLayoutUnableReason(p1) --[[ HasLayoutUnableReason | Line: 567 ]]
	if not p1.AllUnableReasons then
		return
	end
	for k, v in pairs(p1.AllUnableReasons) do
		local v1 = p1.UnableCheck.Reasons[v]
		if not v1 then
			return true
		end
		local v2 = type(v1) == "function" and v1(p1) or v1
		if (type(v2) ~= "table" or not v2.IgnoreLayout) and v2 then
			return true
		end
	end
end
function t.SetLayoutOrder(p1, p2) --[[ SetLayoutOrder | Line: 579 ]]
	p1.Frame.LayoutOrder = p2
end
function t.SetBackgroundColor(p1) --[[ SetBackgroundColor | Line: 583 | Upvalues: t2 (copy) ]]
	local _ = p1.IgnoreBackgroundColor
	p1.Frame.BackgroundColor3 = p1.EquippedLabel and p1.EquippedLabel.Visible and t2.Equipped or (p1.SlotValue.Favorite.Value and t2.Favorited or t2.Default)
end
function t.Select(p1) --[[ Select | Line: 591 ]]
	if p1.SelectedGradient then
		p1.SelectedGradient.Enabled = true
	end
	if not p1.SelectedFrame then
		return
	end
	p1.SelectedFrame.Visible = true
end
function t.Deselect(p1) --[[ Deselect | Line: 600 ]]
	if p1.SelectedGradient then
		p1.SelectedGradient.Enabled = false
	end
	if not p1.SelectedFrame then
		return
	end
	p1.SelectedFrame.Visible = false
end
function t.SetEquipped(p1) --[[ SetEquipped | Line: 609 | Upvalues: v7 (copy) ]]
	p1.EquippedLabel.Visible = v7.IsAnimalEquipped(p1.PlayerWrapper, p1.SlotValue)
	p1:SetBackgroundColor()
end
function t.SetSpecies(p1) --[[ SetSpecies | Line: 615 | Upvalues: Sonar (copy), v2 (copy) ]]
	p1.SpeciesData = Sonar("AnimalDataService").IsFoal(p1.SlotValue) and not Sonar("AnimalDataService").IsToyHorse(p1.SlotValue) and v2.GetByName("Foal") or v2.GetByName(p1.SlotValue.Species.Value)
	p1:SetViewport()
end
function t.SetViewport(p1) --[[ SetViewport | Line: 623 | Upvalues: v4 (copy), v2 (copy), v3 (copy), v5 (copy), Sonar (copy) ]]
	task.spawn(function() --[[ Line: 624 | Upvalues: p1 (copy), v4 (ref), v2 (ref), v3 (ref), v5 (ref), Sonar (ref) ]]
		if p1.LastViewportChange and tick() - p1.LastViewportChange < 0.1 then
			return
		end
		p1.LastViewportChange = tick()
		wait(0.1)
		p1.ViewportMaid:DoCleaning()
		local v1 = v4.Get(p1.SpeciesData):Clone()
		v1.Parent = p1.ViewportFrame
		p1.ViewportMaid:GiveTask(v1)
		v1:ScaleTo((v2.GetScale(p1.SlotValue)))
		local Camera = Instance.new("Camera")
		Camera.Parent = p1.ViewportFrame
		p1.ViewportFrame.CurrentCamera = Camera
		p1.ViewportMaid:GiveTask(Camera)
		if p1.FullBodyViewport then
			Camera.FieldOfView = 1
			Camera.CFrame = v3(v1, p1.ViewportFrame, -130, -8)
		else
			Camera.FieldOfView = 1
			local Model = Instance.new("Model")
			local Part = Instance.new("Part", Model)
			Part.CFrame = v1:FindFirstChild("Head", true).WorldCFrame - Vector3.new(0, 1.35, 0)
			Part.Size = Vector3.new(4.5, 0, 4.5)
			Camera.CFrame = v3(Model, p1.ViewportFrame, 130, -8)
			Model:Destroy()
		end
		local Eyelid = v1:FindFirstChild("Eyelid")
		if Eyelid then
			Eyelid:Destroy()
		end
		p1.ViewportFrame.Ambient = Color3.fromRGB(192, 192, 192)
		p1.ViewportFrame.LightDirection = Camera.CFrame.LookVector
		p1.ViewportMaid:GiveTask(v5.new(v1, {
			InViewport = true,
			SlotValue = p1.SlotValue,
			DisableAccessories = p1.DisableAccessories,
			IsYoung = Sonar("AnimalDataService").IsFoal(p1.SlotValue)
		}))
	end)
end
function t.SetName(p1) --[[ SetName | Line: 686 | Upvalues: v2 (copy), v13 (copy) ]]
	if p1.SpeciesAsName then
		local v1 = v2.GetByName(p1.SlotValue.Species.Value)
		p1.NameLabel.Text = v13.GetDisplayName(v1.Name, v1)
	elseif p1.DisplayName then
		p1.NameLabel.Text = p1.DisplayName
	else
		p1.NameLabel.Text = v2.GetCustomName(p1.SlotValue)
	end
	if not p1.UpperCaseName then
		return
	end
	p1.NameLabel.Text = v13.SafeUpper(p1.NameLabel.Text)
end
function t.SetGender(p1) --[[ SetGender | Line: 700 | Upvalues: v2 (copy) ]]
	local v1 = v2.GetGender(p1.SlotValue)
	p1.GenderLabel.Text = if v1 == "Both" then "\226\173\149\239\184\143" elseif v1 == "Male" then "\226\153\130\239\184\143" else "\226\153\128\239\184\143"
	if not p1.HideGenderIfMain then
		return
	end
	p1.GenderLabel.Visible = v1 == "Both"
end
function t.SetTraits(p1) --[[ SetTraits | Line: 708 | Upvalues: v2 (copy) ]]
	local v1 = #v2.GetTraits()
	p1.TraitsLabel.Text = v1
	p1.TraitsLabel.Visible = v1 > 0
	local TraitIcon = p1.Frame:FindFirstChild("TraitIcon", true)
	if not TraitIcon then
		return
	end
	TraitIcon.Visible = p1.TraitsLabel.Visible
end
return t