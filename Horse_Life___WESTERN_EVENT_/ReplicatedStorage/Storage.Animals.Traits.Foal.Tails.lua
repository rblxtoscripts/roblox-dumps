-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}