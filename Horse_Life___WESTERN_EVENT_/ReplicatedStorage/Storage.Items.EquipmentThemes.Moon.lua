-- https://lua.expert/
return {
	Rarity = "Legendary",
	P = 2.5,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://126919771809228",
			Particle = "Stars"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "MoonDust",
			Color = Color3.fromRGB(123, 131, 143)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(41, 43, 45)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(123, 131, 143)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(48, 48, 48)
		},
		{
			Tag = "PointLight",
			Material = "Neon",
			Color = Color3.fromRGB(152, 162, 179)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(0.85098, 0.921569, 1)) })
		}
	}
}