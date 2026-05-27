-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModDashboardLoader = require(ReplicatedStorage.ModDashboardLoader)
local v1 = ModDashboardLoader("Maid")
local v2 = ModDashboardLoader("spr")
local t = {}
t.__index = t
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
function t.new(p1, p2) --[[ new | Line: 73 | Upvalues: t (copy), v1 (copy), t3 (copy), t4 (copy), t5 (copy), t6 (copy), t2 (copy), v2 (copy) ]]
	assert(p1:IsA("GuiButton"), p1:GetFullName() .. " is not a button")
	local v3 = p2 or {}
	local v5 = setmetatable({}, t)
	v5.Maid = v1.new()
	v5.Options = v3
	v5.OnHover = {}
	v5.OnLeave = {}
	v5.OnClick = {}
	v5.OnDown = {}
	v5.OnUp = {}
	v5.OnDestroy = {}
	local v6, v7
	if v3.Active == nil then
		v6 = v3
		v7 = true
	else
		v7 = v3.Active
		v6 = v3
		if not v7 then
			v7 = true
		end
	end
	p1.Active = v7
	p1.Selectable = p1.Active
	local UIScale = p1:FindFirstChildOfClass("UIScale")
	if not UIScale then
		UIScale = Instance.new("UIScale")
		UIScale.Parent = p1
	end
	v5.UIScale = UIScale
	local ClaimLabel = p1:FindFirstChild("ClaimLabel")
	if ClaimLabel then
		v5.ClaimLabel = ClaimLabel
		local TextLabel = v5.ClaimLabel:FindFirstChild("TextLabel")
		if TextLabel then
			v5.ClaimTextLabel = TextLabel
		end
	end
	v5.OriginalScale = UIScale.Scale
	v5.HoverScale = v6.HoverScale or 1
	v5.PressScale = v6.PressScale or 1
	v5.NoAnimations = v6.NoAnimations or true
	v5.NoPressAnimation = v6.NoPressAnimation or v6.NoAnimations
	v5.NoHoverAnimation = v6.NoHoverAnimation or v6.NoAnimations
	local v10 = t3[p1]
	if v10 then
		t3[p1] = nil
		table.insert(v5.OnClick, v10)
	end
	local v11 = t4[p1]
	if v11 then
		t4[p1] = nil
		table.insert(v5.OnHover, v11)
	end
	local v122 = t5[p1]
	if v122 then
		t5[p1] = nil
		table.insert(v5.OnLeave, v122)
	end
	local v13 = t6[p1]
	if v13 then
		t6[p1] = nil
		table.insert(v5.OnDestroy, v13)
	end
	if v6.OnClick then
		table.insert(v5.OnClick, v6.OnClick)
	end
	if v6.OnHover then
		table.insert(v5.OnHover, v6.OnHover)
	end
	if v6.OnLeave then
		table.insert(v5.OnLeave, v6.OnLeave)
	end
	if v6.OnDown then
		table.insert(v5.OnDown, v6.OnDown)
	end
	if v6.OnUp then
		table.insert(v5.OnUp, v6.OnUp)
	end
	if v6.OnDestroy then
		table.insert(v5.OnDestroy, v6.OnDestroy)
	end
	v5.Button = p1
	t2[p1] = v5
	v5.Maid:GiveTask(p1.Destroying:Connect(function() --[[ Line: 172 | Upvalues: v5 (copy) ]]
		v5:Destroy()
	end))
	v5.Maid:GiveTask(p1:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 176 | Upvalues: p1 (copy), v2 (ref), UIScale (ref), v5 (copy) ]]
		if p1.GuiState == Enum.GuiState.Idle then
			v2.target(UIScale, 0.65, 4, {
				Scale = v5.OriginalScale
			})
			return
		end
		if p1.GuiState == Enum.GuiState.Hover then
			if v5.NoHoverAnimation then
				v2.target(UIScale, 0.65, 4, {
					Scale = v5.OriginalScale
				})
			else
				v2.target(UIScale, 0.65, 4, {
					Scale = v5.HoverScale
				})
			end
		else
			if p1.GuiState ~= Enum.GuiState.Press then
				return
			end
			if v5.NoPressAnimation then
				v2.target(UIScale, 0.65, 4, {
					Scale = v5.OriginalScale
				})
				return
			end
			v2.target(UIScale, 0.65, 4, {
				Scale = v5.PressScale
			})
		end
	end))
	v5.Maid:GiveTask(p1.MouseEnter:Connect(function() --[[ Line: 196 | Upvalues: v5 (copy) ]]
		if not v5:_isActive() then
			return
		end
		v5.Hovering = true
		for v1, v2 in v5.OnHover do
			task.spawn(v2)
		end
	end))
	v5.Maid:GiveTask(p1.MouseLeave:Connect(function() --[[ Line: 204 | Upvalues: v5 (copy) ]]
		v5.Hovering = false
		for v1, v2 in v5.OnLeave do
			task.spawn(v2)
		end
	end))
	v5.Maid:GiveTask(p1.MouseButton1Click:Connect(function() --[[ Line: 211 | Upvalues: v5 (copy) ]]
		if not v5:_isActive() then
			return
		end
		for v1, v2 in v5.OnClick do
			v2()
		end
	end))
	v5.Maid:GiveTask(p1.MouseButton1Down:Connect(function() --[[ Line: 218 | Upvalues: v5 (copy) ]]
		if not v5:_isActive() then
			return
		end
		for v1, v2 in v5.OnDown do
			v2()
		end
	end))
	v5.Maid:GiveTask(p1.MouseButton1Up:Connect(function() --[[ Line: 225 | Upvalues: v5 (copy) ]]
		if not v5:_isActive() then
			return
		end
		for v1, v2 in v5.OnUp do
			v2()
		end
	end))
	return v5
end
function t._isActive(p1) --[[ _isActive | Line: 236 ]]
	if p1.Active == nil then
		return true
	else
		return p1.Active
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 242 | Upvalues: t2 (copy), t3 (copy), t4 (copy), t5 (copy), t6 (copy) ]]
	if p1.Destroyed then
		return
	end
	p1.Destroyed = true
	for v1, v2 in p1.OnDestroy do
		v2()
	end
	t2[p1.Button] = nil
	t3[p1.Button] = nil
	t4[p1.Button] = nil
	t5[p1.Button] = nil
	t6[p1.Button] = nil
	p1.Maid:Destroy()
end
function t._getButtonFromInstance(p1, p2) --[[ _getButtonFromInstance | Line: 260 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.IsButton(p1, p2) --[[ IsButton | Line: 265 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.RegisterClick(p1, p2, p3) --[[ RegisterClick | Line: 270 | Upvalues: t3 (copy) ]]
	assert(if typeof(p3) == "function" then true else false, "Callback must be a function")
	local v2 = p1:_getButtonFromInstance(p2)
	assert(v2, p2:GetFullName() .. " is not a button object")
	if v2 then
		table.insert(v2.OnClick, p3)
	else
		t3[p2] = p3
	end
end
function t.RegisterHover(p1, p2, p3) --[[ RegisterHover | Line: 283 | Upvalues: t4 (copy) ]]
	assert(if typeof(p3) == "function" then true else false, "Callback must be a function")
	local v2 = p1:_getButtonFromInstance(p2)
	assert(v2, p2:GetFullName() .. " is not a button object")
	if v2 then
		table.insert(v2.OnHover, p3)
	else
		t4[p2] = p3
	end
end
function t.RegisterLeave(p1, p2, p3) --[[ RegisterLeave | Line: 296 | Upvalues: t5 (copy) ]]
	assert(if typeof(p3) == "function" then true else false, "Callback must be a function")
	local v2 = p1:_getButtonFromInstance(p2)
	assert(v2, p2:GetFullName() .. " is not a button object")
	if v2 then
		table.insert(v2.OnLeave, p3)
	else
		t5[p2] = p3
	end
end
function t.RegisterDestroy(p1, p2, p3) --[[ RegisterDestroy | Line: 309 | Upvalues: t6 (copy) ]]
	assert(if typeof(p3) == "function" then true else false, "Callback must be a function")
	local v2 = p1:_getButtonFromInstance(p2)
	assert(v2, p2:GetFullName() .. " is not a button object")
	if v2 then
		table.insert(v2.OnDestroy, p3)
	else
		t6[p2] = p3
	end
end
function t.SetActive(p1, p2, p3) --[[ SetActive | Line: 323 ]]
	local v1 = p1:_getButtonFromInstance(p2)
	assert(v1, p2:GetFullName() .. " is not a button object")
	v1.Active = p3
	v1.Button.Active = p3
end
return t