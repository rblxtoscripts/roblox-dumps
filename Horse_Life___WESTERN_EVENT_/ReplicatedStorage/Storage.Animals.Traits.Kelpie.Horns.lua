-- https://lua.expert/
local t = {
	Nothing = {
		P = 75,
		Strength = 50
	},
	SmallFangs = {
		P = 55,
		Strength = 40
	},
	LittleTopFangs = {
		P = 55,
		Strength = 40
	},
	OniFangs = {
		P = 40,
		Strength = 40
	},
	OrcFangs = {
		P = 40,
		Strength = 40
	},
	Fangs = {
		P = 40,
		Strength = 40
	},
	DoubleTusks = {
		P = 25,
		Strength = 35
	},
	SabertoothFangs = {
		P = 25,
		Strength = 35
	},
	DraconicFangs = {
		P = 25,
		Strength = 35
	},
	AnglerFangs = {
		P = 10,
		Strength = 30
	},
	Tusks = {
		P = 10,
		Strength = 30
	},
	UrchinHorns = {
		P = 10,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Horns"
end
return {
	Horns = t
}