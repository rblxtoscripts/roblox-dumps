-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("InputTypeDetector")
local t = {}
t.__index = t
local TweenService = game:GetService("TweenService")
local v3 = TweenInfo.new(0.275, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v4 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local ClickSound = script:WaitForChild("ClickSound")
local HoverSound = script:WaitForChild("HoverSound")
local WorkspaceGuiClasses = Sonar("Constants").WorkspaceGuiClasses
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
local function getDescendantOfWorkspaceGui(p1) --[[ getDescendantOfWorkspaceGui | Line: 26 | Upvalues: WorkspaceGuiClasses (copy) ]]
	for k, v in pairs(WorkspaceGuiClasses) do
		local v1 = p1:FindFirstAncestorOfClass(k)
		if v1 then
			return v1
		end
	end
end
local function darkenColor(p1, p2) --[[ darkenColor | Line: 35 ]]
	local v1 = p2 or 0.8
	return Color3.new(math.max(0, p1.r * v1), math.max(0, p1.g * v1), (math.max(0, p1.b * v1)))
end
function t.new(p1, p2) --[[ new | Line: 44 | Upvalues: v1 (copy), ClickSound (copy), HoverSound (copy), getDescendantOfWorkspaceGui (copy), t3 (copy), t4 (copy), t5 (copy), t6 (copy), t7 (copy), TweenService (copy), v3 (copy), v4 (copy), v2 (copy), t (copy), t2 (copy) ]]
	local v22 = p2 or {}
	assert(p1:IsA("GuiButton"), p1:GetFullName() .. " is not a button")
	local t8 = {
		OnHover = {},
		OnLeave = {},
		OnClick = {},
		OnDown = {},
		OnUp = {},
		OnEnded = {},
		OnDestroy = {}
	}
	for v5, v6 in t8 do
		local v8 = typeof(v22[v5])
		if v8 == "function" or v8 == "table" then
			if v8 == "table" then
				for v9, v10 in v22[v5] do
					if typeof(v10) == "function" then
						table.insert(v6, v10)
					end
				end
				continue
			end
			table.insert(v6, v22[v5])
		end
	end
	t8.Maid = v1.new()
	t8.Sound = v22.Sound or (if v22.Sound == false then false else ClickSound)
	t8.HoverSound = v22.HoverSound or (if v22.HoverSound == false then false else HoverSound)
	t8.DescendantOfWorkspaceGui = getDescendantOfWorkspaceGui(p1)
	t8.HoverLabel = v22.HoverLabel
	if v22.Click then
		table.insert(t8.OnClick, v22.Click)
	end
	p1.Active = true
	local v14 = t3[p1]
	if v14 then
		t3[p1] = nil
		table.insert(t8.OnClick, v14)
	end
	local v15 = t4[p1]
	if v15 then
		t4[p1] = nil
		table.insert(t8.OnDown, v15)
	end
	local v16 = t5[p1]
	if v16 then
		t5[p1] = nil
		table.insert(t8.OnHover, v16)
	end
	local v17 = t6[p1]
	if v17 then
		t6[p1] = nil
		table.insert(t8.OnLeave, v17)
	end
	local v18 = t7[p1]
	if v18 then
		t7[p1] = nil
		table.insert(t8.OnDestroy, v18)
	end
	t8.Button = p1
	if t8.DescendantOfWorkspaceGui then
		p1.Selectable = false
	else
		p1.Selectable = if v22.Selectable == nil then true else v22.Selectable
	end
	local v20 = v22.HoverUpLabel or p1:FindFirstChild("HoverUpLabel")
	if v20 and not v22.ExcludeHoverUp then
		t8.DownPosition = v20.Position
		t8.UpTween = TweenService:Create(v20, v3, {
			Position = UDim2.new(v20.Position.X.Scale, 0, v20.Position.Y.Scale - (v22.HoverUpPosition or 0.09))
		})
		t8.DownTween = TweenService:Create(v20, v4, {
			Position = v20.Position
		})
	end
	t8.HoverBackgroundLabel = v22.HoverBackgroundLabel or p1
	t8.OriginalColor = t8.HoverBackgroundLabel:IsA("ImageButton") and t8.HoverBackgroundLabel.ImageColor3
	local OriginalColor = t8.OriginalColor
	local v222 = 0.8
	t8.HoverColor = Color3.new(math.max(0, OriginalColor.r * v222), math.max(0, OriginalColor.g * v222), (math.max(0, OriginalColor.b * v222)))
	local UpperShadowLabel
	if t8.HoverBackgroundLabel:IsA("ImageButton") or t8.HoverBackgroundLabel:IsA("ImageLabel") then
		UpperShadowLabel = Instance.new("ImageLabel")
		UpperShadowLabel.Name = "UpperShadowLabel"
		UpperShadowLabel.Image = t8.HoverBackgroundLabel.Image
		t8.Maid:GiveTask(t8.HoverBackgroundLabel:GetPropertyChangedSignal("Image"):Connect(function() --[[ Line: 146 | Upvalues: UpperShadowLabel (ref), t8 (copy) ]]
			UpperShadowLabel.Image = t8.HoverBackgroundLabel.Image
		end))
		UpperShadowLabel.ImageTransparency = 0.55
		UpperShadowLabel.BackgroundTransparency = 1
		UpperShadowLabel:ClearAllChildren()
		if t8.HoverBackgroundLabel:FindFirstChildWhichIsA("UICorner") then
			local v29 = t8.HoverBackgroundLabel.UICorner:Clone()
			v29.Parent = UpperShadowLabel
			t8.Maid:GiveTask(v29)
		end
		UpperShadowLabel.ScaleType = t8.HoverBackgroundLabel.ScaleType
		UpperShadowLabel.SliceCenter = t8.HoverBackgroundLabel.SliceCenter
		UpperShadowLabel.SliceScale = t8.HoverBackgroundLabel.SliceScale
		UpperShadowLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
		UpperShadowLabel.ZIndex = t8.HoverBackgroundLabel.ZIndex + 2
		UpperShadowLabel.Size = v22.ShadowLabelSize or UDim2.new(1, 0, 1, 0)
		UpperShadowLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		UpperShadowLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		UpperShadowLabel.Visible = false
		UpperShadowLabel.Active = false
		UpperShadowLabel.Selectable = false
		UpperShadowLabel.Parent = t8.HoverBackgroundLabel
		t8.ShadowLabel = UpperShadowLabel
		t8.Maid:GiveTask(UpperShadowLabel)
	else
		UpperShadowLabel = nil
	end
	t8.Maid:GiveTask(p1.MouseEnter:Connect(function() --[[ Line: 173 | Upvalues: t8 (copy), v22 (ref), UpperShadowLabel (ref), v2 (ref) ]]
		if not t8:_isActive() then
			return
		end
		t8.Hovering = true
		if t8.OriginalColor and not v22.NoHoverColor then
			t8.HoverBackgroundLabel.ImageColor3 = t8.HoverColor
		end
		if UpperShadowLabel then
			UpperShadowLabel.Visible = not v22.NoHoverShadowLabel
		end
		if t8.HoverLabel then
			t8.HoverLabel.Visible = true
		end
		if t8.HoverSound then
			t8.HoverSound:Play()
		end
		if t8.UpTween then
			t8.UpTween:Play()
		end
		for k, v in pairs(t8.OnHover) do
			local v1 = task.spawn
			v1(v, v2.GetInputType() ~= 1)
		end
	end))
	t8.Maid:GiveTask(p1.SelectionGained:Connect(function() --[[ Line: 202 | Upvalues: t8 (copy), v2 (ref), v22 (ref), UpperShadowLabel (ref) ]]
		if not t8:_isActive() then
			return
		end
		if not v2.IsGamepadInputType() then
			return
		end
		t8.Hovering = true
		if t8.OriginalColor and not v22.NoHoverColor then
			t8.HoverBackgroundLabel.ImageColor3 = t8.HoverColor
		end
		if UpperShadowLabel then
			UpperShadowLabel.Visible = not v22.NoHoverShadowLabel
		end
		if t8.HoverLabel then
			t8.HoverLabel.Visible = true
		end
		if t8.HoverSound then
			t8.HoverSound:Play()
		end
		if t8.UpTween then
			t8.UpTween:Play()
		end
		for k, v in pairs(t8.OnHover) do
			local v1 = task.spawn
			v1(v, v2.GetInputType() ~= 1)
		end
	end))
	t8.Maid:GiveTask(p1.SelectionLost:Connect(function() --[[ Line: 232 | Upvalues: v2 (ref), t8 (copy), v22 (ref), UpperShadowLabel (ref) ]]
		if not v2.IsGamepadInputType() then
			return
		end
		t8.Hovering = false
		if t8.OriginalColor and not v22.NoHoverColor then
			t8.HoverBackgroundLabel.ImageColor3 = t8.OriginalColor
		end
		if UpperShadowLabel then
			UpperShadowLabel.Visible = false
		end
		if t8.HoverLabel then
			t8.HoverLabel.Visible = false
		end
		if t8.DownTween then
			t8.DownTween:Play()
		end
		for k, v in pairs(t8.OnLeave) do
			task.spawn(v)
		end
	end))
	t8.Maid:GiveTask(p1.MouseLeave:Connect(function() --[[ Line: 257 | Upvalues: t8 (copy), v22 (ref), UpperShadowLabel (ref) ]]
		t8.Hovering = false
		if t8.OriginalColor and not v22.NoHoverColor then
			t8.HoverBackgroundLabel.ImageColor3 = t8.OriginalColor
		end
		if UpperShadowLabel then
			UpperShadowLabel.Visible = false
		end
		if t8.HoverLabel then
			t8.HoverLabel.Visible = false
		end
		if t8.DownTween then
			t8.DownTween:Play()
		end
		for k, v in pairs(t8.OnLeave) do
			task.spawn(v)
		end
	end))
	t8.Maid:GiveTask(p1.MouseButton1Click:Connect(function() --[[ Line: 279 | Upvalues: t8 (copy) ]]
		if not t8:_isActive() then
			return
		end
		for k, v in pairs(t8.OnClick) do
			v()
		end
	end))
	t8.Maid:GiveTask(p1.MouseButton1Click:Connect(function() --[[ Line: 287 | Upvalues: t8 (copy) ]]
		if not t8:_isActive() then
			return
		end
		if t8.Sound then
			t8.Sound:Play()
		end
	end))
	t8.Maid:GiveTask(p1.MouseButton1Down:Connect(function() --[[ Line: 294 | Upvalues: t8 (copy) ]]
		for k, v in pairs(t8.OnDown) do
			v()
		end
	end))
	t8.Maid:GiveTask(p1.MouseButton1Up:Connect(function() --[[ Line: 300 | Upvalues: t8 (copy) ]]
		for k, v in pairs(t8.OnUp) do
			v()
		end
	end))
	t8.Maid:GiveTask(p1.InputEnded:Connect(function() --[[ Line: 306 | Upvalues: t8 (copy) ]]
		for k, v in pairs(t8.OnEnded) do
			v()
		end
	end))
	t8.Maid:GiveTask(p1.Activated:Connect(function() --[[ Line: 312 ]] end))
	local v322 = setmetatable(t8, t)
	t2[p1] = v322
	return v322
end
function t.Destroy(p1) --[[ Destroy | Line: 323 | Upvalues: t2 (copy) ]]
	p1.ShowTip = nil
	for k, v in pairs(p1.OnDestroy) do
		v()
	end
	if p1.HoverMaid and p1.HoverMaid.Destroy then
		p1.HoverMaid:Destroy()
	end
	t2[p1.Button] = nil
	p1.Maid:Destroy()
end
function t._isActive(p1) --[[ _isActive | Line: 338 ]]
	if p1.Active == nil then
		return true
	else
		return p1.Active
	end
end
function t._getButtonFromInstance(p1, p2) --[[ _getButtonFromInstance | Line: 344 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.IsButton(p1, p2) --[[ IsButton | Line: 348 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.RegisterClick(p1, p2, p3) --[[ RegisterClick | Line: 352 | Upvalues: t3 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnClick, p3)
	else
		t3[p2] = p3
	end
end
function t.RegisterAction(p1, p2, p3, p4) --[[ RegisterAction | Line: 363 ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if not v1 then
		return
	end
	table.insert(v1[p3], p4)
end
function t.RegisterHover(p1, p2, p3) --[[ RegisterHover | Line: 372 | Upvalues: t5 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnHover, p3)
	else
		t5[p2] = p3
	end
end
function t.RegisterLeave(p1, p2, p3) --[[ RegisterLeave | Line: 383 | Upvalues: t6 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnLeave, p3)
	else
		t6[p2] = p3
	end
end
function t.RegisterDestroy(p1, p2, p3) --[[ RegisterDestroy | Line: 394 | Upvalues: t7 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnDestroy, p3)
	else
		t7[p2] = p3
	end
end
return t