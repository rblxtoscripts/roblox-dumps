-- https://lua.expert/
local t = {
	SERidgedMane = {
		P = 30,
		Strength = 30
	},
	SimpleSpines = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}