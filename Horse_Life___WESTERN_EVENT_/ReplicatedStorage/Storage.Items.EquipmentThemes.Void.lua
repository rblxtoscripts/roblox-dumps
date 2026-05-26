-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 2.5,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Neon",
			Particle = "VoidParticles",
			Color = Color3.fromRGB(0, 0, 0)
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Color = Color3.fromRGB(0, 0, 0)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Neon",
			Color = Color3.fromRGB(0, 0, 0)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Neon",
			Color = Color3.fromRGB(0, 0, 0)
		},
		{
			Tag = "Metal",
			Material = "Neon",
			Color = Color3.fromRGB(0, 0, 0)
		},
		{
			Tag = "PointLight",
			Material = "Neon",
			Color = Color3.fromRGB(0, 0, 0)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0/255, 0/255, 0/255)), ColorSequenceKeypoint.new(1, Color3.new(0/255, 0/255, 0/255)) })
		}
	}
}