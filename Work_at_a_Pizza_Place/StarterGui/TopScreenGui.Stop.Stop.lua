-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Network")
local _ = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local v2 = script.Parent
local TextLabel = v2.Foreground.TextLabel
v2.Visible = false
v1:BindEvents({
	GrabingStarted = function() --[[ GrabingStarted | Line: 18 | Upvalues: TextLabel (copy), v2 (copy) ]]
		TextLabel.Text = "Let Go"
		v2.Visible = true
	end,
	GrabingStopped = function() --[[ GrabingStopped | Line: 22 | Upvalues: v2 (copy) ]]
		v2.Visible = true
	end,
	LickingStopped = function() --[[ LickingStopped | Line: 25 | Upvalues: v2 (copy) ]]
		v2.Visible = false
	end,
	LickingStarted = function() --[[ LickingStarted | Line: 28 | Upvalues: TextLabel (copy), v2 (copy) ]]
		TextLabel.Text = "Stop Lick"
		v2.Visible = true
	end,
	PlayerRespawned = function(p1) --[[ PlayerRespawned | Line: 32 | Upvalues: v2 (copy) ]]
		if p1 ~= game.Players.LocalPlayer then
			return
		end
		v2.Visible = false
	end
})
function Clicked() --[[ Clicked | Line: 40 | Upvalues: TextLabel (copy), v1 (copy), v2 (copy) ]]
	if TextLabel.Text == "Stop Lick" then
		v1:FireServer("StopLicking")
		return
	end
	if TextLabel.Text ~= "Let Go" then
		return
	end
	v2.Visible = false
	v1:FireServer("LetGoOfObject")
end
v2.MouseButton1Click:Connect(Clicked)
if not _G.GamepadEnabled then
	return
end
v2.YButton.Visible = true
game:GetService("UserInputService").InputBegan:connect(function(p1, p2) --[[ Line: 52 | Upvalues: v2 (copy) ]]
	if not v2.Visible or (p2 or p1.KeyCode ~= Enum.KeyCode.ButtonY) then
		return
	end
	Clicked()
end)