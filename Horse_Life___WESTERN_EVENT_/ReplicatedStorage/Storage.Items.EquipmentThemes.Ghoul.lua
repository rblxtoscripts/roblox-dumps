-- https://lua.expert/
return {
	Rarity = "Halloween",
	P = 0,
	Regions = {
		{
			Tag = "ColorableRegion1",
			Material = "ForceField",
			Color = Color3.fromRGB(255, 255, 255)
		},
		{
			Tag = "ColorableRegion2",
			Material = "ForceField",
			Color = Color3.fromRGB(234, 255, 254)
		},
		{
			Tag = "ColorableRegion3",
			Material = "ForceField",
			Color = Color3.fromRGB(206, 254, 255)
		},
		{
			Tag = "ColorableRegion4",
			Material = "ForceField",
			Color = Color3.fromRGB(183, 255, 253)
		},
		{
			Tag = "Metal",
			Material = "ForceField",
			Color = Color3.fromRGB(164, 255, 244)
		},
		{
			Tag = "PointLight",
			Color = Color3.fromRGB(196, 255, 246)
		},
		{
			Tag = "ParticleColor",
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(255/255, 255/255, 255/255)), ColorSequenceKeypoint.new(1, Color3.new(0.768627, 1, 0.964706)) })
		}
	}
}