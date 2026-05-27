-- https://lua.expert/
return {
	DisplayName = "LOVE DEITY",
	Scale = 4,
	AttackColor = Color3.new(255/255, 102/255, 153/255),
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
			Colors = "DA5E76",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "E88DAC",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "EBC8FE",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "E0AAFE",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "FC5B91",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "DDB4C4",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "FF98A1",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "CFB8FC",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "DA7AE8",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "EBC8FE",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "F3E4EB",
			Materials = Enum.Material.ForceField
		}
	},
	Particles = {
		ByParticle = {
			{
				Particle = "Nature",
				Parts = { "Head", "MiddleBody", "Foot", "Hand", "Paw" }
			}
		}
	}
}