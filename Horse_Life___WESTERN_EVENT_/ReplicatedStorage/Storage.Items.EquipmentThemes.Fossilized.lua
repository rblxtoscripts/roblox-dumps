-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Glass",
			Texture = "rbxassetid://71454054941482",
			Particle = "BlueSparkles"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Color = Color3.fromRGB(109, 85, 80)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(41, 49, 62)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(255, 245, 242)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(23, 31, 44)
		},
		{
			Tag = "PointLight",
			Material = "Neon",
			Color = Color3.fromRGB(255, 176, 131)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.588235, 0.313725, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.447059, 1, 0.788235)) })
		}
	}
}