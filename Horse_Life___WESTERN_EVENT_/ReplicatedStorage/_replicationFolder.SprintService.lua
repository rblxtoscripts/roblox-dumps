-- https://lua.expert/
local t = {}
local TweenService = game:GetService("TweenService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("NotificationsClient")
local Sprint = Instance.new("BoolValue")
Sprint.Name = "Sprint"
Sprint.Parent = game.Players.LocalPlayer
local SprintTween = Instance.new("NumberValue", Sprint)
SprintTween.Name = "SprintTween"
local v2 = 0
local function canSetWalkspeed() --[[ canSetWalkspeed | Line: 21 ]]
	return true
end
local function sprint() --[[ sprint | Line: 26 | Upvalues: v2 (ref), v1 (copy), Sprint (copy), TweenService (copy), SprintTween (copy) ]]
	if _G.DisableRunning then
		if v2 ~= 0 and not (tick() - v2 > 2) then
			return false
		end
		v2 = tick()
		v1.Notify({
			Message = "You cannot sprint while in a trail!",
			Preset = "Red"
		})
		return false
	else
		Sprint.Value = true
		TweenService:Create(SprintTween, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			Value = 1
		}):Play()
	end
end
local function walk() --[[ walk | Line: 45 | Upvalues: Sprint (copy), TweenService (copy), SprintTween (copy) ]]
	Sprint.Value = false
	TweenService:Create(SprintTween, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Value = 0
	}):Play()
end
function t.GetAlpha(p1) --[[ GetAlpha | Line: 52 | Upvalues: SprintTween (copy) ]]
	return SprintTween.Value
end
function t.IsSprinting(p1) --[[ IsSprinting | Line: 56 | Upvalues: Sprint (copy) ]]
	return Sprint.Value
end
function t.StopSprinting(p1) --[[ StopSprinting | Line: 60 | Upvalues: walk (copy) ]]
	walk()
end
function t.Sprint(p1) --[[ Sprint | Line: 64 | Upvalues: sprint (copy) ]]
	sprint()
end
t.SprintValue = Sprint
t.SprintChanged = Sprint:GetPropertyChangedSignal("Value")
return t