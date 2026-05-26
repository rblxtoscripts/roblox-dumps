-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://87271822510839"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "NightStars",
			Color = Color3.fromRGB(255, 122, 99)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(7, 14, 27)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Neon",
			Color = Color3.fromRGB(7, 14, 27)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(22, 41, 104)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 199, 142)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 0/255, 0/255)) })
		}
	}
}