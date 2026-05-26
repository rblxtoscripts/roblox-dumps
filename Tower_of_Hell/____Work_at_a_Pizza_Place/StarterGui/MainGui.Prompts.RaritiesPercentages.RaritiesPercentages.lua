-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
if not (MainGui.AbsoluteSize.Y < 500) then
	GuiManager:RegisterWindow(v1, "Right", "Right")
	return
end
script.Parent:WaitForChild("UIScale").Scale = 0.8
GuiManager:RegisterWindow(v1, "Right", "Right")