-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35
	},
	LEGOWingAttachment = {
		P = 0,
		Strength = 0
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}