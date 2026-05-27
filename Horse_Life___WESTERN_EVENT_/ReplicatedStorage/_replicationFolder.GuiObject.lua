-- https://lua.expert/
local t = {
	SubContexts = { "Display", "InteractionOverlay" }
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("EventUtils")
local v5 = Sonar("safePrint")
local v6 = Sonar("InputTypeService")
function t.new(p1) --[[ new | Line: 17 | Upvalues: t (copy), v1 (copy), v3 (copy), v5 (copy), v6 (copy), v4 (copy) ]]
	local v2 = setmetatable(p1, t)
	v2.Maid = v1.new()
	v2.Context = p1
	v2.Config = p1
	if not v2.Parent then
		v2.Parent = v2.Instance and v2.Instance.Parent
	end
	if not v2.Instance then
		local v42 = type(v2.Template) == "string" and v3.FindElement(v2.Parent, v2.Template) or (v2.Template or v3.FindElement(v2.Parent, "DefaultTemplate"))
		if v42 then
			v2.Instance = v3.CloneTemplate(v42)
			v2.Instance.Visible = false
			v42.Visible = false
			v2.CreatedFromTemplate = true
			if not v2.Parent then
				v2.Parent = v42.Parent
			end
		end
	end
	if not v2.Instance then
		v5("\226\154\160\239\184\143 GuiObject, No instance found for", v2.Name, v2.Parent:GetFullName(), p1)
		return v2
	end
	local v52 = v3.GetComponentConfig(p1, "Button")
	v2.ButtonInstance = v2.Instance.ClassName:find("Button") and v2.Instance or v3.FindElement(v2.Instance, "Button")
	if v2.ButtonInstance then
		v52.Instance = v2.ButtonInstance
		v2.ButtonActions = {}
		for v7, v8 in { "OnClick", "OnHover", "OnHoverLeave", "OnDown", "OnUp" } do
			v2.ButtonActions[v8] = v52[v8]
			v52[v8] = function() --[[ Line: 65 | Upvalues: v2 (copy), v8 (copy) ]]
				if not v2.ButtonActions[v8] then
					return
				end
				if v2.InteractionOverlay and v2.InteractionOverlay:ShouldBlockAction({
					Notify = true,
					Action = v8
				}) then
					return
				end
				if not v2.ButtonActions[v8] then
					return
				end
				v2.ButtonActions[v8](v2)
			end
		end
		v2.Button = v3.AddComponent("Button", v52)
		v2.Maid:GiveTask(v2.Button)
	elseif v52.OnClick then
		warn("\226\154\160\239\184\143 GuiObject, Tried making a button but instance was not a button", v2.Instance.ClassName, v52)
	end
	if v2.Config.InputType then
		v2.Maid:GiveTask(v6.GetInputTypeChangedSignal():Connect(function(p1) --[[ Line: 95 | Upvalues: v2 (copy) ]]
			v2:_updateInputType(p1)
		end))
		v2:_updateInputType()
	end
	v2.SelectedInstances = v2.Button and v2.Button.SelectedInstances or v3.FindElement(v2.Instance, "Selected", {
		GetAllDescendants = true
	})
	if v2.Config.OnCreate then
		v2.Config.OnCreate(v2)
	end
	if v2.DisplayType then
		v2.Display = v3.AddComponent(v2.DisplayType, v2)
		v2.Maid:GiveTask(v2.Display)
	end
	if v2.Config.OnCreated then
		v2.Config.OnCreated(v2)
	end
	if v2.Config.InteractionOverlay then
		v2.InteractionOverlay = v3.AddComponent("InteractionOverlay", v2)
		v2.Maid:GiveTask(v2.InteractionOverlay)
	end
	v2.AddOnComponents = v3.AddOnComponents("GuiObject", v2)
	if v2.Config.Changed then
		v2.Changed = v4.getConnectionEvents(v2.Config.Changed, v2)
		for v10, v11 in v2.Changed do
			v2.Maid:GiveTask(v11:Connect(function() --[[ Line: 132 | Upvalues: v2 (copy) ]]
				v2:Update()
			end))
		end
	end
	v2:Update(true)
	if v2.Config.VisibilityChanged then
		v2.VisibilityChanged = v4.getConnectionEvents(v2.Config.VisibilityChanged, v2)
		for v122, v13 in v2.VisibilityChanged do
			v2.Maid:GiveTask(v13:Connect(function() --[[ Line: 142 | Upvalues: v2 (copy) ]]
				v2:SetVisible(true)
			end))
		end
	end
	if not v2.DoNotSetVisibility then
		v2:SetVisible(true, {
			DoNotUpdateLayoutSort = true
		})
	end
	if v2.Config.LayoutOrderChanged then
		v2.LayoutOrderChanged = v4.getConnectionEvents(v2.Config.LayoutOrderChanged, v2)
		for v14, v15 in v2.LayoutOrderChanged do
			v2.Maid:GiveTask(v15:Connect(function() --[[ Line: 156 | Upvalues: v2 (copy) ]]
				v2:SetLayoutOrder()
			end))
		end
	end
	v2:SetLayoutOrder()
	v2:SetZIndex()
	v2:Deselect()
	if v2.CreatedFromTemplate then
		v2.Instance.Name = v2.Name or v2.Instance.Name
	end
	if not v2.Instance.Parent then
		v2.Instance.Parent = v2.Parent
		v2.Maid:GiveTask(v2.Instance)
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 179 | Upvalues: v2 (copy) ]]
	if p1.Config.OnDestroy then
		p1.Config.OnDestroy(p1)
	end
	if p1.Config.ResetOnDestroy then
		p1:Reset()
	end
	v2(p1)
end
function t.GiveTask(p1, ...) --[[ GiveTask | Line: 189 ]]
	return p1.Maid:GiveTask(...)
end
function t.RegisterButtonAction(p1, p2, p3) --[[ RegisterButtonAction | Line: 193 ]]
	if not p1.Button then
		return
	end
	p1.Button:RegisterAction(p1.Button.Instance, p2, p3)
end
function t.Update(p1, p2) --[[ Update | Line: 199 ]]
	if p1.Config.OnUpdated then
		p1.Config.OnUpdated(p1)
	end
	if p2 then
		return
	end
	p1:SetVisible(true)
	p1:SetLayoutOrder()
end
function t.SetVisible(p1, p2, p3) --[[ SetVisible | Line: 210 ]]
	if not (if p3 then p3 else {}).DoNotUpdateLayoutSort then
		p1.VisibleFromLayoutSort = p2
	end
	if p1.VisibleFromLayoutSort ~= nil then
		p2 = p1.VisibleFromLayoutSort
	end
	if p1.Config.Visibility and not p1.Config.Visibility(p1) then
		p2 = false
	end
	p1.Instance.Visible = p2
end
function t.IsVisible(p1) --[[ IsVisible | Line: 231 ]]
	return p1.Instance.Visible
end
function t._getLayoutOrder(p1) --[[ _getLayoutOrder | Line: 235 ]]
	if type(p1.Config.LayoutOrder) == "function" then
		return p1.Config.LayoutOrder(p1)
	end
	if type(p1.Config.LayoutOrder) == "number" then
		return p1.Config.LayoutOrder
	else
		return nil
	end
end
function t.SetLayoutOrder(p1, p2) --[[ SetLayoutOrder | Line: 245 ]]
	local v1 = if p2 then p2 else p1:_getLayoutOrder()
	if v1 then
		p1.Instance.LayoutOrder = v1
	end
end
function t.SetZIndex(p1, p2) --[[ SetZIndex | Line: 254 ]]
	p1.Instance.ZIndex = if p2 then p2 else p1.Config.ZIndex or p1.Instance.ZIndex
end
function t._setSelected(p1, p2) --[[ _setSelected | Line: 258 ]]
	if p1.Button then
		if p2 then
			p1.Button:Select()
		else
			p1.Button:Deselect()
		end
	else
		for v1, v2 in p1.SelectedInstances do
			if v2:IsA("GuiObject") then
				v2.Visible = p2
				continue
			end
			v2.Enabled = p2
		end
	end
end
function t._updateInputType(p1) --[[ _updateInputType | Line: 276 | Upvalues: v6 (copy) ]]
	p1.IsInputType = table.find(type(p1.Config.InputType) == "string" and { p1.Config.InputType } or p1.Config.InputType, v6.GetInputType())
end
function t.Select(p1) --[[ Select | Line: 281 ]]
	p1.Selected = true
	p1:_setSelected(true)
	if not p1.Config.OnSelected then
		return
	end
	p1.Config.OnSelected(p1)
end
function t.Deselect(p1) --[[ Deselect | Line: 290 ]]
	p1.Selected = false
	p1:_setSelected(false)
	if not p1.Config.OnDeselected then
		return
	end
	p1.Config.OnDeselected(p1)
end
function t.Reset(p1) --[[ Reset | Line: 299 ]]
	p1:Deselect()
	if p1.Display and p1.Display.Reset then
		p1.Display:Reset()
	end
	if not (p1.Overlay and p1.Overlay.Reset) then
		return
	end
	p1.Overlay:Reset()
end
return t