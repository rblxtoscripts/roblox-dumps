-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://17230853574"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "GalaxySparkle",
			Color = Color3.fromRGB(71, 28, 180)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Granite",
			Color = Color3.fromRGB(44, 16, 124)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Foil",
			Color = Color3.fromRGB(67, 22, 165)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(25, 5, 104)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(109, 64, 255)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 0/255, 0/255)) })
		}
	}
}