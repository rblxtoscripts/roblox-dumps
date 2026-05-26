-- https://lua.expert/
return {
	Rarity = "Christmas",
	P = 0,
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Ice",
			Color = Color3.fromRGB(103, 220, 255)
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Color = Color3.fromRGB(107, 142, 255)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Glacier",
			Color = Color3.fromRGB(69, 168, 255)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(26, 148, 255)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(0, 157, 255)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(62, 204, 255)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.34902, 0.717647, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.435294, 0.945098, 1)) })
		}
	}
}