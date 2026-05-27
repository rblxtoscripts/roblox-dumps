-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 35
	},
	FlowerCluster = {
		P = 40,
		Strength = 35
	},
	NeckFlower = {
		P = 40,
		Strength = 35
	},
	Idyllic = {
		P = 40,
		Strength = 35
	},
	SweepingLeaf = {
		P = 40,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}