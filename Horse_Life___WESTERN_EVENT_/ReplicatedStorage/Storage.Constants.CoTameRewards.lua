-- https://lua.expert/
local t = {}
for v1, v2 in {
	Small = {
		PercentageToEarn = 0,
		{
			Name = "Mints",
			Amount = 2,
			P = 40
		},
		{
			Name = "Peppermint",
			Amount = 2,
			P = 30
		},
		{
			Name = "SugarCubes",
			Amount = 2,
			P = 30
		},
		{
			Name = "AlfalfaCubes",
			Amount = 2,
			P = 20
		},
		{
			Name = "HayCubes",
			Amount = 2,
			P = 30
		},
		{
			Name = "Foal",
			Amount = 1,
			P = 10
		}
	},
	Medium = {
		PercentageToEarn = 0.35,
		{
			Name = "HayCubes",
			Amount = 2,
			P = 40
		},
		{
			Name = "AlfalfaCubes",
			Amount = 2,
			P = 30
		},
		{
			Name = "Strawberry",
			Amount = 2,
			P = 30
		},
		{
			Name = "VibrantDaylilies",
			Amount = 2,
			P = 30
		},
		{
			Name = "Pineberry",
			Amount = 2,
			P = 20
		},
		{
			Name = "Foal",
			Amount = 1,
			P = 25
		}
	},
	Large = {
		PercentageToEarn = 0.6,
		{
			Name = "Foal",
			Amount = 1,
			P = 55
		},
		{
			Name = "VibrantDaylilies",
			Amount = 2,
			P = 40
		},
		{
			Name = "OatTreats",
			Amount = 2,
			P = 30
		},
		{
			Name = "Peach",
			Amount = 2,
			P = 30
		},
		{
			Name = "OatTreats",
			Amount = 2,
			P = 30
		},
		{
			Name = "WhitePeach",
			Amount = 2,
			P = 20
		}
	}
} do
	t[tostring(v2.PercentageToEarn)] = v2
	t[tostring(v2.PercentageToEarn)].PercentageToEarn = nil
end
return t