-- https://lua.expert/
return {
	Rarity = "Carnival",
	P = 0,
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://96796867163834"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "Popcorns",
			Color = Color3.fromRGB(232, 145, 116)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(255, 205, 87)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Foil",
			Color = Color3.fromRGB(255, 226, 140)
		},
		{
			Tag = "Metal",
			Material = "Glass",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 251, 202)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.443137, 0.0470588)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.752941, 0.631373)) })
		}
	}
}