-- https://lua.expert/
return {
	Rarity = "Valentines",
	P = 0,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://99164033257662"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "RosePetals",
			Color = Color3.fromRGB(86, 36, 36)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(37, 90, 36)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(255, 70, 95)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(86, 0, 19)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 88, 88)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.243137, 0.243137)), ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0.298039)) })
		}
	}
}