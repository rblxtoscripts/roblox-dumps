-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("FormatString")
local v5 = Sonar("EventUtils")
function t.new(p1) --[[ new | Line: 205 | Upvalues: t (copy), v2 (copy), v1 (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22._optionGuiObjects = {}
	v22.Opened = false
	v22.Enabled = true
	v22._isParentedToLayout = v22.Instance.Parent:FindFirstChildWhichIsA("UILayout")
	v22.DefaultValue = p1.DefaultValue or v22:_getValue()
	v22.DropdownButton = v1.FindElement(v22.Instance, "DropdownButton") or v22.Instance:IsA("GuiObject") and v22.Instance
	v22.SelectedFrame = v1.FindElement(v22.Instance, "SelectedFrame")
	v22.SelectedTextLabel = v1.FindElement(v22.SelectedFrame, "TextLabel") or v1.FindElement(v22.SelectedFrame, "NameLabel")
	v22.SelectedImageLabel = v1.FindElement(v22.SelectedFrame, "ImageLabel") or v1.FindElement(v22.SelectedFrame, "Viewport")
	v22._defaultOptionsFrame = v1.FindElement(v22.Instance, "DefaultTemplate")
	v22.DropdownFrame = v1.FindElement(v22.Instance, "DropdownFrame") or v22._defaultOptionsFrame and v22._defaultOptionsFrame.Parent
	v22.Maid:GiveTask(v1.AddComponent("Button", {
		Instance = v22.DropdownButton,
		OnClick = function() --[[ OnClick | Line: 236 | Upvalues: v22 (copy) ]]
			if v22.Enabled then
				v22:SetOpened(not v22.Opened)
			end
		end
	}))
	if v22._isParentedToLayout then
		v22.OriginalZIndex = v22.Instance.ZIndex
		v22.Maid:GiveTask(v22.Instance:GetPropertyChangedSignal("ZIndex"):Connect(function() --[[ Line: 246 | Upvalues: v22 (copy) ]]
			if not v22.Opened then
				v22.OriginalZIndex = v22.Instance.ZIndex
			end
		end))
	end
	for v8, v9 in { "OnChanged" } do
		v22[v9] = {}
		for v10, v11 in p1 do
			if v22[v10] and type(v22[v10]) == "table" then
				v22:AddCallback(v10, v11)
			end
		end
	end
	if v22.Config.Changed then
		v22.Changed = v5.getConnectionEvents(v22.Config.Changed)
		for v13, v14 in v22.Changed do
			v22.Maid:GiveTask(v14:Connect(function() --[[ Line: 267 | Upvalues: v22 (copy) ]]
				v22:SetValue(v22:_getValue())
			end))
		end
	end
	v22:_createOptions()
	v22:SetEnabled(true)
	v22:SetOpened(false)
	if v22.DefaultValue ~= nil then
		v22:SetValue(v22.DefaultValue)
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 285 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 289 ]]
	if not p1[p2] then
		return
	end
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1[p2] do
		v4(p1, v2)
	end
end
function t._getValue(p1) --[[ _getValue | Line: 301 ]]
	if p1.Config.GetValue then
		return p1.Config.GetValue(p1)
	else
		return p1.Value
	end
end
function t._createOptions(p1) --[[ _createOptions | Line: 308 | Upvalues: v1 (copy), v4 (copy) ]]
	for v2, v3 in p1.Config.Options do
		local v12
		local v5 = type(v3) == "table" and v3 or {
			Name = v3
		}
		v5.Name = v5.Name or v2
		local v6 = v5.Name
		local AddComponent = v1.AddComponent
		local t = {
			DoNotSetVisibility = true,
			Template = p1._defaultOptionsFrame,
			Parent = p1.DropdownFrame,
			Option = v5,
			OnCreated = function(p1) --[[ OnCreated | Line: 319 | Upvalues: v1 (ref), v4 (ref), v5 (ref) ]]
				local v12 = v1.FindElement(p1.Instance, "TextLabel") or v1.FindElement(p1.Instance, "NameLabel")
				if v12 then
					v12.Text = v4.GetDisplayName(v5)
				end
				if not v5.Image then
					return
				end
				local v2 = v1.FindElement(p1.Instance, "ImageLabel") or v1.FindElement(p1.Instance, "Viewport")
				if not (v2 and v2:IsA("ImageLabel")) then
					return
				end
				v2.Image = v5.Image
			end,
			OnClick = function(p12) --[[ OnClick | Line: 335 | Upvalues: p1 (copy), v5 (ref) ]]
				if not p1:_canSelect(v5, true) then
					return
				end
				if p1.Config.OnSelected then
					p1.Config.OnSelected(p1, v5, p12)
				else
					p1:SetValue(v5.Name)
				end
			end
		}
		v12 = if type(v2) == "number" and v2 then v2 else nil
		t.LayoutOrder = v12
		p1._optionGuiObjects[v6] = AddComponent("GuiObject", t)
	end
end
function t._getOptionFromName(p1, p2) --[[ _getOptionFromName | Line: 356 ]]
	return p1.Config.Options[p2]
end
function t._canSelect(p1, p2, p3) --[[ _canSelect | Line: 360 ]]
	if p1.Config.CanSelect then
		return p1.Config.CanSelect(p1, p2)
	else
		return true
	end
end
function t.SetOpened(p1, p2) --[[ SetOpened | Line: 372 ]]
	p1.Opened = p2
	if p1.DropdownFrame ~= p1.DropdownButton then
		p1.DropdownFrame.Visible = p2
	end
	for v2, v3 in p1._optionGuiObjects do
		local v1
		v1 = if p1.Config.HideOptionWhenSelected then if p2 then if v3.Option.Name == p1.Value then false else true else p2 else p2
		if v1 and p1.Config.CanSelect then
			v1 = p1:_canSelect(v3.Option)
		end
		v3:SetVisible(v1)
	end
	if not p1._isParentedToLayout then
		return
	end
	p1.Instance.ZIndex = p1.OriginalZIndex + (if p2 then 1000 else 0)
end
function t.SetValue(p1, p2) --[[ SetValue | Line: 399 | Upvalues: v4 (copy) ]]
	local v1 = p1.Value
	p1.Value = p2
	local v2 = p1:_getOptionFromName(p2)
	if v2 then
		if p1.SelectedTextLabel then
			p1.SelectedTextLabel.Text = v4.GetDisplayName(v2)
		end
		if p1.SelectedImageLabel and v2.Image then
			p1.SelectedImageLabel.Image = v2.Image
		end
	end
	if v1 ~= p2 then
		p1:_runCallbacks("OnChanged", v2)
	end
	p1:SetOpened(false)
end
function t.SetEnabled(p1, p2) --[[ SetEnabled | Line: 421 ]]
	p1.Enabled = p2
end
function t.IsEnabled(p1) --[[ IsEnabled | Line: 425 ]]
	return p1.Enabled
end
function t.AddCallback(p1, p2, p3) --[[ AddCallback | Line: 429 ]]
	if not p1[p2] then
		p1[p2] = {}
	end
	table.insert(p1[p2], p3)
end
function t.GetValue(p1) --[[ GetValue | Line: 436 ]]
	return p1.Value
end
return t