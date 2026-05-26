-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local v1 = LocalPlayer:GetMouse()
if LocalPlayer.Name ~= "Dued1" and (LocalPlayer.Name ~= "Dert41" and (not require(game.ReplicatedStorage:WaitForChild("Enums")).IsLocalTestServer and (LocalPlayer.Name ~= "RBXZach" and LocalPlayer.Name ~= "3dCarrot"))) then
	return
end
local v3 = false
v1.Button1Down:connect(function() --[[ Line: 9 | Upvalues: v3 (ref), LocalPlayer (copy), v1 (copy) ]]
	if not (v3 and (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))) then
		return
	end
	workspace.Main.TeleportAdmin:FireServer(v1.Hit.p + Vector3.new(0, 7, 0))
end)
v1.KeyDown:connect(function(p1) --[[ Line: 15 | Upvalues: v3 (ref) ]]
	if p1 ~= "`" then
		return
	end
	v3 = not v3
end)