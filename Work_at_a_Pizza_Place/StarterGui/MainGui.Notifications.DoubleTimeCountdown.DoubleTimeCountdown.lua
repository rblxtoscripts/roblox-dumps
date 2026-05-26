-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
Library:Load("SoundFX")
local v1 = Library:Load("Timer")
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local v3 = GuiManager:RegisterWindow(v2, "Right", "Right")
v3.IsCoreGuiWindow = true
v3.CanBeFocused = false
v3.CanBeOverriden = true
function StartTimer(p1, p2) --[[ StartTimer | Line: 24 | Upvalues: v2 (copy), v1 (copy), v3 (copy) ]]
	v2.NeonTime.Visible = false
	v2.DoubleTime.Visible = false
	local v12 = v2[p2]
	v12.Visible = true
	local Countdown = v12:WaitForChild("Countdown")
	local v22 = v1.new(p1 - os.time())
	v22:OnSecondElapsed(function() --[[ Line: 36 | Upvalues: v22 (copy), Countdown (copy) ]]
		local v2, v3 = math.modf(v22:GetRemaining() / 60)
		local v4 = string.format("%02d", (math.floor(v3 * 60)))
		local v5
		if v2 > 60 then
			local v6, v7 = math.modf(v2 / 60)
			v5, v2 = v6, string.format("%02d", (math.floor(v7 * 60)))
		else
			v5 = nil
		end
		if v5 then
			Countdown.Text = v5 .. ":" .. v2 .. ":" .. v4
		else
			Countdown.Text = v2 .. ":" .. v4
		end
	end)
	v22:OnFinished(function() --[[ Line: 53 | Upvalues: v3 (ref) ]]
		v3:SetVisible(false)
	end)
	v22:Start()
	v3:SetVisible(true)
end
workspace.GameService.DoubleTimeStarted.OnClientEvent:Connect(function(p1) --[[ Line: 63 ]]
	StartTimer(p1, "DoubleTime")
end)
workspace.GameService.NeonTimeStarted.OnClientEvent:Connect(function(p1) --[[ Line: 67 ]]
	StartTimer(p1, "NeonTime")
end)
if not game.ReplicatedStorage.GlobalData.DoubleTime.Value then
	return
end
StartTimer(game.ReplicatedStorage.GlobalData.DoubleTimeEndTime.Value, "DoubleTime")