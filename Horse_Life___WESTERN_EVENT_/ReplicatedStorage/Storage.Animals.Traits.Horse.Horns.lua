-- https://lua.expert/
local t = {
	Nothing = {
		P = 100,
		Strength = 100
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}