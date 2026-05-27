-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Spritesheet")
local v2 = setmetatable({}, v1)
v2.ClassName = "Gestures"
v2.__index = v2
function v2.new() --[[ new | Line: 14 | Upvalues: v1 (copy), v2 (copy) ]]
	local v3 = setmetatable(v1.new("rbxassetid://1244652786"), v2)
	v3:AddSprite("DoubleRotate", Vector2.zero, Vector2.new(102, 139))
	v3:AddSprite("DoubleTap", Vector2.new(102, 0), Vector2.new(100, 100))
	v3:AddSprite("FingerFront", Vector2.new(202, 0), Vector2.new(100, 100))
	v3:AddSprite("FingerSide", Vector2.new(302, 0), Vector2.new(100, 100))
	v3:AddSprite("FullCircle", Vector2.new(402, 0), Vector2.new(100, 137))
	v3:AddSprite("HalfCircle", Vector2.new(502, 0), Vector2.new(76, 141))
	v3:AddSprite("Hold", Vector2.new(578, 0), Vector2.new(100, 100))
	v3:AddSprite("QuarterCircle", Vector2.new(678, 0), Vector2.new(87, 110))
	v3:AddSprite("ScrollDown", Vector2.new(765, 0), Vector2.new(71, 105))
	v3:AddSprite("ScrollLeft", Vector2.new(836, 0), Vector2.new(109, 63))
	v3:AddSprite("ScrollRight", Vector2.new(0, 141), Vector2.new(106, 63))
	v3:AddSprite("ScrollUp", Vector2.new(106, 141), Vector2.new(71, 102))
	v3:AddSprite("SwipeBottom", Vector2.new(177, 141), Vector2.new(100, 100))
	v3:AddSprite("SwipeBottomLeft", Vector2.new(277, 141), Vector2.new(100, 100))
	v3:AddSprite("SwipeBottomRight", Vector2.new(377, 141), Vector2.new(100, 100))
	v3:AddSprite("SwipeLeft", Vector2.new(477, 141), Vector2.new(100, 100))
	v3:AddSprite("SwipeRight", Vector2.new(577, 141), Vector2.new(100, 100))
	v3:AddSprite("SwipeTopLeft", Vector2.new(677, 141), Vector2.new(100, 100))
	v3:AddSprite("SwipeTopRight", Vector2.new(777, 141), Vector2.new(100, 100))
	v3:AddSprite("SwipeUp", Vector2.new(877, 141), Vector2.new(100, 100))
	v3:AddSprite("Tap", Vector2.new(0, 243), Vector2.new(100, 100))
	v3:AddSprite("ZoomIn", Vector2.new(100, 243), Vector2.new(114, 106))
	v3:AddSprite("ZoomOut", Vector2.new(214, 243), Vector2.new(154, 105))
	return v3
end
return v2