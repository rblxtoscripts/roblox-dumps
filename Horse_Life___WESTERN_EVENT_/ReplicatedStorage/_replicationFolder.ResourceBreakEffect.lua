-- https://lua.expert/
local t = {}
local v1 = require(game.ReplicatedStorage.Sonar)("Maid")
local RunService = game:GetService("RunService")
local SFX = game.ReplicatedStorage.Storage.SFX
local Particles = game.ReplicatedStorage.Storage.Assets.Particles
function t.new(p1) --[[ new | Line: 9 | Upvalues: v1 (copy), SFX (copy), Particles (copy), RunService (copy) ]]
	local v12 = p1:Clone()
	p1.Transparency = 1
	v12.Transparency = 0
	local v2 = v1.new()
	local v3 = SFX.Pop:Clone()
	v3.Parent = p1
	v3:Play()
	v2:GiveTask(v3)
	local v4 = Particles.Confetti:Clone()
	v4.Parent = p1
	v4:Emit(10)
	v2:GiveTask(v4)
	local v5 = 0
	local v6 = p1.CFrame
	local Size = p1.Size
	local v7 = math.random() * math.pi * 2
	local v10 = Vector3.new(math.cos(v7), 4, (math.sin(v7))) * 5
	local v11 = v10:Cross(Vector3.new(0, 1, 0))
	v2:GiveTask(v12)
	v2:GiveTask(RunService.RenderStepped:Connect(function(p1) --[[ Line: 38 | Upvalues: v5 (ref), v6 (copy), v10 (copy), v12 (copy), v11 (copy), Size (copy), v2 (copy) ]]
		v5 = v5 + p1
		v12.CFrame = CFrame.fromAxisAngle(v11, v5 * 2) * CFrame.Angles(0, v5 * 3, 0) * v6.Rotation + (v6.Position + v10 * v5 + Vector3.new(0, -60, 0) * v5 * v5)
		v12.Size = Size * (1 - v5)
		if not (v5 >= 1) then
			return
		end
		v2:DoCleaning()
	end))
	v12.Parent = workspace
end
return t