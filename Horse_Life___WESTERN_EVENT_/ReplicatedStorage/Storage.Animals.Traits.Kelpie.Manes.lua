-- https://lua.expert/
local t = {
	ShortKelpHair = {
		P = 50,
		Strength = 50
	},
	ThinMane = {
		P = 50,
		Strength = 50
	},
	SleekMane = {
		P = 40,
		Strength = 40
	},
	MattedHair = {
		P = 30,
		Strength = 30
	},
	LeafKelpMane = {
		P = 20,
		Strength = 20
	},
	RiftMane = {
		P = 10,
		Strength = 10
	},
	TricksterMane = {
		P = 10,
		Strength = 10
	},
	FishboneMane = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Manes"
end
return {
	Manes = t
}