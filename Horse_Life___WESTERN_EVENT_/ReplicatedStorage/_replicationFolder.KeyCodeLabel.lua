-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService", {
	Deferred = true
})
local v2 = Sonar("CharacterControls")
local v3 = Sonar("InputTypeService")
local v4 = Sonar("Maid")
local v5 = Sonar("safeDestroy")
local t = {}
t.__index = t
local t2 = {}
function t.new(p1) --[[ new | Line: 132 | Upvalues: t (copy), v4 (copy), v1 (copy), v3 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v4.new()
	v2.SpriteSheet = p1.SpriteSheet or "Dark"
	v2.Instance = p1.Instance
	v2.KeyCodeLabel = v1.FindElement(v2.Instance, "KeyCodeLabel", {
		IgnoreParent = true
	}) or v2.Instance:IsA("ImageLabel") and v2.Instance
	if not v2.KeyCodeLabel then
		warn("\226\154\160\239\184\143 KeyCodeLabel, KeyCodeLabel is required for component", v2.Instance)
		return v2
	end
	v2.Inputs = p1.Inputs or {}
	for v5, v6 in { "Keyboard", "Gamepad", "Touch" } do
		if not v2.Inputs[v6] then
			v2.Inputs[v6] = v2.Instance:GetAttribute(v6)
		end
	end
	v2.InputImages = {}
	for v7, v8 in v2.Inputs do
		v2.InputImages[v7] = v2:_getKeyCodeOrImageId(v8)
	end
	if next(v2.InputImages) then
		v2.Maid:GiveTask(v3.BindToInputTypeChanged(function(p1) --[[ Line: 165 | Upvalues: v2 (copy) ]]
			v2:Update(p1)
		end))
		t2[v2.KeyCodeLabel] = v2
		return v2
	end
	if v2.Instance == v2.KeyCodeLabel.Parent then
		v2.Instance.Visible = false
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 174 | Upvalues: t2 (copy), v5 (copy) ]]
	t2[p1.KeyCodeLabel] = nil
	v5(p1)
end
function t.Get(p1) --[[ Get | Line: 179 | Upvalues: v1 (copy), t2 (copy) ]]
	local v12 = v1.FindElement(p1, "KeyCodeLabel")
	return if v12 then t2[v12] else v12
end
function t.GetFromInstance(p1) --[[ GetFromInstance | Line: 184 | Upvalues: t (copy) ]]
	return t.Get(p1)
end
function t.Update(p1, p2) --[[ Update | Line: 188 | Upvalues: v3 (copy) ]]
	local v1 = p1.InputImages[p2]
	if v1 and typeof(v1) == "EnumItem" then
		v3.UpdateInputImage(v1, p1.KeyCodeLabel, p2, p1.SpriteSheet)
		p1.KeyCodeLabel.Visible = true
		if p1.Instance == p1.KeyCodeLabel.Parent then
			p1.Instance.Visible = true
		end
	elseif v1 and typeof(v1) == "string" then
		p1.KeyCodeLabel.Image = v1
		p1.KeyCodeLabel.ImageRectOffset = Vector2.new(0, 0)
		p1.KeyCodeLabel.ImageRectSize = Vector2.new(0, 0)
		p1.KeyCodeLabel.Visible = true
		if p1.Instance == p1.KeyCodeLabel.Parent then
			p1.Instance.Visible = true
		end
	else
		p1.KeyCodeLabel.Visible = false
		if p1.Instance ~= p1.KeyCodeLabel.Parent then
			return
		end
		p1.Instance.Visible = false
	end
end
function t.GetKeyCodes(p1) --[[ GetKeyCodes | Line: 222 ]]
	local t = {}
	for v1, v2 in p1.InputImages do
		if typeof(v2) == "EnumItem" then
			table.insert(t, v2)
		end
	end
	return t
end
function t.BindToControls(p1, p2, p3, p4, ...) --[[ BindToControls | Line: 235 | Upvalues: v2 (copy) ]]
	if next((p1:GetKeyCodes())) then
		v2:AddControls(p2, p1:GetKeyCodes(), p3, p4, ...)
	end
end
function t._getKeyCodeOrImageId(p1, p2) --[[ _getKeyCodeOrImageId | Line: 244 ]]
	if p2 == nil or p2 == "" then
		return nil
	end
	if typeof(p2) == "EnumItem" then
		p2 = p2.Name
	end
	local v1, v2 = pcall(function() --[[ Line: 253 | Upvalues: p2 (ref) ]]
		return Enum.KeyCode[p2]
	end)
	if v1 and v2 then
		return v2
	end
	local v3, v4 = pcall(function() --[[ Line: 260 | Upvalues: p2 (ref) ]]
		return Enum.UserInputType[p2]
	end)
	if v3 and v4 then
		return v4
	end
	if string.find(p2, "rbxasset") then
		return p2
	else
		return nil
	end
end
return t