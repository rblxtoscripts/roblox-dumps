-- https://lua.expert/
local _ = script:WaitForChild("ObjectPointer").Value
local v1 = script:WaitForChild("HousePointer").Value
while true do
	if workspace.Main.IsFriendsWithPlayer:InvokeServer(v1.Owner.Value.userId) or (v1.Owner.Value == game.Players.LocalPlayer or game.Players.LocalPlayer:FindFirstChild("IsMod")) then
		for i, v in ipairs(v1.Furniture:GetChildren()) do
			if v.Name == "Friend Door" then
				v.DoorClosed.CanCollide = false
			end
		end
		wait()
		script:Destroy()
	end
	wait(30)
end