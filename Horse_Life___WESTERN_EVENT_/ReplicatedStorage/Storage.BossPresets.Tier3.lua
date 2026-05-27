-- https://lua.expert/
return {
	DisplayName = "FIRE DEITY",
	Scale = 5,
	AttackColor = Color3.new(1, 0, 0.298039),
	Cosmetics = {
		CoatTop = {
			Colors = "ff6122",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "ff7423",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "ff481a",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "ff3a13",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "ff481a",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "ff3a13",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "ff3a13",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "ff0000",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "ff0000",
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
	},
	HealthMessages = {
		[100] = "At last\226\128\166 a challenger worthy of awakening my true form.",
		[50] = "I am the keeper of this realm\'s balance. Stand, if you can!",
		[25] = "Incredible\226\128\166 your spirit rivals the ancients\226\128\166",
		[0] = "You have proven yourself. The spirit realm recognizes your strength."
	}
}