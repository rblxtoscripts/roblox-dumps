-- https://lua.expert/
local t = {
	ThinTail = {
		P = 50,
		Strength = 50
	},
	ShortKelpTail = {
		P = 50,
		Strength = 50
	},
	KSleekTail = {
		DisplayName = "SleekTail",
		P = 40,
		Strength = 40
	},
	MattedTail = {
		P = 30,
		Strength = 30
	},
	LeafKelpTail = {
		P = 20,
		Strength = 20
	},
	RiftTail = {
		P = 10,
		Strength = 10
	},
	TricksterTail = {
		P = 10,
		Strength = 10
	},
	FishboneTail = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}