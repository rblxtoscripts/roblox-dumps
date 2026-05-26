-- https://lua.expert/
return {
	Rarity = "Carnival",
	P = 0,
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://130528233012534"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "GoldParticles",
			Color = Color3.fromRGB(255, 78, 102)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(255, 51, 95)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(255, 120, 152)
		},
		{
			Tag = "Metal",
			Material = "Glass",
			Color = Color3.fromRGB(206, 0, 72)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 101, 155)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0.666667, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.67451, 0.772549, 1)) })
		}
	}
}