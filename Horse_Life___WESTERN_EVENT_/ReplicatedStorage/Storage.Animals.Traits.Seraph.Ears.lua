-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 50
	},
	DivineFaceWings = {
		P = 15,
		Strength = 15
	},
	FrontWingCover = {
		P = 20,
		Strength = 20
	},
	FallenHeadWings = {
		P = 15,
		Strength = 15
	},
	MouthWings = {
		P = 15,
		Strength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Ears"
end
return {
	Ears = t
}