-- https://lua.expert/
local t = {
	TopStreak = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}