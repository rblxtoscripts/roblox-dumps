-- https://lua.expert/
return {
	Rarity = "Christmas",
	P = 0,
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://109229120848637"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "AuroraTheme",
			Color = Color3.fromRGB(5, 181, 127)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(13, 80, 139)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(3, 28, 98)
		},
		{
			Tag = "Metal",
			Material = "Glass",
			Color = Color3.fromRGB(16, 19, 80)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(8, 15, 54)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0.666667, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.67451, 0.772549, 1)) })
		}
	}
}