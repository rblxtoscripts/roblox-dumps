-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Debug"))
local ClaimPrize = v3:WaitForChild("ClaimPrize")
local v4 = GuiManager:RegisterWindow(script.Parent, "Left", "Right", 0.3, Enum.EasingStyle.Quad, true)
v4.FirstSelectedObject = ClaimPrize
workspace.Main.ShowFoundAllTurkeys.OnClientEvent:connect(function() --[[ Line: 22 | Upvalues: v2 (copy), v4 (copy), ClaimPrize (copy), v1 (copy) ]]
	wait(3)
	v2:PlaySound("Tada2")
	v4:SetVisible(true)
	ClaimPrize.MouseButton1Click:connect(function() --[[ Line: 28 | Upvalues: v2 (ref), v1 (ref), v4 (ref) ]]
		v2:PlaySound("GotCandy")
		v1:SendData("ClaimTurkeyPrize", "PlayerChannel")
		v4:SetVisible(false)
	end)
end)