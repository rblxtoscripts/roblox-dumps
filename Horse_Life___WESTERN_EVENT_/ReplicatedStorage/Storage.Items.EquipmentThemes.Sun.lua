-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 2.5,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Neon",
			Particle = "SunRays",
			Color = Color3.fromRGB(255, 72, 0)
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Color = Color3.fromRGB(255, 94, 0)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Neon",
			Color = Color3.fromRGB(255, 192, 67)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Neon",
			Color = Color3.fromRGB(255, 197, 115)
		},
		{
			Tag = "Metal",
			Material = "Neon",
			Color = Color3.fromRGB(180, 32, 2)
		},
		{
			Tag = "PointLight",
			Material = "Neon",
			Color = Color3.fromRGB(255, 102, 0)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.25098, 0)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.576471, 0.152941)) })
		}
	}
}