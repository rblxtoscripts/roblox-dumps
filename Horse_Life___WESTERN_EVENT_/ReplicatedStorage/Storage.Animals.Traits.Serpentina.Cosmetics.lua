-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 35
	},
	SleekHood = {
		P = 10,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}