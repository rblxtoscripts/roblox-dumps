-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("ItemDataService")
local v3 = Sonar("Signal")
local v4 = Sonar("DisplayUtils")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("HotbarService")
local v7 = Sonar("InputTypeDetector")
local v8 = Sonar("EquipmentService")
local v9 = Sonar("ItemDisplayCreator")
local v10 = Sonar("MarketplaceUtils")
local v11 = Sonar("PlayerWrapper")
local v12 = Sonar("State")
local t2 = {
	Equipped = Color3.fromRGB(101, 244, 128),
	Default = Color3.fromRGB(255, 255, 255)
}
local v13 = v11.GetClient()
local t3 = {}
local function v14(p1, p2) --[[ flattenTable | Line: 34 | Upvalues: v14 (copy) ]]
	local v2 = if p2 then p2 else {}
	for k, v in pairs(p1) do
		if type(v) == "table" and (not v.ClassName or v.ClassName ~= "Signal") then
			v14(v, v2)
			continue
		end
		table.insert(v2, v)
	end
	return v2
end
function t._setupScrollingFrame(p1) --[[ _setupScrollingFrame | Line: 46 | Upvalues: t3 (copy) ]]
	if not p1.ScrollingFrame then
		return
	end
	if not p1.ScrollingFrame:IsA("ScrollingFrame") then
		return
	end
	local _ = t3[p1.ScrollingFrame]
end
function t._checkAmount(p1) --[[ _checkAmount | Line: 58 ]]
	if p1.CheckAmount then
		return p1.CheckAmount(p1)
	end
	return p1:_getAmount() > 0
end
function t._getAmount(p1) --[[ _getAmount | Line: 66 ]]
	if p1.GetAmount then
		return p1.GetAmount(p1)
	else
		return p1.DataValue.Value
	end
end
function t._init(p1, p2) --[[ _init | Line: 74 | Upvalues: v2 (copy), v7 (copy), v14 (copy), v13 (copy), v12 (copy), ReplicatedStorage (copy), v3 (copy) ]]
	debug.profilebegin("construct_item_grid_button")
	p1.Maid:DoCleaning()
	p1.Info = if p2 then p2 else p1.Info
	if not p1.Info then
		debug.profileend()
		return
	end
	p1.Item = p1.Item or p1.DataValue and v2.GetByName(p1.DataValue.Name)
	p1.ScrollingFrame = p1.ParentFrame and (v7.IsMobileInputType() and p1.ParentFrame:FindFirstChild("ContentMobile") or p1.ParentFrame:FindFirstChild("Content") or p1.ParentFrame)
	if p1.ParentFrame and not p1.ParentFrame:IsA("ScrollingFrame") then
		for k, v in pairs(p1.ParentFrame:GetChildren()) do
			if v:IsA("ScrollingFrame") then
				v.Visible = p1.ScrollingFrame == v
			end
		end
	end
	local v4 = p1.GuiObject or (p1.ScrollingFrame:FindFirstChild("Default", true) or p1.ParentFrame:FindFirstChild("Default", true))
	if p1.DoNotClone then
		p1.Frame = v4
	else
		p1.Frame = v4:Clone()
		v4.Visible = false
	end
	p1:_setupScrollingFrame()
	p1.SelectedGradient = p1.Frame:FindFirstChild("SelectedTab", true)
	p1.NameLabel = p1.Frame:FindFirstChild("NameLabel", true)
	local AppendLuckPower = p1.AppendLuckPower
	p1.LuckPowerValue = p1.DataValue and (if p1.Item.ItemType == "Chests" then p1.DataValue:WaitForChild("LuckPower") else false)
	if p1.LuckPowerValue then
		p1.Maid:GiveTask(p1.LuckPowerValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 116 | Upvalues: p1 (copy) ]]
			p1:SetName()
		end))
	end
	if p1.NameLabel then
		p1:SetName()
	end
	p1.OwnedLabel = p1.Frame:FindFirstChild("OwnedLabel", true)
	p1.NoneOwnedLabel = p1.Frame:FindFirstChild("NoneOwnedLabel", true)
	if p1.OwnedLabel and p1.DataValue then
		if p1.DataValue:IsA("IntValue") then
			p1.Maid:GiveTask(p1.DataValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 131 | Upvalues: p1 (copy) ]]
				pcall(function() --[[ Line: 132 | Upvalues: p1 (ref) ]]
					p1:SetAmountOwned()
				end)
			end))
			if p1.AmountChanged then
				if type(p1.AmountChanged) == "table" and (not p1.AmountChanged.ClassName or p1.AmountChanged.ClassName ~= "Signal") then
					p1.AmountChanged = v14(p1.AmountChanged)
				else
					p1.AmountChanged = { p1.AmountChanged }
				end
				for k, v in pairs(p1.AmountChanged) do
					p1.Maid:GiveTask(v:Connect(function() --[[ Line: 145 | Upvalues: p1 (copy) ]]
						pcall(function() --[[ Line: 146 | Upvalues: p1 (ref) ]]
							p1:SetAmountOwned()
						end)
					end))
				end
			end
			p1:SetAmountOwned()
		else
			p1.OwnedLabel.Visible = false
			if p1.NoneOwnedLabel then
				p1.NoneOwnedLabel.Visible = false
			end
		end
	elseif p1.OwnedLabel and p1.GetAmount then
		if p1.AmountChanged then
			if type(p1.AmountChanged) == "table" and (not p1.AmountChanged.ClassName or p1.AmountChanged.ClassName ~= "Signal") then
				p1.AmountChanged = v14(p1.AmountChanged)
			else
				p1.AmountChanged = { p1.AmountChanged }
			end
			for k, v in pairs(p1.AmountChanged) do
				p1.Maid:GiveTask(v:Connect(function() --[[ Line: 170 | Upvalues: p1 (copy) ]]
					pcall(function() --[[ Line: 171 | Upvalues: p1 (ref) ]]
						p1:SetAmountOwned()
					end)
				end))
			end
		end
		p1:SetAmountOwned()
	end
	p1.AmountLabel = p1.Frame:FindFirstChild("AmountLabel", true)
	if p1.AmountLabel and p1.GetAmount then
		if p1.AmountChanged then
			if type(p1.AmountChanged) == "table" and (not p1.AmountChanged.ClassName or p1.AmountChanged.ClassName ~= "Signal") then
				p1.AmountChanged = v14(p1.AmountChanged)
			else
				p1.AmountChanged = { p1.AmountChanged }
			end
			for k, v in pairs(p1.AmountChanged) do
				p1.Maid:GiveTask(v:Connect(function() --[[ Line: 193 | Upvalues: p1 (copy) ]]
					pcall(function() --[[ Line: 194 | Upvalues: p1 (ref) ]]
						p1:SetAmount()
					end)
				end))
			end
		end
		p1:SetAmount()
	end
	p1.HotbarLabel = p1.Frame:FindFirstChild("HotbarLabel", true)
	if p1.HotbarLabel or p1.ShowHotbarEquipped then
		p1.Maid:GiveTask(v13.HotbarChangedSignal:Connect(function(p12) --[[ Line: 208 | Upvalues: p1 (copy) ]]
			p1:SetHotbarEquipped()
		end))
		p1:SetHotbarEquipped()
	end
	p1.ViewportFrame = p1.ViewportFrame or (p1.Frame:FindFirstChild("ItemViewport", true) or p1.Frame:FindFirstChild("Viewport", true))
	if not p1.ViewportFrame and p1.Frame:IsA("ImageLabel") then
		p1.ViewportFrame = p1.Frame
	end
	if p1.ViewportFrame and p1.ViewportFrame:IsA("ImageLabel") then
		p1:SetViewport()
	end
	p1.PriceLabel = p1.Frame:FindFirstChild("PriceLabel", true)
	p1.RobuxLabel = p1.Frame:FindFirstChild("RobuxLabel", true)
	p1.Price = p1.Price
	p1.PriceState = p1.Maid:GiveTask(v12.new(p1.Price))
	if p1.PriceLabel or p1.RobuxLabel then
		p1.Maid:GiveTask(p1.PriceState:subscribe(function(p12) --[[ Line: 234 | Upvalues: p1 (copy) ]]
			p1.Price = p12
			p1:SetPrice()
		end))
		if p1.GuiSource == "Shop" then
			p1.PriceLabel.UIGradient.Color = ReplicatedStorage.Storage.Assets.CoinsGradient.Color
			p1.PriceLabel.UIStroke.Color = Color3.fromRGB(89, 86, 168)
			local v72 = p1.Maid:GiveTask(v12.fromProperty(p1.PriceLabel, "TextBounds"))
			local ImageLabel = p1.PriceLabel.ImageLabel
			ImageLabel.Visible = true
			p1.Maid:GiveTask(v72:subscribe(function(p12, p2) --[[ Line: 249 | Upvalues: p1 (copy), ImageLabel (ref) ]]
				p2:add(task.defer(function() --[[ Line: 250 | Upvalues: p1 (ref), ImageLabel (ref) ]]
					ImageLabel.Position = UDim2.fromScale(1 - (p1.PriceLabel.TextBounds.X + 4) / p1.PriceLabel.AbsoluteSize.X, 1)
				end))
			end))
		end
	end
	p1.RarityFrame = p1.Frame:FindFirstChild("Rarity", true)
	if p1.RarityFrame then
		p1:SetRarity()
	end
	p1.ThemeFrame = p1.Frame:FindFirstChild("Theme", true)
	if p1.ThemeFrame and not p1.NoTheme then
		if p1.Item.ItemType == "Equipment" or p1.Theme then
			if p1.DataValue then
				for k, v in pairs(p1.DataValue:GetChildren()) do
					if not v:IsA("Folder") then
						p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 279 | Upvalues: p1 (copy) ]]
							p1:SetTheme()
							if not p1.RarityFrame then
								return
							end
							p1:SetRarity()
						end))
					end
				end
			end
			p1:SetTheme()
		else
			p1.ThemeFrame.Visible = false
		end
	end
	p1.UnableFrame = p1.UnableFrame or (p1.Frame:FindFirstChild("Unable", true) or p1.Frame.Parent and p1.Frame.Parent:FindFirstChild("Unable"))
	if p1.UnableFrame then
		if p1.UnableCheck then
			p1.UnableChangedSignal = v3.new()
			p1.Maid:GiveTask(p1.UnableChangedSignal)
			for k, v in pairs(p1.UnableCheck.Changed) do
				p1.Maid:GiveTask(v:Connect(function() --[[ Line: 303 | Upvalues: p1 (copy) ]]
					p1:SetUnable()
				end))
			end
			p1:SetUnable()
			if p1.DoNotClone then
				p1.Maid:GiveTask(function() --[[ Line: 311 | Upvalues: p1 (copy) ]]
					p1.UnableFrame.Visible = false
				end)
			end
		else
			p1.UnableFrame.Visible = false
		end
	end
	p1:SetSlot(p1.SlotValue)
	p1:Deselect()
	p1:SetBackgroundColor()
	if p1.DoNotClone then
		debug.profileend()
		return
	end
	p1.Frame.Visible = p1.ForceVisible
	p1.Frame.Name = p1.DataValue and p1.DataValue.Name or p1.Item.Name
	p1.Frame.Parent = p1.ScrollingFrame
	p1.Maid:GiveTask(p1.Frame)
	debug.profileend()
end
function t.new(p1) --[[ new | Line: 334 | Upvalues: t (copy), v1 (copy) ]]
	local t2 = {
		__index = function(p1, p2) --[[ __index | Line: 336 | Upvalues: t (ref) ]]
			local v1 = rawget(p1, "Info")
			local v2 = t[p2]
			return if v2 then v2 elseif v1 then v1[p2] else v1
		end
	}
	local v12 = setmetatable({}, t2)
	v12.Maid = v1.new()
	v12.Info = p1
	v12:_init()
	return v12
end
function t.Destroy(p1) --[[ Destroy | Line: 354 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.GiveTask(p1, ...) --[[ GiveTask | Line: 359 ]]
	return p1.Maid:GiveTask(...)
end
function t.SetUnable(p1) --[[ SetUnable | Line: 363 ]]
	local v1, v2 = p1.UnableCheck.Get(p1)
	local v3 = p1.UnableCheck.Reasons[v1]
	local v4 = type(v3) == "function" and v3(p1, v2) or v3
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
function t.HasLayoutUnableReason(p1) --[[ HasLayoutUnableReason | Line: 408 ]]
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
function t.SetSlot(p1, p2) --[[ SetSlot | Line: 420 | Upvalues: v1 (copy) ]]
	if not p1.SlotMaid then
		p1.SlotMaid = v1.new()
		p1.Maid:GiveTask(p1.SlotMaid)
	end
	p1.SlotMaid:DoCleaning()
	if not p2 then
		return
	end
	p1.SlotValue = p2
	p1.EquippedOnSlotFrame = p1.Frame:FindFirstChild("EquippedOnSlot")
	if not p1.EquippedOnSlotFrame then
		return
	end
	if p1.Item.ItemType == "Equipment" or p1.Item.ItemType == "Flairs" then
		p1.SlotMaid:GiveTask(p2.EquippedEquipment.ChildRemoved:Connect(function() --[[ Line: 436 | Upvalues: p1 (copy), p2 (copy) ]]
			p1:SetEquipmentEquipped(p2)
		end))
		p1.SlotMaid:GiveTask(p2.EquippedEquipment.ChildAdded:Connect(function() --[[ Line: 439 | Upvalues: p1 (copy), p2 (copy) ]]
			p1:SetEquipmentEquipped(p2)
		end))
		p1:SetEquipmentEquipped(p2)
	else
		p1.EquippedOnSlotFrame.Visible = false
	end
end
function t.SetEquipmentEquipped(p1, p2) --[[ SetEquipmentEquipped | Line: 449 ]]
	if p2.EquippedEquipment:FindFirstChild(p1.DataValue.Name) then
		p1.EquippedOnSlotFrame.Visible = true
	else
		p1.EquippedOnSlotFrame.Visible = false
	end
end
function t.SetTheme(p1) --[[ SetTheme | Line: 457 | Upvalues: v8 (copy), v2 (copy) ]]
	local v1 = p1.DataValue and v8.GetThemeFromValue(p1.DataValue) or p1.Theme and v2.GetByName(p1.Theme)
	if v1 then
		if v1.Texture then
			p1.ThemeFrame.ImageLabel.Image = v1.Texture
			p1.ThemeFrame.ImageLabel.UIGradient.Enabled = false
		else
			p1.ThemeFrame.ImageLabel.Image = ""
			p1.ThemeFrame.ImageLabel.UIGradient.Color = v1.ColorSequence
			p1.ThemeFrame.ImageLabel.UIGradient.Enabled = true
		end
		p1.ThemeFrame.Visible = true
	else
		p1.ThemeFrame.ImageLabel.Image = ""
		local v22 = p1.DataValue and v8.GetEditedColorGradient(p1.DataValue)
		if v22 then
			p1.ThemeFrame.ImageLabel.UIGradient.Color = v22
			p1.ThemeFrame.ImageLabel.UIGradient.Enabled = true
			p1.ThemeFrame.Visible = true
		else
			p1.ThemeFrame.Visible = false
		end
	end
	return p1
end
function t.SetRarity(p1) --[[ SetRarity | Line: 487 ]]
	p1.RarityFrame.BackgroundColor3 = p1.Item.Rarity.TextColor
end
function t.SetPrice(p1) --[[ SetPrice | Line: 493 | Upvalues: v5 (copy), v10 (copy) ]]
	if p1.PriceLabel and (typeof(p1.Price) == "number" or p1.GetPriceText) then
		local v1
		if p1.GetPriceText then
			v1 = p1.GetPriceText(p1)
		else
			local v3 = v5.suffix((tonumber(string.format("%d", p1.Price))))
			v1 = if p1.GuiSource == "Shop" or p1.GuiSource == "ClubShop" then v3 else ("$%*"):format(v3)
		end
		p1.PriceLabel.Text = v1
		p1.PriceLabel.Visible = true
	else
		p1.PriceLabel.Visible = false
	end
	if not p1.RobuxLabel then
		return
	end
	if p1.ProductId then
		local v52 = v10.GetProductInfo(p1.ProductId, Enum.InfoType.Product)
		p1.RobuxLabel.Text = "\238\128\130" .. (if v52 then v52.PriceInRobux or "N/A" else "N/A")
		p1.RobuxLabel.Visible = true
	else
		p1.RobuxLabel.Visible = false
	end
end
function t.SetVisible(p1, p2) --[[ SetVisible | Line: 532 ]]
	p1.Frame.Visible = p2
end
function t.SetBackgroundColor(p1, p2) --[[ SetBackgroundColor | Line: 536 | Upvalues: t2 (copy) ]]
	if p1.IgnoreBackgroundColor then
		return
	end
	p1.Frame.BackgroundColor3 = if p2 then p2 else not p1.IgnoreBackgroundColor and p1.HotbarEquipped and t2.Equipped or t2.Default
end
function t.SetHotbarEquipped(p1) --[[ SetHotbarEquipped | Line: 543 | Upvalues: v6 (copy), v13 (copy) ]]
	local v1 = v6:IsItemOnHotbar(v13, p1.Item.Name)
	p1.HotbarEquipped = v1 and true
	if p1.HotbarLabel then
		p1.HotbarLabel.Text = if v1 then "(" .. v1.Name .. ")" or "" else ""
		p1.HotbarLabel.Visible = #p1.HotbarLabel.Text > 0
	end
	p1:SetBackgroundColor()
end
function t.SetLayoutOrder(p1, p2) --[[ SetLayoutOrder | Line: 556 ]]
	p1.Frame.LayoutOrder = p2
end
function t.Select(p1) --[[ Select | Line: 560 ]]
	if not p1.SelectedGradient then
		return
	end
	p1.SelectedGradient.Enabled = true
end
function t.Deselect(p1) --[[ Deselect | Line: 566 ]]
	if not p1.SelectedGradient then
		return
	end
	p1.SelectedGradient.Enabled = false
end
function t.SetViewport(p1) --[[ SetViewport | Line: 572 | Upvalues: v9 (copy) ]]
	p1.Maid:GiveTask(v9:Create({
		Viewport = p1.ViewportFrame,
		Item = p1.Item
	}))
end
function t.SetAmountOwned(p1) --[[ SetAmountOwned | Line: 579 | Upvalues: v5 (copy) ]]
	p1.OwnedLabel.Text = p1.GetAmountText and p1.GetAmountText(p1) or "x" .. v5.suffix(p1:_getAmount())
	if p1.NoneOwnedLabel then
		p1.NoneOwnedLabel.Visible = not p1:_checkAmount()
	end
	if not p1.AmountColors then
		return
	end
	p1.OwnedLabel.TextColor3 = p1:_checkAmount() and p1.AmountColors.Default or p1.AmountColors.None
	if not p1.ColorNameLabel then
		return
	end
	p1.NameLabel.TextColor3 = p1:_checkAmount() and p1.AmountColors.Default or p1.AmountColors.None
end
function t.SetAmount(p1) --[[ SetAmount | Line: 592 | Upvalues: v5 (copy) ]]
	p1.AmountLabel.Text = p1.GetAmountText and p1.GetAmountText(p1) or "x" .. v5.suffix(p1:_getAmount())
	if not p1.AmountColors then
		return
	end
	p1.AmountLabel.TextColor3 = p1:_checkAmount() and p1.AmountColors.Default or p1.AmountColors.None
end
function t.SetName(p1) --[[ SetName | Line: 599 | Upvalues: v4 (copy) ]]
	if not p1.Item then
		warn("No item found for", p1)
		return
	end
	local v1 = v4.GetDisplayName(p1.Item.Name, p1.Item)
	if p1.LuckPower or p1.LuckPowerValue then
		local AppendLuckPower = p1.AppendLuckPower
		v1 = v1 .. " (" .. (p1.LuckPower or p1.LuckPowerValue.Value) .. "%)"
	end
	p1.NameLabel.Text = v1
end
return t