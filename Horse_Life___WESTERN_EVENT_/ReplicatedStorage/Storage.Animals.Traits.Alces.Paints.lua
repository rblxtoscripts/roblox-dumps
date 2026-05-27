-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	APiebald = {
		DisplayName = "Piebald",
		P = 40,
		Strength = 20
	},
	FrontPaint = {
		P = 40,
		Strength = 35
	},
	SnowcapishPaint = {
		P = 30,
		Strength = 20
	},
	FrigidLegPaint = {
		P = 30,
		Strength = 20
	},
	NeckSpeckles = {
		P = 40,
		Strength = 40
	},
	WoodpeckerMask = {
		P = 35,
		Strength = 35
	},
	AvianCape = {
		P = 30,
		Strength = 30
	},
	FrozenVertebrae = {
		P = 40,
		Strength = 40
	},
	FrozenRibcage = {
		P = 30,
		Strength = 30
	},
	NorthStarPaint = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}