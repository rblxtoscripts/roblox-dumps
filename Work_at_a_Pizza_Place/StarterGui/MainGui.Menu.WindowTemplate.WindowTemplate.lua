-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
GuiManager:RegisterWindow(v1, "Left", "Right")
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 15 | Upvalues: v1 (copy) ]] end)