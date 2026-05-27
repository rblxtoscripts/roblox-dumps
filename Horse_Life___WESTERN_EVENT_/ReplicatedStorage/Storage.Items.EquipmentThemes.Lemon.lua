-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 10,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://18237314147"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "LemonParticles",
			Color = Color3.fromRGB(255, 184, 98)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Rubber",
			Color = Color3.fromRGB(113, 165, 34)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(255, 239, 115)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(255, 216, 74)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 216, 74)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 0/255)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 0.498039)) })
		}
	}
}