-- https://lua.expert/
game:GetService("ReplicatedStorage")
local v1 = require(game.ReplicatedStorage.Sonar)("MathUtils")
local CurrentCamera = workspace.CurrentCamera
local t = {
	Lassoing = -12,
	Gallop = 8,
	Sprint = 4,
	Reverse = -4,
	Brake = -10,
	CharacterSprint = 4,
	Crouch = -5,
	FirstPerson = 8,
	WildModeZoomOut = -10,
	Dive = 20,
	Race = -6
}
local v2 = table.clone(t)
local t2 = {
	Position = 70
}
local t3 = {}
function t2.setModifierValue(p1, p2) --[[ setModifierValue | Line: 33 | Upvalues: v2 (copy) ]]
	v2[p1] = p2
end
function t2.setModifier(p1, p2) --[[ setModifier | Line: 37 | Upvalues: t3 (copy) ]]
	t3[p1] = p2
end
function t2.getModifierEnabled(p1) --[[ getModifierEnabled | Line: 41 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t2.getModifierFOVChange(p1) --[[ getModifierFOVChange | Line: 45 | Upvalues: t2 (copy), v2 (copy) ]]
	if t2.getModifierEnabled(p1) then
		return v2[p1]
	else
		return 0
	end
end
function t2.getTotalModifierValues() --[[ getTotalModifierValues | Line: 55 | Upvalues: t3 (copy), t2 (copy) ]]
	local sum = 0
	for k in pairs(t3) do
		sum = sum + t2.getModifierFOVChange(k)
	end
	return sum
end
function t2.update(p1) --[[ update | Line: 67 | Upvalues: t2 (copy), v1 (copy), CurrentCamera (copy) ]]
	t2.Position = v1.lerp(t2.Position, math.clamp(70 + t2.getTotalModifierValues(), 10, 100), (math.clamp(2.5 * p1, 0, 1)))
	CurrentCamera.FieldOfView = t2.Position
end
t2.BaseValues = t
game:GetService("RunService").Heartbeat:Connect(function(p1) --[[ Line: 82 | Upvalues: t2 (copy) ]]
	t2.update(p1)
end)
return t2