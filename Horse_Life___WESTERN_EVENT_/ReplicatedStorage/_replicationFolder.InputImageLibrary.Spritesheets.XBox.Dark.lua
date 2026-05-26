-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Spritesheet")
local v2 = setmetatable({}, v1)
v2.ClassName = "XboxOneDark"
v2.__index = v2
function v2.new() --[[ new | Line: 11 | Upvalues: v1 (copy), v2 (copy) ]]
	local v3 = setmetatable(v1.new("rbxassetid://5089898851"), v2)
	v3:AddSprite("DPad", Vector2.new(0, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonA, Vector2.new(100, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonB, Vector2.new(200, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonL1, Vector2.new(300, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonL2, Vector2.new(400, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonR1, Vector2.new(500, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonR2, Vector2.new(600, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonSelect, Vector2.new(700, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonX, Vector2.new(800, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.ButtonY, Vector2.new(900, 0), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.DPadDown, Vector2.new(0, 100), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.DPadLeft, Vector2.new(100, 100), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.DPadRight, Vector2.new(200, 100), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.DPadUp, Vector2.new(300, 100), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.Menu, Vector2.new(400, 100), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.Thumbstick2, Vector2.new(500, 100), Vector2.new(100, 100))
	v3:AddSprite(Enum.KeyCode.Thumbstick1, Vector2.new(600, 100), Vector2.new(100, 100))
	return v3
end
return v2