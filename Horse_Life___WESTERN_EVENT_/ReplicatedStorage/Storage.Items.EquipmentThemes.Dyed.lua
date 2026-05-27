-- https://lua.expert/
return {
	Rarity = "Easter",
	P = 0,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://132748507373366"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "Eggs",
			Color = Color3.fromRGB(114, 222, 255)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Glass",
			Color = Color3.fromRGB(255, 209, 117)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(255, 142, 191)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 236, 206)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.443137, 0.0470588)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.752941, 0.631373)) })
		}
	}
}