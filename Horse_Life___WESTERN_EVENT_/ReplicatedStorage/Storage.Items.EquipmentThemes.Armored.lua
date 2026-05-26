-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Plastic",
			MaterialVariant = "Trophy",
			Particle = "SilverSparkles",
			Color = Color3.fromRGB(184, 184, 184)
		},
		{
			Tag = "ColorableRegion2",
			Material = "Fabric",
			Color = Color3.fromRGB(117, 0, 0)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Neon",
			Color = Color3.fromRGB(71, 0, 0)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Leather",
			Color = Color3.fromRGB(26, 26, 26)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(0, 0, 0)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 80, 83)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 0/255, 0/255)) })
		}
	}
}