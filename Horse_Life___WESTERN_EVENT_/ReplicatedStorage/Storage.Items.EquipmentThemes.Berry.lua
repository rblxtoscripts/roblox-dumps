-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 10,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://18459415823"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "BerryParticles",
			Color = Color3.fromRGB(255, 108, 98)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Snow",
			Color = Color3.fromRGB(29, 129, 52)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(255, 111, 111)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(255, 79, 82)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 93, 93)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.305882, 0.305882)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.67451, 0.67451)) })
		}
	}
}