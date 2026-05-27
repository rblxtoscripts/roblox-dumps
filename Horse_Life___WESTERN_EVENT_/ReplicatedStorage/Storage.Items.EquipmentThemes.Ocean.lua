-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 10,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://17230761635"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Color = Color3.fromRGB(36, 141, 206)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(37, 113, 255)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Foil",
			Color = Color3.fromRGB(13, 104, 165)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(0, 59, 104)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(52, 171, 219)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0.905882, 0.380392, 1)),
				ColorSequenceKeypoint.new(0.265976, Color3.new(1, 0.541176, 0.921569)),
				ColorSequenceKeypoint.new(0.651123, Color3.new(1, 0.666667, 1)),
				ColorSequenceKeypoint.new(1, Color3.new(255/255, 255/255, 255/255))
			})
		}
	}
}