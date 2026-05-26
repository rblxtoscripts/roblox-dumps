-- https://lua.expert/
local t = {
	FlowingMane = {
		P = 50,
		Strength = 50
	},
	LayeredFeatherMane = {
		P = 50,
		Strength = 50
	},
	LayeredFurMane = {
		P = 50,
		Strength = 50
	},
	OwlMane = {
		P = 25,
		Strength = 25
	},
	CandyMane = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}