-- https://lua.expert/
return {
	Rarity = "Halloween",
	P = 0,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://128728695781090"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "Pumpkins",
			Color = Color3.fromRGB(173, 114, 72)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(94, 185, 44)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(255, 124, 58)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(255, 102, 0)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 118, 38)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.443137, 0.0470588)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.752941, 0.631373)) })
		}
	}
}