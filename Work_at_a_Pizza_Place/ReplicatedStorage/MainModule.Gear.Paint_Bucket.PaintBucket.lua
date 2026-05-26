-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
require(game.ReplicatedStorage:WaitForChild("Enums"))
game:GetService("UserInputService")
game:GetService("ContextActionService")
local v1, v2, v3, v4, v5
if not game:GetService("UserInputService").TouchEnabled or game:GetService("UserInputService").MouseEnabled then
	v1 = game.Players.LocalPlayer
	v2 = script.Parent
	v3 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	v3:WaitForChild("MainGui")
	v4 = require(v3:WaitForChild("GuiManager"))
	v3:WaitForChild("UIEvents")
	v1:GetMouse()
	enabled = true
	v5 = v4:GetWindowDataByName("PaintBucketColorPicker").Object
	v5:WaitForChild("Colors")
	v5:WaitForChild("DropDownButton")
	Color3.new(213/255, 115/255, 61/255)
	v2.Equipped:connect(function() --[[ Line: 42 ]] end)
	return
end
local _ = not game:GetService("UserInputService").KeyboardEnabled
v1 = game.Players.LocalPlayer
v2 = script.Parent
v3 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
v3:WaitForChild("MainGui")
v4 = require(v3:WaitForChild("GuiManager"))
v3:WaitForChild("UIEvents")
v1:GetMouse()
enabled = true
v5 = v4:GetWindowDataByName("PaintBucketColorPicker").Object
v5:WaitForChild("Colors")
v5:WaitForChild("DropDownButton")
Color3.new(213/255, 115/255, 61/255)
v2.Equipped:connect(function() --[[ Line: 42 ]] end)