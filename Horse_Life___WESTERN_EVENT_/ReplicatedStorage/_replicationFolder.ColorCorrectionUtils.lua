-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {}
local v1 = false
local v2 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper").GetClient()
local function canFlash() --[[ canFlash | Line: 11 | Upvalues: v2 (copy) ]]
	return v2.PlayerData.Settings.States.ScreenFlashes.Value
end
function t.Tween(p1, p2, p3, p4, p5) --[[ Tween | Line: 15 | Upvalues: v1 (ref), v2 (copy), TweenService (copy) ]]
	if v1 or not v2.PlayerData.Settings.States.ScreenFlashes.Value then
		return
	end
	v1 = true
	local v12 = TweenInfo.new(0.235, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true)
	local v22 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true)
	local t2 = {
		Brightness = 0.2
	}
	local v3 = if p2 then p2 else game.Lighting.ColorCorrection
	TweenService:Create(v3, p3 or v12, p4 or {
		Brightness = 0.355
	}):Play()
	if not p5 then
		TweenService:Create(v3, p3 or v22, p4 or t2):Play()
	end
	task.delay(0.5, function() --[[ Line: 42 | Upvalues: v1 (ref) ]]
		v1 = false
	end)
end
return t