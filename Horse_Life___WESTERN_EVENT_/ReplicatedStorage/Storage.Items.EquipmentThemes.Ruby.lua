-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://126498861878966"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "RedSparkles",
			Color = Color3.fromRGB(255, 0, 4)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(83, 5, 10)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Foil",
			Color = Color3.fromRGB(255, 0, 0)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(104, 0, 2)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 85, 88)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 0/255, 0/255)) })
		}
	}
}