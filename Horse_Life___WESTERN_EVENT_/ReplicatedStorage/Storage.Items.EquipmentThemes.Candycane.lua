-- https://lua.expert/
return {
	Rarity = "Christmas",
	P = 0,
	ExcludeFromDrops = true,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "Fabric",
			Texture = "rbxassetid://129566887323233"
		},
		{
			Tag = "ColorableRegion2",
			Material = "Neon",
			Particle = "MintStars",
			Color = Color3.fromRGB(255, 102, 102)
		},
		{
			Tag = "ColorableRegion3",
			Material = "Foil",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "ColorableRegion4",
			Material = "Glass",
			Color = Color3.fromRGB(255, 51, 51)
		},
		{
			Tag = "Metal",
			Material = "Metal",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(255, 97, 97)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(255/255, 0/255, 0/255)) })
		}
	}
}