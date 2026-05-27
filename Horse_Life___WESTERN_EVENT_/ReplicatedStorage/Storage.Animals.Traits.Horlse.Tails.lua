-- https://lua.expert/
local t = {
	GreyTail = {
		DisplayName = "NormalTail",
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}