-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("Binder")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("DiggingService")
local v5 = Sonar("PlayerWrapper").GetClient()
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 14 | Upvalues: t (copy), v1 (copy), v3 (copy), v4 (copy), v5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	v2.Maid = v1.new()
	v2.Maid:GiveTask(v3.AttachToTime(function() --[[ Line: 20 | Upvalues: v4 (ref), v2 (copy), v5 (ref) ]]
		if v4.CheckDailyReward() then
			v2.Object.Display.SurfaceGui.Frame.DailyLogin.Text = "Daily Login: Ready to Claim"
		else
			v2.Object.Display.SurfaceGui.Frame.DailyLogin.Text = "Daily Login: Not Ready"
		end
		v2.Object.Display.SurfaceGui.Frame.Streak.Text = "Streak: " .. v5.PlayerData.DiggingPlotsLogin.Streak.Value
	end))
	v2.Maid:GiveTask(function() --[[ Line: 30 | Upvalues: v2 (copy) ]]
		setmetatable(v2, nil)
	end)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 37 ]]
	p1.Maid:DoCleaning()
end
function t.Init(p1) --[[ Init | Line: 41 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("FreeShovel", t):Init()
end
t:Init()
return t