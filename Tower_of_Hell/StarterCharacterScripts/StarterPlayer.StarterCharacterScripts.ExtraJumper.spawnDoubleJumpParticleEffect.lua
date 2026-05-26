-- https://lua.expert/
return function(p1) --[[ Line: 1 ]]
	local Part = Instance.new("Part")
	Part.Size = Vector3.new(2, 1, 2)
	Part.CFrame = p1.HumanoidRootPart.CFrame - Vector3.new(0, 3, 0)
	Part.Anchored = true
	Part.CanCollide = false
	Part.Transparency = 1
	local ParticleEmitter = Instance.new("ParticleEmitter")
	ParticleEmitter.Texture = "rbxassetid://4473921733"
	ParticleEmitter.Lifetime = NumberRange.new(0.3, 0.5)
	ParticleEmitter.Rate = 2000
	ParticleEmitter.EmissionDirection = Enum.NormalId.Front
	ParticleEmitter.SpreadAngle = Vector2.new(0, 180)
	ParticleEmitter.Speed = NumberRange.new(9, 11)
	ParticleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.1, 0.45), NumberSequenceKeypoint.new(1, 1.5) })
	ParticleEmitter.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.3), NumberSequenceKeypoint.new(1, 1) })
	ParticleEmitter.LightInfluence = 0
	ParticleEmitter.Parent = Part
	Part.Parent = workspace
	spawn(function() --[[ Line: 28 | Upvalues: ParticleEmitter (copy), Part (copy) ]]
		wait(0.1)
		ParticleEmitter.Enabled = false
		game:GetService("Debris"):AddItem(Part, 1)
	end)
end