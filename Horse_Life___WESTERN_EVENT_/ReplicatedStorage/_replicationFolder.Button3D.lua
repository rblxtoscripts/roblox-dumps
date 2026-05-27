-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("InputTypeDetector")
local t = {}
t.__index = t
local TweenService = game:GetService("TweenService")
local v3 = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local ClickSound = script:WaitForChild("ClickSound")
local HeavyHoverSound = script:WaitForChild("HeavyHoverSound")
local t2 = {
	Heavy = HeavyHoverSound,
	Light = script.LightHoverSound
}
local v4 = TweenInfo.new(0.275, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v5 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v6 = Sonar("Constants")
local WorkspaceGuiClasses = v6.WorkspaceGuiClasses
local v7 = Color3.fromRGB(27, 42, 53)
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
local function getDescendantOfWorkspaceGui(p1) --[[ getDescendantOfWorkspaceGui | Line: 34 | Upvalues: WorkspaceGuiClasses (copy) ]]
	for k, v in pairs(WorkspaceGuiClasses) do
		local v1 = p1:FindFirstAncestorOfClass(k)
		if v1 then
			return v1
		end
	end
end
local function darkenColor(p1, p2) --[[ darkenColor | Line: 43 ]]
	local v1 = p2 or 0.8
	return Color3.new(math.max(0, p1.r * v1), math.max(0, p1.g * v1), (math.max(0, p1.b * v1)))
end
function t.new(p1, p2) --[[ new | Line: 52 | Upvalues: v1 (copy), ClickSound (copy), t2 (copy), HeavyHoverSound (copy), getDescendantOfWorkspaceGui (copy), t4 (copy), t5 (copy), t6 (copy), t7 (copy), TweenService (copy), v3 (copy), v4 (copy), v5 (copy), v7 (copy), v2 (copy), v6 (copy), t (copy), t3 (copy) ]]
	local v12 = p2 or {}
	assert(p1:IsA("GuiButton"), p1:GetFullName() .. " is not a button")
	local t8 = {
		Maid = v1.new(),
		OnHover = {},
		OnLeave = {},
		OnClick = {},
		OnDestroy = {}
	}
	if v12.Click then
		table.insert(t8.OnClick, v12.Click)
	end
	local v42 = v12
	t8.Sound = v42.Sound or (if v42.Sound == false then false else ClickSound)
	t8.HoverSound = v42.HoverSound and (type(v42.HoverSound) == "string" and t2[v42.HoverSound] or v42.HoverSound) or (if v42.HoverSound == false then false else HeavyHoverSound)
	t8.DescendantOfWorkspaceGui = getDescendantOfWorkspaceGui(p1)
	local v72 = t4[p1]
	if v72 then
		t4[p1] = nil
		table.insert(t8.OnClick, v72)
	end
	local v8 = t5[p1]
	if v8 then
		t5[p1] = nil
		table.insert(t8.OnHover, v8)
	end
	local v9 = t6[p1]
	if v9 then
		t6[p1] = nil
		table.insert(t8.OnLeave, v9)
	end
	local v10 = t7[p1]
	if v10 then
		t7[p1] = nil
		table.insert(t8.OnDestroy, v10)
	end
	t8.Button = p1
	p1.Selectable = false
	p1.Active = false
	local v11 = p1:FindFirstChild("UpperLabel") or p1:FindFirstChild("Top")
	if t8.DescendantOfWorkspaceGui then
		v11.Selectable = false
	else
		v11.Selectable = v42.Selectable ~= nil and v42.Selectable or true
	end
	v11.Active = true
	t8.Active = true
	local v13 = v11:IsA("ImageButton") and v11.ImageColor3
	local v14 = 0.8
	t8.HoverColor = Color3.new(math.max(0, v13.r * v14), math.max(0, v13.g * v14), (math.max(0, v13.b * v14)))
	if not v11:GetAttribute("OriginalPosition") then
		v11:SetAttribute("OriginalPosition", v11.Position)
	end
	v11.Position = v11:GetAttribute("OriginalPosition")
	local v21 = TweenService:Create(v11, v3, {
		Position = v11:GetAttribute("OriginalPosition")
	})
	local v222 = TweenService:Create(v11, v3, {
		Position = v11:GetAttribute("OriginalPosition") + UDim2.new(0, 0, 0.15, 0)
	})
	t8.DownTween = v222
	t8.UpTween = v21
	local v23 = v42.HoverUpLabel or v11:FindFirstChild("HoverUpLabel")
	if v23 then
		t8.DownPosition = v23.Position
		t8.HoverUpTween = TweenService:Create(v23, v4, {
			Position = UDim2.new(v23.Position.X.Scale, 0, v23.Position.Y.Scale - 0.09)
		})
		t8.HoverDownTween = TweenService:Create(v23, v5, {
			Position = v23.Position
		})
	end
	t8.HoverLabel = v42.HoverLabel or p1:FindFirstChild("HoverLabel")
	local UIScale = p1:FindFirstChild("UIScale")
	local v25 = if UIScale then UIScale.Scale else 1
	local UpperShadowLabel = Instance.new("ImageLabel")
	UpperShadowLabel.Name = "UpperShadowLabel"
	UpperShadowLabel.Image = p1.Image
	t8.Maid:GiveTask(p1:GetPropertyChangedSignal("Image"):Connect(function() --[[ Line: 144 | Upvalues: UpperShadowLabel (copy), p1 (copy) ]]
		UpperShadowLabel.Image = p1.Image
	end))
	UpperShadowLabel.ImageTransparency = 0.55
	UpperShadowLabel.BackgroundTransparency = 1
	UpperShadowLabel:ClearAllChildren()
	if v11:FindFirstChildWhichIsA("UICorner") then
		local v26 = v11.UICorner:Clone()
		v26.Parent = UpperShadowLabel
		t8.Maid:GiveTask(v26)
	end
	UpperShadowLabel.ScaleType = v11.ScaleType
	UpperShadowLabel.SliceCenter = v11.SliceCenter
	UpperShadowLabel.SliceScale = v11.SliceScale
	UpperShadowLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
	UpperShadowLabel.ZIndex = v11.ZIndex + 2
	UpperShadowLabel.Size = UDim2.new(1, 0, 1, 0)
	UpperShadowLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	UpperShadowLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	UpperShadowLabel.Visible = false
	UpperShadowLabel.Active = false
	UpperShadowLabel.Selectable = false
	UpperShadowLabel.Parent = v11
	t8.ShadowLabel = UpperShadowLabel
	t8.Maid:GiveTask(UpperShadowLabel)
	if v11:FindFirstChild("IconLabel") then
		local IconShadowLabel = v11.IconLabel:Clone()
		IconShadowLabel.Name = "IconShadowLabel"
		IconShadowLabel.ImageTransparency = 0.55
		IconShadowLabel.ImageColor3 = v7
		IconShadowLabel.Parent = v11.IconLabel.Parent
		t8.Maid:GiveTask(IconShadowLabel)
		t8.Maid:GiveTask(v11.IconLabel:GetPropertyChangedSignal("Image"):Connect(function() --[[ Line: 178 | Upvalues: IconShadowLabel (copy), v11 (copy) ]]
			IconShadowLabel.Image = v11.IconLabel.Image
		end))
		t8.Maid:GiveTask(UpperShadowLabel:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 181 | Upvalues: IconShadowLabel (copy), UpperShadowLabel (copy) ]]
			IconShadowLabel.Visible = UpperShadowLabel.Visible
		end))
		IconShadowLabel.Visible = UpperShadowLabel.Visible
	end
	local v27 = nil
	local function ResetScale() --[[ ResetScale | Line: 188 | Upvalues: UIScale (copy), v27 (ref), TweenService (ref), v3 (ref), v25 (ref) ]]
		if not UIScale then
			return
		end
		if v27 then
			v27:Cancel()
		end
		v27 = TweenService:Create(UIScale, v3, {
			Scale = v25
		})
		v27:Play()
	end
	local function ClickScale() --[[ ClickScale | Line: 198 | Upvalues: UIScale (copy), v27 (ref), TweenService (ref), v3 (ref), v25 (ref) ]]
		if not UIScale then
			return
		end
		if v27 then
			v27:Cancel()
		end
		v27 = TweenService:Create(UIScale, v3, {
			Scale = v25 - 0.012
		})
		v27:Play()
	end
	t8.Maid:GiveTask(v11.MouseEnter:Connect(function() --[[ Line: 208 | Upvalues: t8 (copy), v2 (ref), v13 (copy), v11 (copy), UIScale (copy), TweenService (ref), v3 (ref), v25 (ref) ]]
		if not t8.Active then
			return
		end
		if v2.IsGamepadInputType() then
			return
		end
		if t8.OriginalColor or v13 then
			v11.ImageColor3 = t8.HoverColor
		end
		if t8.HoverLabel then
			t8.HoverLabel.Visible = true
		end
		if t8.HoverUpTween then
			t8.HoverUpTween:Play()
		end
		if t8.HoverSound then
			t8.HoverSound:Play()
		end
		for k, v in pairs(t8.OnHover) do
			v()
		end
		if not UIScale then
			return
		end
		TweenService:Create(UIScale, v3, {
			Scale = v25 + 0.024
		}):Play()
	end))
	t8.Maid:GiveTask(v11.MouseLeave:Connect(function() --[[ Line: 235 | Upvalues: v2 (ref), t8 (copy), v13 (copy), v11 (copy), v21 (copy), UpperShadowLabel (copy), v6 (ref), UIScale (copy), v27 (ref), TweenService (ref), v3 (ref), v25 (ref) ]]
		if v2.IsGamepadInputType() then
			return
		end
		if t8.OriginalColor or v13 then
			v11.ImageColor3 = t8.OriginalColor or v13
		end
		if t8.HoverLabel then
			t8.HoverLabel.Visible = false
		end
		if t8.HoverDownTween then
			t8.HoverDownTween:Play()
		end
		if not t8:_isButtonHeld() then
			v21:Play()
		end
		UpperShadowLabel.Visible = t8.Button:GetAttribute(v6.TabSelectedAttribute) == true
		for k, v in pairs(t8.OnLeave) do
			v()
		end
		if not UIScale then
			return
		end
		if v27 then
			v27:Cancel()
		end
		v27 = TweenService:Create(UIScale, v3, {
			Scale = v25
		})
		v27:Play()
	end))
	t8.Maid:GiveTask(p1.SelectionGained:Connect(function() --[[ Line: 261 | Upvalues: t8 (copy), v13 (copy), v11 (copy), UIScale (copy), TweenService (ref), v3 (ref), v25 (ref) ]]
		if not t8.Active then
			return
		end
		if t8.OriginalColor or v13 then
			v11.ImageColor3 = t8.HoverColor
		end
		if t8.HoverLabel then
			t8.HoverLabel.Visible = true
		end
		if t8.HoverUpTween then
			t8.HoverUpTween:Play()
		end
		if t8.HoverSound then
			t8.HoverSound:Play()
		end
		for k, v in pairs(t8.OnHover) do
			v()
		end
		if not UIScale then
			return
		end
		TweenService:Create(UIScale, v3, {
			Scale = v25 + 0.024
		}):Play()
	end))
	t8.Maid:GiveTask(p1.SelectionLost:Connect(function() --[[ Line: 287 | Upvalues: t8 (copy), v13 (copy), v11 (copy), v21 (copy), UpperShadowLabel (copy), v6 (ref), UIScale (copy), v27 (ref), TweenService (ref), v3 (ref), v25 (ref) ]]
		if t8.OriginalColor or v13 then
			v11.ImageColor3 = t8.OriginalColor or v13
		end
		if t8.HoverLabel then
			t8.HoverLabel.Visible = false
		end
		if t8.HoverDownTween then
			t8.HoverDownTween:Play()
		end
		if not t8:_isButtonHeld() then
			v21:Play()
		end
		UpperShadowLabel.Visible = t8.Button:GetAttribute(v6.TabSelectedAttribute) == true
		for k, v in pairs(t8.OnLeave) do
			v()
		end
		if not UIScale then
			return
		end
		if v27 then
			v27:Cancel()
		end
		v27 = TweenService:Create(UIScale, v3, {
			Scale = v25
		})
		v27:Play()
	end))
	t8.Maid:GiveTask(v11.MouseButton1Down:Connect(function() --[[ Line: 311 | Upvalues: UpperShadowLabel (copy), v222 (copy), ClickScale (copy) ]]
		UpperShadowLabel.Visible = true
		v222:Play()
		ClickScale()
	end))
	t8.Maid:GiveTask(v11.MouseButton1Click:Connect(function() --[[ Line: 317 | Upvalues: UpperShadowLabel (copy), t8 (copy), v6 (ref), UIScale (copy), v27 (ref), TweenService (ref), v3 (ref), v25 (ref) ]]
		UpperShadowLabel.Visible = t8.Button:GetAttribute(v6.TabSelectedAttribute) == true
		for k, v in pairs(t8.OnClick) do
			v()
		end
		if not UIScale then
			return
		end
		if v27 then
			v27:Cancel()
		end
		v27 = TweenService:Create(UIScale, v3, {
			Scale = v25
		})
		v27:Play()
	end))
	t8.Maid:GiveTask(v11.Activated:Connect(function() --[[ Line: 329 | Upvalues: t8 (copy) ]]
		t8.Sound:Play()
	end))
	t8.Maid:GiveTask(p1:GetAttributeChangedSignal(v6.TabSelectedAttribute):Connect(function() --[[ Line: 333 | Upvalues: t8 (copy) ]]
		t8:_animateDown()
	end))
	t8.Maid:GiveTask(p1:GetAttributeChangedSignal(v6.SelectedAttribute):Connect(function() --[[ Line: 337 | Upvalues: t8 (copy) ]]
		t8:_animateDown()
	end))
	local v29 = setmetatable(t8, t)
	t3[p1] = v29
	return v29
end
function t.Destroy(p1) --[[ Destroy | Line: 348 | Upvalues: t3 (copy) ]]
	for k, v in pairs(p1.OnDestroy) do
		v()
	end
	t3[p1.Button] = nil
	p1.Maid:Destroy()
end
function t._animateDown(p1) --[[ _animateDown | Line: 356 | Upvalues: v6 (copy) ]]
	if not p1:_isButtonHeld() then
		p1.ShadowLabel.Visible = false
		p1.UpTween:Play()
		return
	end
	p1.ShadowLabel.Visible = p1.Button:GetAttribute(v6.TabSelectedAttribute) == true
	p1.DownTween:Play()
end
function t._isButtonHeld(p1) --[[ _isButtonHeld | Line: 366 | Upvalues: v6 (copy) ]]
	return if p1.Button:GetAttribute(v6.TabSelectedAttribute) == true then true else p1.Button:GetAttribute(v6.SelectedAttribute) == true
end
function t._getButtonFromInstance(p1, p2) --[[ _getButtonFromInstance | Line: 370 | Upvalues: t3 (copy) ]]
	return t3[p2]
end
function t.IsButton(p1, p2) --[[ IsButton | Line: 374 | Upvalues: t3 (copy) ]]
	return t3[p2]
end
function t.RegisterClick(p1, p2, p3) --[[ RegisterClick | Line: 378 | Upvalues: t4 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnClick, p3)
	else
		t4[p2] = p3
	end
end
function t.RegisterHover(p1, p2, p3) --[[ RegisterHover | Line: 389 | Upvalues: t5 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnHover, p3)
	else
		t5[p2] = p3
	end
end
function t.RegisterLeave(p1, p2, p3) --[[ RegisterLeave | Line: 400 | Upvalues: t6 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnLeave, p3)
	else
		t6[p2] = p3
	end
end
function t.RegisterDestroy(p1, p2, p3) --[[ RegisterDestroy | Line: 411 | Upvalues: t7 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnDestroy, p3)
	else
		t7[p2] = p3
	end
end
return t