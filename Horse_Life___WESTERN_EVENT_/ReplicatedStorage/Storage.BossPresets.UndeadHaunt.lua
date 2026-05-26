-- https://lua.expert/
return {
	DisplayName = "UNDEAD HAUNT",
	Scale = 10,
	AttackColor = Color3.new(255/255, 255/255, 255/255),
	Cosmetics = {
		CoatTop = {
			Colors = "FFFFFF",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "FFFFFF",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "FFFFFF",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "000000",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "FFFFFF",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "000000",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "000000",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "000000",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "000000",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "000000",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "000000",
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