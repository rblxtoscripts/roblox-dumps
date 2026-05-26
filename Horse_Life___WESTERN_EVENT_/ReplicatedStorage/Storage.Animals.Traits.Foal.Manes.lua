-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}