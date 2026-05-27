-- https://lua.expert/
return {
	Rarity = "Easter",
	P = 0,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://70839581311564"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "Tulips",
			Color = Color3.fromRGB(255, 133, 135)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(155, 193, 98)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Foil",
			Color = Color3.fromRGB(255, 110, 129)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(255, 179, 197)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 189, 209)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.443137, 0.0470588)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.752941, 0.631373)) })
		}
	}
}