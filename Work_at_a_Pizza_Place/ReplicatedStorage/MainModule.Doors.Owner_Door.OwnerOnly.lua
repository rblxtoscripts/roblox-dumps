-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
if script:WaitForChild("HousePointer").Value.Owner.Value ~= game.Players.LocalPlayer and not game.Players.LocalPlayer:FindFirstChild("IsMod") then
	return
end
v1.DoorClosed.CanCollide = false