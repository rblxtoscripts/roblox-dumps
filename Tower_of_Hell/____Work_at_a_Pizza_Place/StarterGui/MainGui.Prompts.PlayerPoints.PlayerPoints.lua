-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
local v1 = Library:Load("SoundFX")
Library:Load("Queue")
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
if _G.GamepadEnabled then
	v2:WaitForChild("UIScale").Scale = 1.3
end
local v4 = GuiManager:RegisterWindow(v2, "Left", "Right")
v4.IsGamepadNavigateable = false
game.Workspace.Main.PointsAwarded.OnClientEvent:connect(function(p1) --[[ Line: 25 | Upvalues: v1 (copy), v4 (copy), v3 (copy), v2 (copy) ]]
	delay(0.6, function() --[[ Line: 27 | Upvalues: v1 (ref) ]]
		v1:PlaySound("Tada2")
	end)
	v4:SetVisible(true)
	if v3.IsEnglish() and p1 >= 1000000 then
		p1 = ("%0.1f"):format(p1 / 1000000) .. "M+"
	end
	v2:WaitForChild("total").Text = "You have earned " .. p1 .. " Player Points from this game so far."
	v2:WaitForChild("Frame"):WaitForChild("amount").Text = v3.FormatNumber("Plus", 40000, v2:WaitForChild("Frame"):WaitForChild("amount")) or "40000"
end)