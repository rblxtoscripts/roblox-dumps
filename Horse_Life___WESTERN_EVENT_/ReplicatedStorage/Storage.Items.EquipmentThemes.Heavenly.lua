-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 2,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Neon",
			Particle = "Heavenly",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "HeavenlySparkles",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Neon",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Neon",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "Metal",
			Material = "Neon",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "PointLight",
			Material = "Neon",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 255/255, 255/255)) })
		}
	}
}