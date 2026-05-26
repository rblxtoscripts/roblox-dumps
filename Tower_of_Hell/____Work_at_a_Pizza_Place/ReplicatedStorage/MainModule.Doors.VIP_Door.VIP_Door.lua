-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
if not (script:WaitForChild("HousePointer").Value.Owner.Value and game.Players.LocalPlayer:FindFirstChild("VIP") or game.Players.LocalPlayer:FindFirstChild("IsMod")) then
	return
end
v1.DoorClosed.CanCollide = false