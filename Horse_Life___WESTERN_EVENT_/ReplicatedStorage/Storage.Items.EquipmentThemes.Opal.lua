-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Glass",
			Texture = "rbxassetid://97736373814103",
			Particle = "OpalSparkles"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Color = Color3.fromRGB(113, 108, 255)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(198, 119, 255)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(134, 40, 193)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(143, 255, 218)
		},
		{
			Tag = "PointLight",
			Material = "Neon",
			Color = Color3.fromRGB(177, 125, 255)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.588235, 0.313725, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.447059, 1, 0.788235)) })
		}
	}
}