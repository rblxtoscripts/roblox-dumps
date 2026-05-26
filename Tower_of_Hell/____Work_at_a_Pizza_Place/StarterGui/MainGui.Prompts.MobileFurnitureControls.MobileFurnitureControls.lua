-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
GuiManager:RegisterWindow(v1, "Bottom", "Bottom").CanBeFocused = false
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 12 ]]
	if p1 ~= script.Parent or not p2 then
		return
	end
	task.wait()
	_G.RefreshMemoryUsage(true)
end)