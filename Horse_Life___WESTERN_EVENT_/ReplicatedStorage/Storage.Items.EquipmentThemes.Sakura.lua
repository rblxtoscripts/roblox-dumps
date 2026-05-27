-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 10,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Texture = "rbxassetid://17134676478"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "PinkSparkles",
			Color = Color3.fromRGB(255, 123, 152)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Glass",
			Color = Color3.fromRGB(255, 171, 209)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Foil",
			Color = Color3.fromRGB(255, 133, 188)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(255, 140, 199)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 140, 199)
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