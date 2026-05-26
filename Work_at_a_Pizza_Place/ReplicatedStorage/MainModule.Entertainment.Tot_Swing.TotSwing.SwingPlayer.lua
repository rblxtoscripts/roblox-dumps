-- https://lua.expert/
local ObjectPointer = script:WaitForChild("ObjectPointer", 2)
if not (ObjectPointer.Value and (ObjectPointer.Value.Parent and (ObjectPointer.Value:FindFirstChild("Seat") and ObjectPointer.Value.Seat.Occupant))) then
	return
end
local Seat = ObjectPointer.Value:FindFirstChild("Seat")
local Humanoid = game.Players.LocalPlayer.Character.Humanoid
local BodyForce = Seat.BodyForce
local v1 = true
local function reset() --[[ reset | Line: 9 | Upvalues: BodyForce (copy) ]]
	BodyForce.Force = Vector3.new(0, 0, 0)
	script:Destroy()
end
ObjectPointer.Changed:connect(function() --[[ Line: 15 | Upvalues: ObjectPointer (copy), v1 (ref), BodyForce (copy) ]]
	if ObjectPointer.Value ~= nil and ObjectPointer.Value.Parent ~= nil then
		return
	end
	v1 = false
	BodyForce.Force = Vector3.new(0, 0, 0)
	script:Destroy()
end)
while v1 and Humanoid.Sit do
	wait(0.1)
	BodyForce.Force = Humanoid.MoveDirection * 500
end
BodyForce.Force = Vector3.new(0, 0, 0)
script:Destroy()