-- https://lua.expert/
game.Players.LocalPlayer:GetMouse()
script.Parent.Activated:Connect(function() --[[ Line: 3 ]]
	script.Parent.RemoteEvent:FireServer()
end)
local t = {
	[Enum.KeyCode.R] = 10,
	[Enum.KeyCode.T] = 60,
	[Enum.KeyCode.F] = -10,
	[Enum.KeyCode.G] = -60
}
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 13 | Upvalues: t (copy) ]]
	if p1.UserInputType ~= Enum.UserInputType.Keyboard or not t[p1.KeyCode] then
		return
	end
	script.Parent.RemoteEvent:FireServer(t[p1.KeyCode])
end)
game.Players.LocalPlayer.Chatted:Connect(function(p1) --[[ Line: 20 ]]
	if not tonumber(p1) then
		return
	end
	script.Parent.RemoteEvent:FireServer((tonumber(p1)))
end)
script.Parent.Unequipped:Connect(function() --[[ Line: 26 ]]
	if not script.Parent.lit.Value or script.Parent.Parent ~= game.Players.LocalPlayer.Backpack then
		return
	end
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
	local Explosion = Instance.new("Explosion")
	Explosion.Position = script.Parent.Handle.Position
	Explosion.DestroyJointRadiusPercent = 0
	Explosion.BlastPressure = 0
	Explosion.Parent = workspace
	wait()
	script.Parent:Destroy()
end)