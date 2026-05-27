-- https://lua.expert/
return {
	DisplayName = "PUMPKIN KING",
	Scale = 10,
	AttackColor = Color3.new(1, 0.505882, 0.152941),
	Cosmetics = {
		CoatTop = {
			Colors = "ff6122",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "FF8127",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "FF5400",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "76B529",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "FF5400",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "76B529",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "76B529",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "FF783A",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "FF783A",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "ff962c",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "ff6122",
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