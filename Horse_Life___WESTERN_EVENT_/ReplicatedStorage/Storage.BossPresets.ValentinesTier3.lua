-- https://lua.expert/
return {
	DisplayName = "PASSION DEITY",
	Scale = 5,
	AttackColor = Color3.new(153/255, 0/255, 51/255),
	SpawnSpecies = {
		{
			Species = "Pastrequine",
			P = 1
		},
		{
			Species = "Heartbane",
			P = 1
		}
	},
	Cosmetics = {
		CoatTop = {
			Colors = "9E1231",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "AF284D",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "3C0A6D",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "5A199B",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "7B042A",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "240046",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "FF00B2",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "600001",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "79003A",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "7B2BBE",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "3C0A6D",
			Materials = Enum.Material.ForceField
		}
	},
	Particles = {
		ByParticle = {
			{
				Particle = "FireGlow",
				"FireSparks",
				Parts = { "Head", "MiddleBody", "Foot", "Hand", "Paw" }
			}
		}
	}
}