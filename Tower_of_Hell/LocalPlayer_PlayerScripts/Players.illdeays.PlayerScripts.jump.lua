-- https://lua.expert/
local jump = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("jump")
local LocalPlayer = game.Players.LocalPlayer
function addChar(p1) --[[ addChar | Line: 6 | Upvalues: jump (copy) ]]
	local Humanoid = p1:WaitForChild("Humanoid")
	Humanoid.Jumping:Connect(function(p12) --[[ Line: 8 | Upvalues: jump (ref), p1 (copy), Humanoid (copy) ]]
		local v1 = if jump.Value == 1 then true else false
		if jump.Value == 2 then
			for k, v in pairs(p1:GetChildren()) do
				if string.find(v.Name, "Halo", nil, true) or (string.find(v.Name, "Trail", nil, true) or string.find(v.Name, "Plastic", nil, true)) then
					v1 = true
					break
				end
			end
		end
		if not (p12 and v1) then
			return
		end
		if math.random(1, 57 + (if jump.Value == 2 then 128 else 0)) == 1 then
			wait(math.random() * 0.2 + 0.2)
			local WalkSpeed = Humanoid.WalkSpeed
			Humanoid.WalkSpeed = 0
			wait(math.random() * 0.1 + 0.05)
			Humanoid.WalkSpeed = WalkSpeed
			return
		end
		if math.random(1, 35 + (if jump.Value == 2 then 96 else 0)) ~= 1 then
			return
		end
		local JumpPower = Humanoid.JumpPower
		Humanoid.JumpPower = 0
		wait(0.2)
		Humanoid.JumpPower = JumpPower
	end)
end
LocalPlayer.CharacterAdded:Connect(addChar)
if not LocalPlayer.Character then
	return
end
addChar(LocalPlayer.Character)