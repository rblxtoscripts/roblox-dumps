-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("spr")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("Maid")
local CurrentCamera = workspace.CurrentCamera
local v5 = UDim2.new(0.5, 0, 1.5, 0)
local v6 = v1.GetPlayerGui("OnboardingGui")
local v7 = v1.FindElement(v6, "OutlineIndicator")
local t2 = {}
local v8 = nil
function t.new(p1) --[[ new | Line: 103 | Upvalues: v8 (ref), t (copy), v4 (copy), t2 (copy) ]]
	if p1.Singleton and v8 then
		v8:SetTarget(p1.Target, p1)
		return v8
	end
	local v2 = setmetatable({}, t)
	v2.Maid = v4.new()
	v2.Config = p1
	v2.Visible = false
	v2.Padding = p1.Padding or 0.065
	v2.Frequency = p1.Frequency or 4
	v2:_createIndicator()
	v2:Update()
	t2[v2] = true
	if p1.Singleton then
		v8 = v2
	end
	return v2
end
function t.Create(...) --[[ Create | Line: 129 | Upvalues: t (copy) ]]
	return t.new(...)
end
function t.Destroy(p1) --[[ Destroy | Line: 133 | Upvalues: t2 (copy), v8 (ref), v3 (copy) ]]
	t2[p1] = nil
	if v8 == p1 then
		v8 = nil
	end
	v3(p1)
end
function t._createIndicator(p1) --[[ _createIndicator | Line: 143 | Upvalues: v1 (copy), v7 (copy), v5 (copy), v6 (copy) ]]
	p1.Instance = v1.CloneTemplate(v7)
	p1.Instance.AnchorPoint = Vector2.new(0.5, 0.5)
	p1.Instance.Visible = true
	p1.Instance.Position = v5
	p1.Instance.Parent = v6
	p1.Maid:GiveTask(p1.Instance)
	p1.Outline = v1.FindElement(p1.Instance, "Outline")
	p1.Background = v1.FindElement(p1.Instance, "Background")
	p1.PromptLabel = v1.FindElement(p1.Instance, "PromptLabel")
	if p1.PromptLabel then
		if p1.Config.PromptText then
			p1.PromptLabel.RichText = true
			p1.PromptLabel.Text = p1.Config.PromptText
		else
			p1.PromptLabel.Visible = false
		end
	end
	p1.OriginalOutlineTransparency = p1.Outline and p1.Outline.Transparency or 0
	p1.OriginalBackgroundTransparency = p1.Background and p1.Background.Transparency or 0
	if p1.PromptLabel then
		p1.OriginalPromptTextTransparency = p1.PromptLabel.TextTransparency
		p1.OriginalPromptStrokeTransparency = p1.PromptLabel:FindFirstChildWhichIsA("UIStroke") and p1.PromptLabel:FindFirstChildWhichIsA("UIStroke").Transparency or nil
	end
	if p1.Outline then
		p1.Outline.Transparency = 1
	end
	if p1.Background then
		p1.Background.Transparency = 1
	end
	if not p1.PromptLabel then
		return
	end
	p1.PromptLabel.TextTransparency = 1
	local v4 = p1.PromptLabel:FindFirstChildWhichIsA("UIStroke")
	if not v4 then
		return
	end
	v4.Transparency = 1
end
function t._setTransparency(p1, p2) --[[ _setTransparency | Line: 187 | Upvalues: v2 (copy) ]]
	if p1.Outline then
		local t = {}
		t.Transparency = if p2 then 1 else p1.OriginalOutlineTransparency
		v2.target(p1.Outline, 1, p1.Frequency, t)
	end
	if p1.Background then
		local t = {}
		t.Transparency = if p2 then 1 else p1.OriginalBackgroundTransparency
		v2.target(p1.Background, 1, p1.Frequency, t)
	end
	if not p1.PromptLabel then
		return
	end
	local t = {}
	t.TextTransparency = if p2 then 1 else p1.OriginalPromptTextTransparency
	v2.target(p1.PromptLabel, 1, p1.Frequency, t)
	local v7 = p1.PromptLabel:FindFirstChildWhichIsA("UIStroke")
	if not (v7 and p1.OriginalPromptStrokeTransparency) then
		return
	end
	local t2 = {}
	t2.Transparency = if p2 then 1 else p1.OriginalPromptStrokeTransparency
	v2.target(v7, 1, p1.Frequency, t2)
end
function t._getTarget(p1) --[[ _getTarget | Line: 211 ]]
	local Target = p1.Config.Target
	if type(Target) == "function" then
		Target = Target()
	end
	return Target
end
function t._getTargetProperties(p1, p2) --[[ _getTargetProperties | Line: 219 | Upvalues: GuiService (copy), CurrentCamera (copy) ]]
	local AbsolutePosition = p2.AbsolutePosition
	local AbsoluteSize = p2.AbsoluteSize
	local v1 = GuiService:GetGuiInset()
	local ViewportSize = CurrentCamera.ViewportSize
	local v2, v3
	if typeof(p1.Padding) == "UDim2" then
		local v4 = if p1.Padding.X.Scale == 0 then 0 else p1.Padding.X.Scale * ViewportSize.X
		v2, v3 = v4, if p1.Padding.Y.Scale == 0 then 0 else p1.Padding.Y.Scale * ViewportSize.Y
	else
		local v6 = p1.Padding * ViewportSize.Y
		v2 = v6
		v3 = v6
	end
	return {
		Position = UDim2.new(0, AbsolutePosition.X + AbsoluteSize.X / 2, 0, AbsolutePosition.Y + AbsoluteSize.Y / 2 + v1.Y),
		Size = UDim2.new(0, AbsoluteSize.X + v2, 0, AbsoluteSize.Y + v3)
	}
end
function t._canShow(p1, p2) --[[ _canShow | Line: 242 ]]
	if not p2 then
		return false
	end
	if typeof(p2) == "Instance" and not p2.Parent then
		return false
	end
	return (not p1.Config.CanShow or p1.Config.CanShow(p1, p2)) and true or false
end
function t.Show(p1) --[[ Show | Line: 258 | Upvalues: v1 (copy) ]]
	if p1.Visible then
		return
	end
	p1.Visible = true
	p1.Maid.HideDelay = nil
	local v12 = p1:_getTarget()
	if v12 and p1:_canShow(v12) then
		local v2 = p1:_getTargetProperties(v12)
		p1.Instance.Position = v2.Position
		p1.Instance.Size = v2.Size
	end
	p1:_setTransparency(false)
	p1.Maid.PulseStroke = v1.PlayEffect("PulseStroke", {
		ThicknessMultiple = 30,
		TransparencyFrequency = 1,
		WaitTime = 0.75,
		Instance = p1.Instance
	})
end
function t.Hide(p1) --[[ Hide | Line: 283 | Upvalues: v5 (copy) ]]
	if p1.Visible then
		p1.Visible = false
		p1.Maid.PulseStroke = nil
		p1:_setTransparency(true)
		p1.Maid.HideDelay = task.delay(4 / p1.Frequency, function() --[[ Line: 293 | Upvalues: p1 (copy), v5 (ref) ]]
			p1.Instance.Position = v5
		end)
	end
end
function t.SetTarget(p1, p2, p3) --[[ SetTarget | Line: 298 ]]
	local v1 = if p3 then p3 else {}
	p1.Config.Target = p2
	p1.Padding = v1.Padding or p1.Padding
	p1.Frequency = v1.Frequency or p1.Frequency
	if v1.PromptText and p1.PromptLabel then
		p1.PromptLabel.Text = v1.PromptText
	end
	if p1.Visible then
		return
	end
	p1:Show()
end
function t.IsVisible(p1) --[[ IsVisible | Line: 314 ]]
	return p1.Visible
end
function t.Update(p1) --[[ Update | Line: 318 ]]
	local v1 = p1:_getTarget()
	if p1:_canShow(v1) then
		if not p1.Visible then
			p1:Show()
		end
		local v2 = p1:_getTargetProperties(v1)
		p1.Instance.Position = v2.Position
		p1.Instance.Size = v2.Size
	else
		if not p1.Visible then
			return
		end
		p1:Hide()
	end
end
RunService.Heartbeat:Connect(function() --[[ Line: 337 | Upvalues: t2 (copy) ]]
	for v1 in t2 do
		v1:Update()
	end
end)
return t