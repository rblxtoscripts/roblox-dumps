-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Maid")
local Particles = ReplicatedStorage.Storage.Assets.Particles
local t = {}
t.__index = t
function t.CreateParticleAtPosition(p1) --[[ CreateParticleAtPosition | Line: 11 | Upvalues: t (copy), Particles (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.ParticleTemplate = Particles[p1.ParticleName]
	v2.Maid = v1.new()
	if not v2.ParticleTemplate then
		warn("Particle template not found: " .. p1.ParticleName)
	end
	if p1.Parent then
		v2.ParticlePart = nil
		v2.Particle = v2.ParticleTemplate:Clone()
		v2.Particle.Parent = p1.Parent
	else
		v2.ParticlePart = Instance.new("Part")
		v2.ParticlePart.Position = p1.Position
		v2.ParticlePart.Size = Vector3.new(1, 1, 1)
		v2.ParticlePart.Transparency = 1
		v2.ParticlePart.Anchored = true
		v2.ParticlePart.CanCollide = false
		v2.ParticlePart.Parent = workspace
		v2.Particle = v2.ParticleTemplate:Clone()
		v2.Particle.Parent = v2.ParticlePart
	end
	for v3, v4 in v2.Particle:GetChildren() do
		if v4:IsA("ParticleEmitter") then
			v4:Emit(v4:GetAttribute("EmitCount") or 1, p1.Duration)
		end
	end
	if v2.ParticlePart then
		v2.Maid:GiveTask(v2.ParticlePart)
	end
	v2.Maid:GiveTask(v2.Particle)
	v2.Maid:GiveTask(function() --[[ Line: 50 | Upvalues: v2 (copy) ]]
		setmetatable(v2, nil)
	end)
	task.delay(p1.Duration, function() --[[ Line: 54 | Upvalues: v2 (copy) ]]
		v2.Maid:DoCleaning()
	end)
	return v2
end
return t