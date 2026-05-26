-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	BrokenShell = {
		P = 25,
		Strength = 25
	},
	CrumblePattern = {
		P = 25,
		Strength = 25
	},
	EggRosettes = {
		P = 25,
		Strength = 25
	},
	EggSplotches = {
		P = 25,
		Strength = 25
	},
	MarbledCape = {
		P = 25,
		Strength = 25
	},
	FawnmaskPattern = {
		P = 25,
		Strength = 25
	},
	ZigZagPattern = {
		P = 25,
		Strength = 25
	},
	SpeckledSablePattern = {
		P = 25,
		Strength = 25
	},
	YummyCarrot = {
		P = 25,
		Strength = 25
	},
	BrindleStripes = {
		P = 25,
		Strength = 25
	},
	ClaymottlePattern = {
		P = 25,
		Strength = 25
	},
	Striping = {
		P = 25,
		Strength = 25
	},
	MottledBrindlePattern = {
		P = 25,
		Strength = 25
	},
	ZucchiniStripes = {
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