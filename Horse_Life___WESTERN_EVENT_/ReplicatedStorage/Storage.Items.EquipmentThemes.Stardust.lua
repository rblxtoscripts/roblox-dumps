-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://113686635218319"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "StardustEffect",
			Color = Color3.fromRGB(168, 92, 255)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(133, 0, 93)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Neon",
			Color = Color3.fromRGB(255, 139, 240)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(104, 25, 100)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(246, 124, 255)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 0/255, 0/255)) })
		}
	}
}