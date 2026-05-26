-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 10,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://18386767781"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "BlueBParticles",
			Color = Color3.fromRGB(96, 120, 255)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Ice",
			Color = Color3.fromRGB(0, 17, 50)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(37, 77, 255)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(12, 26, 83)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(83, 123, 255)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.145098, 0.329412, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.411765, 0.647059, 1)) })
		}
	}
}