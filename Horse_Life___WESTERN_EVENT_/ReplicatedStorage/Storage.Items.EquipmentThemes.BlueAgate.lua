-- https://lua.expert/
return {
	Rarity = "Legendary",
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://105885555040627"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "BlueSparkles",
			Color = Color3.fromRGB(135, 235, 255)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(223, 172, 90)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Foil",
			Color = Color3.fromRGB(187, 246, 255)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(112, 223, 219)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(176, 234, 255)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 0/255, 0/255)) })
		}
	}
}