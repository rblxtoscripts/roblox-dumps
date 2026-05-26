-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://98431917246147"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "PurpleSparkles",
			Color = Color3.fromRGB(129, 112, 255)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(68, 39, 83)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Foil",
			Color = Color3.fromRGB(210, 171, 255)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(68, 39, 83)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(197, 130, 255)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 0/255, 0/255)) })
		}
	}
}