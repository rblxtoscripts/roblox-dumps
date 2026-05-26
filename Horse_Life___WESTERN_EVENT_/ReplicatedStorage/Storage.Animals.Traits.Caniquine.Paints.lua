-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	ColliePaint = {
		P = 25,
		Strength = 25
	},
	CATobiano = {
		DisplayName = "Tobiano",
		P = 25,
		Strength = 25
	},
	LightOvero = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}