-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
Library:Load("SoundFX")
Library:Load("Signal")
local t = {}
t.__index = t
function t.new(p1, p2, p3) --[[ new | Line: 14 | Upvalues: t (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.Object = p1
	t2.Type = "Tab"
	t2.Frame = p3
	t2.TabGroup = p2
	t2.Color = Color3.new(21/255, 89/255, 216/255)
	t2.Pressed = false
	t2.Icon = p1:FindFirstChild("Icon")
	t2.Label = p1:FindFirstChild("Label")
	t2.PositionY = p1.Position.Y.Offset
	return t2
end
function t.SetPressed(p1, p2) --[[ SetPressed | Line: 50 ]]
	if p2 then
		p1.Pressed = true
		if p1.Object.Style ~= Enum.ButtonStyle.Custom then
			p1.Object.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
		end
	else
		if p1.Object.Style ~= Enum.ButtonStyle.Custom then
			p1.Object.Style = Enum.ButtonStyle.RobloxRoundButton
		end
		p1.Pressed = false
	end
end
return t