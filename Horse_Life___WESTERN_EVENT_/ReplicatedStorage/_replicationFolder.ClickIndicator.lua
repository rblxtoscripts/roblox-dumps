-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("Maid")
local t2 = {
	Up = function(p1, p2, p3) --[[ Up | Line: 17 ]]
		return UDim2.new(0, p1.X + p2.X / 2, 0, p1.Y + p2.Y - p2.Y * p3)
	end,
	Right = function(p1, p2, p3) --[[ Right | Line: 21 ]]
		return UDim2.new(0, p1.X + p2.X * p3, 0, p1.Y + p2.Y / 2)
	end,
	Down = function(p1, p2, p3) --[[ Down | Line: 25 ]]
		return UDim2.new(0, p1.X + p2.X / 2, 0, p1.Y + p2.Y * p3)
	end,
	Left = function(p1, p2, p3) --[[ Left | Line: 29 ]]
		return UDim2.new(0, p1.X + p2.X - p2.X * p3, 0, p1.Y + p2.Y / 2)
	end
}
local t3 = {
	Up = 0,
	Right = 90,
	Down = 180,
	Left = 270
}
local t4 = {
	Up = Vector2.new(0.5, 0),
	Right = Vector2.new(1, 0.5),
	Down = Vector2.new(0.5, 1),
	Left = Vector2.new(0, 0.5)
}
local v4 = v1.GetPlayerGui("OnboardingGui")
local v5 = v1.FindElement(v4, "ClickIndicator")
local t5 = {}
function t.new(p1) --[[ new | Line: 58 | Upvalues: t (copy), v3 (copy), t2 (copy), t5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.Config = p1
	v2.Active = false
	v2.Direction = v2.Config.Direction or "Up"
	v2.ApplyDirectionOffset = t2[v2.Direction]
	v2:_createIndicator()
	v2:Update()
	t5[v2] = true
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 77 | Upvalues: t5 (copy), v2 (copy) ]]
	t5[p1] = nil
	v2(p1)
end
function t._createIndicator(p1) --[[ _createIndicator | Line: 82 | Upvalues: v1 (copy), v5 (copy), t3 (copy), t4 (copy), v4 (copy) ]]
	p1.Instance = v1.CloneTemplate(v5)
	p1.RotateFrame = v1.FindElement(p1.Instance, "RotateFrame")
	p1.RotateFrame.Rotation = t3[p1.Direction]
	p1.ImageFallbackLabel = v1.FindElement(p1.Instance, "ImageFallbackLabel")
	p1.IndicatorLabel = v1.FindElement(p1.Instance, "IndicatorLabel")
	p1.Instance.AnchorPoint = t4[p1.Direction]
	p1.Instance.Parent = v4
	p1.Maid:GiveTask(p1.Instance)
	return p1.Instance
end
function t._animate(p1) --[[ _animate | Line: 101 | Upvalues: TweenService (copy) ]]
	return task.spawn(function() --[[ Line: 102 | Upvalues: p1 (copy), TweenService (ref) ]]
		while p1.Active do
			local v1 = TweenService:Create(p1.IndicatorLabel, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Position = UDim2.new(0.5, 0, -0.1, 0)
			})
			v1:Play()
			v1.Completed:Wait()
			local v2 = TweenService:Create(p1.IndicatorLabel, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Position = UDim2.new(0.5, 0, 0.25, 0)
			})
			v2:Play()
			v2.Completed:Wait()
		end
	end)
end
function t._getTarget(p1) --[[ _getTarget | Line: 122 ]]
	local Target = p1.Config.Target
	if type(Target) == "function" then
		Target = Target()
	end
	return Target
end
function t._getPosition(p1, p2) --[[ _getPosition | Line: 131 ]]
	local v1 = typeof(p2) == "Instance" and p2:IsA("GuiObject") and p2.AbsolutePosition or p2
	local v2 = typeof(p2) == "Instance" and p2:IsA("GuiObject") and p2.AbsoluteSize or Vector2.new(0, 0)
	return p1.ApplyDirectionOffset(v1, v2, p1.Config.OffsetScale or 0)
end
function t._canShow(p1, p2) --[[ _canShow | Line: 141 | Upvalues: v1 (copy) ]]
	if not p2 then
		return false
	end
	local NextIndicator = p1.Config.NextIndicator
	if NextIndicator and NextIndicator:IsActive() then
		return false
	end
	local PreviousIndicator = p1.Config.PreviousIndicator
	if PreviousIndicator and PreviousIndicator:IsActive() then
		return false
	end
	if p1.Config.CanShow and not p1.Config.CanShow(p1, p2) then
		return false
	end
	return v1.IsVisibleOnScreen(p2) and true or false
end
function t.SetNextIndicator(p1, p2) --[[ SetNextIndicator | Line: 176 ]]
	p1.Config.NextIndicator = p2
end
function t.Update(p1) --[[ Update | Line: 180 ]]
	local v1 = p1:_getTarget()
	if p1:_canShow(v1) then
		local isNotActive = p1.Active ~= true
		p1.Active = true
		p1.Instance.Position = p1:_getPosition(v1)
		p1.Instance.Visible = true
		if p1.ImageFallbackLabel and p1.IndicatorLabel:IsA("ImageLabel") then
			p1.ImageFallbackLabel.Visible = not p1.IndicatorLabel.IsLoaded
		end
		if isNotActive then
			p1.Maid._animateThread = p1:_animate()
		end
	else
		p1.Active = false
		p1.Instance.Visible = false
		p1.Maid._animateThread = nil
	end
end
function t.IsActive(p1) --[[ IsActive | Line: 206 ]]
	return p1.Active
end
function t.Create(...) --[[ Create | Line: 210 | Upvalues: t (copy) ]]
	return t.new(...)
end
function t.Init(p1) --[[ Init | Line: 214 | Upvalues: RunService (copy), t5 (copy) ]]
	RunService.Heartbeat:Connect(function() --[[ Line: 215 | Upvalues: t5 (ref) ]]
		for v1 in t5 do
			v1:Update()
		end
	end)
end
t:Init()
return t