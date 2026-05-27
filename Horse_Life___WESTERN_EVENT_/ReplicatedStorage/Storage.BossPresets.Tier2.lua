-- https://lua.expert/
return {
	DisplayName = "WATER DEITY",
	Scale = 4.5,
	AttackColor = Color3.new(0, 0.898039, 1),
	Cosmetics = {
		CoatTop = {
			Colors = "6179ff",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "708aff",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "b4e2ff",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "70baff",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "4f6fff",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "afceff",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "92FF54",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "afceff",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "5877ff",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "afceff",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "b4e2ff",
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
	},
	HealthMessages = {
		[100] = "You return\226\128\166 stronger, yet still unproven.",
		[50] = "Power alone is not enough. Show me your will!",
		[25] = "You push further than most\226\128\166 but the trial is not over!",
		[0] = "You have earned my acknowledgment\226\128\166 but greater trials await."
	}
}