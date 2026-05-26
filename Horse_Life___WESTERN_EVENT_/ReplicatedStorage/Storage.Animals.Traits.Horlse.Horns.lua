-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 40
	},
	Cover = {
		DisplayName = "HorseCover",
		P = 10,
		Strength = 0
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}