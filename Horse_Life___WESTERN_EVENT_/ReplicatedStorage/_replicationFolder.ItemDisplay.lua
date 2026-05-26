-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("AssetReplicationService")
local v7 = Sonar("EventUtils")
local v8 = Sonar("ItemDataProvider")
local v9 = Sonar("StorageUtils")
local v10 = Sonar("safePrint")
local v11 = v9.GetConfig("GuiFramework")()
local v12 = v1.GetComponentBehaviour("ItemDisplay")
function t.new(p1) --[[ new | Line: 24 | Upvalues: t (copy), v2 (copy), v1 (copy), v10 (copy), v8 (copy), v12 (copy), v7 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Context = p1
	v22.Config = v1.GetComponentConfig(p1)
	v22.Instance = p1.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 ItemDisplay, Instance is required for item display", v10(p1))
		return v22
	end
	v22.Instance = v1.FindElement(v22.Instance, "ItemDisplay") or v22.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 ItemDisplay, ItemDisplay instance is required for item display", v10(p1))
		return v22
	end
	v22.ItemDataProvider = v8.new(v22.Config)
	v22.Maid:GiveTask(v22.ItemDataProvider)
	v22.DataValue = v22.ItemDataProvider:GetValue("DataValue")
	local DataValue = v22.DataValue
	if DataValue then
		DataValue = tonumber(v22.DataValue.Name)
	end
	v22.IndexedDataValue = DataValue
	v22.Item = v22.ItemDataProvider:GetValue("Data")
	if not v22.Item then
		warn("\226\154\160\239\184\143 ItemDisplay, Item is required for item display", v22.Instance, v10(v22.Config))
		return v22
	end
	if v22.Config.DisplayName then
		v22.Item = table.clone(v22.Item)
		v22.Item.DisplayName = v22.Config.DisplayName
	end
	if v12.BeforeInit then
		local v5 = v12.BeforeInit(v22, v22.Item)
		if v5 then
			v22.Maid:GiveTask(v5)
		end
	end
	v22.NameLabel = v22.Config.NameLabel or v1.FindElement(v22.Instance, "NameLabel")
	v22:_setName()
	v22.ViewportInstance = v22.Config.ViewportInstance or v1.FindElement(v22.Instance, "Viewport")
	if not v22.Config.DoNotSetViewport then
		v22:_setViewport()
	end
	v22.AmountLabel = v22.AmountLabel or (v22.Config.AmountLabel or v1.FindElement(v22.Instance, "AmountLabel"))
	v22.AmountConfig = type(v22.Config.Amount) == "table" and v22.Config.Amount or {
		Value = v22.Config.Amount
	}
	if v22.AmountConfig.Changed then
		v22.AmountChanged = v7.getConnectionEvents(v22.AmountConfig.Changed, v22.Context)
		for v102, v11 in v22.AmountChanged do
			v22.Maid:GiveTask(v11:Connect(function() --[[ Line: 88 | Upvalues: v22 (copy) ]]
				v22:_setAmount()
			end))
		end
	end
	if v22.DataValue then
		v22.Maid:GiveTask(v22.DataValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 95 | Upvalues: v22 (copy) ]]
			v22:_setAmount()
		end))
	end
	v22:_setAmount()
	v22.RarityLabel = v22.RarityLabel or v22.Config.RarityLabel or v1.FindElement(v22.Instance, "RarityLabel")
	v22.RarityInstances = v1.FindElement(v22.Instance, v22.RarityLabel and v22.RarityLabel.Name or "RarityLabel", {
		GetAllDescendants = true
	})
	v22:_setRarity()
	v22.DescriptionLabel = v22.DescriptionLabel or v22.Config.DescriptionLabel or v1.FindElement(v22.Instance, "DescriptionLabel")
	v22:_setDescription()
	v22.AddOnComponents = v1.AddOnComponents("ItemDisplay", v22)
	if not v22.Config.DoNotShowToolTip then
		local t2 = {}
		t2.Instance = v22.ViewportInstance and v22.ViewportInstance.ClassName:find("Button") and v22.ViewportInstance or (v22.Instance.ClassName:find("Button") and v22.Instance or (v22.ViewportInstance or v22.Instance))
		t2.Item = v22.Item
		t2.ItemDataProvider = v22.ItemDataProvider
		t2.DataValue = v22.DataValue
		v22.Maid:GiveTask(v1.AddComponent("ToolTip", t2))
	end
	if v22.Config.CreatedFromTemplate then
		v22.Instance.Name = v22.IndexedDataValue and v22.DataValue.Name .. "_" .. v22.Item.Name or (v22.Item.Name or v22.Instance.Name)
	end
	if v12.AfterInit then
		local v20 = v12.AfterInit(v22, v22.Item)
		if v20 then
			v22.Maid:GiveTask(v20)
		end
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 141 | Upvalues: v3 (copy) ]]
	if p1.Config.OnDestroyed then
		p1.Config.OnDestroyed(p1)
	end
	v3(p1)
end
function t.GiveTask(p1, ...) --[[ GiveTask | Line: 149 ]]
	return p1.Maid:GiveTask(...)
end
function t.GetItemValue(p1, ...) --[[ GetItemValue | Line: 153 ]]
	return p1.ItemDataProvider:GetValue(...)
end
function t._setDescription(p1) --[[ _setDescription | Line: 157 | Upvalues: v4 (copy), v12 (copy) ]]
	if not p1.DescriptionLabel then
		return
	end
	local v1 = v4.GetDescription(p1.Item, p1.DataValue)
	if not v1 then
		p1.DescriptionLabel.Visible = false
		return
	end
	if v12.FormatDescription then
		v1 = v12.FormatDescription(p1, v1)
	end
	p1.DescriptionLabel.Text = v1
	p1.DescriptionLabel.Visible = true
end
function t._setName(p1) --[[ _setName | Line: 176 | Upvalues: v4 (copy) ]]
	local v1 = p1.Config.DisplayName or v4.GetDisplayName(p1.Item, p1.DataValue)
	if p1.Config.FormatName then
		if typeof(p1.Config.FormatName) == "string" then
			v1 = string.format(p1.Config.FormatName, v1)
		elseif typeof(p1.Config.FormatName) == "function" then
			v1 = p1.Config.FormatName(p1, p1.Item, v1)
		end
	end
	p1.DisplayName = v1
	if p1.NameLabel then
		p1.NameLabel.Text = v1
		p1.NameLabel.Visible = true
	end
end
function t._setRarity(p1) --[[ _setRarity | Line: 196 ]]
	if not p1.RarityInstances then
		return
	end
	for v1, v2 in p1.RarityInstances do
		if v2:IsA("TextLabel") then
			v2.Text = p1.Item.Rarity.Name
			v2.TextColor3 = p1.Item.Rarity.TextColor
		elseif v2:IsA("ImageLabel") then
			if p1.Item.Rarity.Image then
				v2.Image = p1.Item.Rarity.Image
			end
			v2.ImageColor3 = p1.Item.Rarity.ImageColor or p1.Item.Rarity.TextColor
		end
		v2.Visible = true
	end
end
function t._getAmount(p1) --[[ _getAmount | Line: 215 | Upvalues: v4 (copy) ]]
	if type(p1.AmountConfig.Value) == "function" then
		return p1.AmountConfig.Value(p1.Context, p1.DataValue)
	end
	if type(p1.AmountConfig.Value) == "number" then
		return p1.AmountConfig.Value
	end
	if not p1.DataValue then
		return nil
	end
	if v4.IsItemStackable(p1.DataValue) then
		return p1.DataValue.Value
	else
		return 1
	end
end
function t._setAmount(p1) --[[ _setAmount | Line: 231 | Upvalues: v5 (copy) ]]
	if not p1.AmountLabel then
		return
	end
	p1._Amount = p1:_getAmount()
	if not p1._Amount then
		p1.AmountLabel.Visible = false
		return
	end
	p1.AmountLabel.Text = p1.AmountConfig.Format and p1.AmountConfig.Format(p1._Amount, p1.Item) or "x" .. v5.suffix(p1._Amount)
	if p1.AmountConfig.AlwaysVisible then
		p1.AmountLabel.Visible = typeof(p1.AmountConfig.AlwaysVisible) == "function" and p1.AmountConfig.AlwaysVisible(p1._Amount) or p1.AmountConfig.AlwaysVisible
	else
		p1.AmountLabel.Visible = p1._Amount > 1
	end
end
function t._setViewport(p1) --[[ _setViewport | Line: 252 | Upvalues: v1 (copy), v6 (copy), v11 (copy) ]]
	local v12 = v1.FindElement(p1.ViewportInstance, "ViewportImage") or (p1.ViewportInstance and p1.ViewportInstance:FindFirstChild("ImageLabel") or (p1.ViewportInstance and p1.ViewportInstance:IsA("ImageLabel") and p1.ViewportInstance or (p1.Instance.ClassName:find("Image") and p1.Instance or v1.FindElement(p1.Instance, "ImageLabel"))))
	local v2 = p1.Item.ViewportFrameName and v1.FindElement(p1.ViewportInstance, p1.Item.ViewportFrameName) or (v1.FindElement(p1.ViewportInstance, "ViewportFrame") or (p1.ViewportInstance and p1.ViewportInstance:FindFirstChild("ViewportFrame") or (p1.ViewportInstance and p1.ViewportInstance:IsA("ViewportFrame") and p1.ViewportInstance or (p1.ViewportInstance or (p1.Instance:IsA("ViewportFrame") and p1.Instance or (p1.Instance.ClassName:find("Image") and p1.Instance or v12))))))
	if not (v12 or v2) then
		warn("\226\154\160\239\184\143 ItemDisplay, No image label or viewport frame found", p1.Instance)
		return
	end
	local v3 = p1.Item.Image or p1.Item.Icon
	if v3 == "" then
		v3 = nil
	end
	if p1.ViewportInstance and p1.ViewportInstance:IsA("UIGradient") then
		local v4 = p1.Item.UIGradient or p1.Item.Gradient
		if not v4 then
			warn("\226\154\160\239\184\143 ItemDisplay, Item has no UIGradient but Viewport is a UIGradient", p1.Item)
			return
		end
		local v62 = typeof(v4) == "Instance" and v4:IsA("UIGradient") and v4.Color or v4
		if v62 then
			p1.ViewportInstance.Color = v62
		end
	else
		if v3 then
			if v2 and v2 ~= v12 then
				v2.Visible = false
			end
		elseif v2 then
			local v7 = v6.Get(p1.Item.Name)
			if not v7 then
				warn("\226\154\160\239\184\143 ItemDisplay, Item has no model", p1.Item.Name)
				return
			end
			if p1.Item.OnModelCreated then
				v7 = p1.Item.OnModelCreated(v7, p1)
			end
			local t = {
				Instance = v2,
				GetCameraCFrame = p1.Item.GetViewportCameraCFrame,
				LightDirection = p1.Item.ViewportLightDirection,
				LightColor = p1.Item.ViewportLightColor,
				AmbientColor = p1.Item.ViewportAmbientColor
			}
			t.BackgroundColor = p1.Item.ViewportBackgroundColor or p1.Item.Rarity.ViewportBackgroundColor
			function t.Model() --[[ Model | Line: 318 | Upvalues: v7 (ref), p1 (copy) ]]
				v7 = v7:Clone()
				if not p1.Item.ModelPreprocessor then
					return v7
				end
				p1.Item.ModelPreprocessor(v7, p1)
				return v7
			end
			p1.ViewportDisplay = v1.AddComponent("ViewportDisplay", t)
			p1.Maid:GiveTask(p1.ViewportDisplay)
			for v10, v112 in v1.FindElement(p1.ViewportInstance, "CopyViewport", {
				GetAllDescendants = true
			}) do

			end
		end
		if v12 then
			if v3 then
				v12.Image = v3
			elseif p1.ViewportDisplay then
				v12.Image = ""
			else
				v12.Image = v11.FallbackAssetImage
			end
			v12.Visible = true
			for v122, v13 in v1.FindElement(p1.ViewportInstance, "CopyViewport", {
				GetAllDescendants = true
			}) do
				if v13:IsA("ImageLabel") then
					v13.Image = v12.Image
					v13.Visible = true
				end
			end
		end
		if not p1.ViewportInstance then
			return
		end
		p1.ViewportInstance.Visible = true
	end
end
function t.GetAmount(p1) --[[ GetAmount | Line: 367 ]]
	return p1._Amount or p1:_getAmount()
end
function t.Reset(p1) --[[ Reset | Line: 372 ]]
	for v1, v2 in {
		p1.NameLabel,
		p1.AmountLabel,
		p1.ViewportInstance,
		p1.DurabilityLabel
	} do
		if v2 then
			v2.Visible = false
		end
	end
	for v4, v5 in p1.AddOnComponents or {} do
		if v5.Reset then
			v5:Reset()
		end
	end
end
return t