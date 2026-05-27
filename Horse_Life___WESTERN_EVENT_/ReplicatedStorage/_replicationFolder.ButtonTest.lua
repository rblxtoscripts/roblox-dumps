-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("InputTypeDetector")
local v3 = Sonar("MathUtils")
local v4 = Sonar("Button")
local v5 = Sonar("spr")
local t = {}
t.__index = t
local TweenService = game:GetService("TweenService")
local ClickSound = script:WaitForChild("ClickSound")
local HoverSound = script:WaitForChild("HoverSound")
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {
	Green = {
		TextColor = Color3.fromRGB(8, 84, 69),
		MainColor = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 255, 128)),
			ColorSequenceKeypoint.new(0.4723184, Color3.fromRGB(110, 255, 128)),
			ColorSequenceKeypoint.new(0.4740485, Color3.fromRGB(90, 221, 128)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 221, 128))
		}),
		ShadowColor = Color3.fromRGB(19, 146, 121)
	},
	Red = {
		TextColor = Color3.fromRGB(89, 7, 44),
		MainColor = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 94, 115)),
			ColorSequenceKeypoint.new(0.4723184, Color3.fromRGB(238, 94, 115)),
			ColorSequenceKeypoint.new(0.4740485, Color3.fromRGB(224, 77, 115)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(224, 77, 115))
		}),
		ShadowColor = Color3.fromRGB(137, 17, 71)
	}
}
function t.new(p1, p2) --[[ new | Line: 45 | Upvalues: t (copy), v1 (copy), ClickSound (copy), HoverSound (copy), v4 (copy), TweenService (copy), v2 (copy), t2 (copy) ]]
	assert(p1:IsA("GuiButton"), p1:GetFullName() .. " is not a button")
	local v5 = setmetatable({}, t)
	v5.Button = p1
	v5.OnHover = {}
	v5.OnLeave = {}
	v5.OnClick = {}
	v5.OnDown = {}
	v5.OnUp = {}
	v5.OnDestroy = {}
	local v6 = p2 or {}
	for v7, v8 in v5 do
		local v10 = typeof(v6[v7])
		if v10 == "function" or v10 == "table" then
			if v10 == "table" then
				for v11, v122 in v6[v7] do
					if typeof(v122) == "function" then
						table.insert(v8, v122)
					end
				end
				continue
			end
			table.insert(v8, v6[v7])
		end
	end
	if v6.HideNotification then
		local Notification = (p1:FindFirstChild("Notifications", true) or p1):FindFirstChild("Notification")
		if Notification then
			table.insert(v5.OnClick, function() --[[ Line: 88 | Upvalues: Notification (ref) ]]
				Notification.Visible = false
			end)
		end
	end
	v5.Maid = v1.new()
	v5.Sound = v6.Sound or (if v6.Sound == false then false else ClickSound)
	v5.HoverSound = v6.HoverSound or (if v6.HoverSound == false then false else HoverSound)
	v5.HoverLabel = v6.HoverLabel
	v5.OriginalHoverLabelVisible = v5.HoverLabel and v5.HoverLabel.Visible
	if v5.HoverLabel then
		v5.HoverLabel.Visible = false
	end
	if v6.Click then
		table.insert(v5.OnClick, v6.Click)
	end
	v5.OriginalActive = p1.Active
	p1.Active = true
	v5.OriginalSelectable = p1.Selectable
	if v6.Selectable == nil then
		p1.Selectable = true
	else
		p1.Selectable = v6.Selectable
	end
	if p1.Parent and (p1.Parent:IsA("ImageButton") and (p1.Parent:FindFirstChild("Menu") and v6.AddHoverButton)) then
		v5.Maid:GiveTask(v4.new(p1.Parent, {
			NoHoverColor = true,
			NoHoverShadowLabel = true,
			Click = v6.Click,
			HoverUpLabel = p1.Parent.Menu:FindFirstChildWhichIsA("ImageLabel")
		}))
	end
	local v17 = if v6.IgnoreUIScale == true then true else false
	v5.UIScale = nil
	v5.CreatedUIScale = false
	v5.OriginalUIScale = nil
	v5.ScaleOverride = nil
	v5.BaseScale = nil
	if not v17 then
		v5.UIScale = p1:FindFirstChild("UIScale")
		if v5.UIScale then
			v5.OriginalUIScale = v5.UIScale.Scale
		else
			local UIScale = Instance.new("UIScale")
			UIScale.Parent = p1
			v5.UIScale = UIScale
			v5.CreatedUIScale = true
			v5.OriginalUIScale = 1
		end
		v5.BaseScale = v5.OriginalUIScale
	end
	if v6.Rotate ~= false then
		v5.RotateLabel = v6.Rotate or p1
		v5.OriginalRotation = v5.RotateLabel.Rotation
		v5.ResetRotationTween = TweenService:Create(v5.RotateLabel, TweenInfo.new(0.1), {
			Rotation = v5.RotateLabel.Rotation
		})
	end
	v5.Maid:GiveTask(p1.MouseEnter:Connect(function() --[[ Line: 156 | Upvalues: v5 (copy) ]]
		v5:_onHover(true)
	end))
	v5.Maid:GiveTask(p1.SelectionGained:Connect(function() --[[ Line: 159 | Upvalues: v2 (ref), v5 (copy) ]]
		if v2.IsGamepadInputType() then
			v5:_onHover(true)
		end
	end))
	v5.Maid:GiveTask(p1.SelectionLost:Connect(function() --[[ Line: 165 | Upvalues: v2 (ref), v5 (copy) ]]
		if v2.IsGamepadInputType() then
			v5:_onHover(false)
		end
	end))
	v5.Maid:GiveTask(p1.MouseLeave:Connect(function() --[[ Line: 170 | Upvalues: v5 (copy) ]]
		v5:_onHover(false)
	end))
	v5.Maid:GiveTask(p1.MouseButton1Click:Connect(function() --[[ Line: 175 | Upvalues: v5 (copy) ]]
		v5:_onClick()
	end))
	v5.Maid:GiveTask(p1.MouseButton1Down:Connect(function() --[[ Line: 178 | Upvalues: v5 (copy) ]]
		v5:_onDown()
	end))
	v5.Maid:GiveTask(p1.MouseButton1Up:Connect(function() --[[ Line: 181 | Upvalues: v5 (copy) ]]
		v5:_onUp()
	end))
	v5.Maid:GiveTask(p1.Destroying:Connect(function() --[[ Line: 185 | Upvalues: v5 (copy) ]]
		v5:Destroy()
	end))
	t2[p1] = v5
	return v5
end
function t._onHover(p1, p2) --[[ _onHover | Line: 194 | Upvalues: v5 (copy), v2 (copy) ]]
	if not p1.Button.Interactable then
		return
	end
	if p2 then
		if not p1:_isActive() then
			return
		end
		p1.Hovering = true
		if p1.HoverSound then
			p1.HoverSound:Play()
		end
		if p1.HoverLabel then
			p1.HoverLabel.Visible = true
		end
		if p1.UIScale then
			v5.target(p1.UIScale, 0.8, 8, {
				Scale = (p1.ScaleOverride or p1.BaseScale) * 1.05
			})
		end
		for k, v in pairs(p1.OnHover) do
			local v22 = task.spawn
			v22(v, v2.GetInputType() ~= 1)
		end
		p1:_rotate(true)
	else
		p1.Hovering = false
		if p1.HoverLabel then
			p1.HoverLabel.Visible = false
		end
		if p1.UIScale then
			v5.target(p1.UIScale, 0.8, 8, {
				Scale = p1.ScaleOverride or p1.BaseScale
			})
		end
		for k, v in pairs(p1.OnLeave) do
			task.spawn(v)
		end
		p1:_rotate(false)
	end
end
function t._onClick(p1) --[[ _onClick | Line: 234 ]]
	if not p1:_isActive() then
		return
	end
	for k, v in pairs(p1.OnClick) do
		v(p1)
	end
end
function t._onDown(p1) --[[ _onDown | Line: 241 | Upvalues: v5 (copy) ]]
	if not p1:_isActive() then
		return
	end
	if p1.UIScale then
		v5.target(p1.UIScale, 0.8, 10, {
			Scale = (p1.ScaleOverride or p1.BaseScale) * 0.85
		})
	end
	if p1.Sound then
		p1.Sound:Play()
	end
	for k, v in pairs(p1.OnDown) do
		v(p1)
	end
end
function t._onUp(p1) --[[ _onUp | Line: 255 | Upvalues: v5 (copy) ]]
	if not p1:_isActive() then
		return
	end
	if p1.UIScale then
		v5.target(p1.UIScale, 0.6, 6, {
			Scale = p1.ScaleOverride or p1.BaseScale
		})
	end
	for k, v in pairs(p1.OnUp) do
		v(p1)
	end
end
function t._rotate(p1, p2) --[[ _rotate | Line: 266 | Upvalues: v3 (copy) ]]
	if not p1.RotateLabel then
		return
	end
	local v1 = tick()
	p1.Tick = v1
	if p2 then
		task.spawn(function() --[[ Line: 272 | Upvalues: p1 (copy), v1 (copy), v3 (ref) ]]
			while p1.Tick == v1 do
				p1.RotateLabel.Rotation = v3.lerp(p1.RotateLabel.Rotation, math.sin(tick() * 3) * 6, 0.1)
				task.wait()
			end
		end)
	else
		p1.ResetRotationTween:Play()
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 283 | Upvalues: v5 (copy), t2 (copy) ]]
	p1.ShowTip = nil
	for k, v in pairs(p1.OnDestroy) do
		v()
	end
	if p1.Tick then
		p1.Tick = nil
	end
	if p1.UIScale then
		v5.stop(p1.UIScale, "Scale")
		if p1.CreatedUIScale then
			p1.UIScale:Destroy()
		elseif p1.OriginalUIScale ~= nil then
			p1.ScaleOverride = nil
			p1.UIScale.Scale = p1.OriginalUIScale
		end
	end
	if p1.ResetRotationTween then
		p1.ResetRotationTween:Cancel()
	end
	if p1.RotateLabel and p1.OriginalRotation then
		p1.RotateLabel.Rotation = p1.OriginalRotation
	end
	if p1.HoverLabel and p1.OriginalHoverLabelVisible ~= nil then
		p1.HoverLabel.Visible = p1.OriginalHoverLabelVisible
	end
	if p1.Button then
		if p1.OriginalActive ~= nil then
			p1.Button.Active = p1.OriginalActive
		end
		if p1.OriginalSelectable ~= nil then
			p1.Button.Selectable = p1.OriginalSelectable
		end
	end
	if p1.HoverMaid and p1.HoverMaid.Destroy then
		p1.HoverMaid:Destroy()
	end
	t2[p1.Button] = nil
	p1.Maid:Destroy()
end
function t._isActive(p1) --[[ _isActive | Line: 333 ]]
	if p1.Active == nil then
		return true
	else
		return p1.Active
	end
end
function t.SetScaleOverride(p1, p2) --[[ SetScaleOverride | Line: 339 | Upvalues: v5 (copy) ]]
	if not p1.UIScale then
		return
	end
	p1.ScaleOverride = p2
	if p2 then
		v5.target(p1.UIScale, 0.8, 4, {
			Scale = p2
		})
	else
		v5.target(p1.UIScale, 0.8, 4, {
			Scale = p1.BaseScale
		})
	end
end
function t._getButtonFromInstance(p1, p2) --[[ _getButtonFromInstance | Line: 351 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.IsButton(p1, p2) --[[ IsButton | Line: 355 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.RegisterClick(p1, p2, p3) --[[ RegisterClick | Line: 359 | Upvalues: t3 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnClick, p3)
	else
		t3[p2] = p3
	end
end
function t.RegisterAction(p1, p2, p3, p4) --[[ RegisterAction | Line: 370 ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if not v1 then
		return
	end
	table.insert(v1[p3], p4)
end
function t.RegisterHover(p1, p2, p3) --[[ RegisterHover | Line: 379 | Upvalues: t4 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnHover, p3)
	else
		t4[p2] = p3
	end
end
function t.RegisterLeave(p1, p2, p3) --[[ RegisterLeave | Line: 390 | Upvalues: t5 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnLeave, p3)
	else
		t5[p2] = p3
	end
end
function t.RegisterDestroy(p1, p2, p3) --[[ RegisterDestroy | Line: 401 | Upvalues: t6 (copy) ]]
	local v1 = p1:_getButtonFromInstance(p2)
	if v1 then
		table.insert(v1.OnDestroy, p3)
	else
		t6[p2] = p3
	end
end
function t.SetColor(p1, p2) --[[ SetColor | Line: 412 | Upvalues: t7 (copy) ]]
	local v1 = t7[p2]
	if v1 then
		p1.Button.Top.TextLabel.TextColor3 = v1.TextColor
		p1.Button.Top.UIGradient.Color = v1.MainColor
		p1.Button.Shadow.BackgroundColor3 = v1.ShadowColor
	else
		warn("Button:SetColor - Invalid color: ", p2)
	end
end
function t.SetText(p1, p2) --[[ SetText | Line: 424 ]]
	p1.Button.Top.TextLabel.Text = p2
end
return t