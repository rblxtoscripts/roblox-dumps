-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 10,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://79561916284968"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "CoffeeBeans",
			Color = Color3.fromRGB(61, 40, 14)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Metal",
			Color = Color3.fromRGB(54, 17, 4)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(54, 17, 4)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(22, 7, 2)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 131, 93)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.466667, 0.219608)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.752941, 0.631373)) })
		}
	}
}