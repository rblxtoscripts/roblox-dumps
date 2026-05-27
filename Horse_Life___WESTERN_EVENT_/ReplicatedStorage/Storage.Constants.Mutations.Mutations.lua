-- https://lua.expert/
local tbl = {
	Nothing = {
		P = 85,
		Strength = 95
	},
	LimberTendons = {
		P = 5,
		Strength = 35,
		Modifier = "LimberMutation",
		Image = "rbxassetid://17569898099",
		Description = "Increases speed by 10%"
	},
	SpringyTendons = {
		P = 20,
		Strength = 40,
		Modifier = "JumpMutation",
		Image = "rbxassetid://17569898099",
		Description = "Increases jump height by 10%"
	},
	PowerfulLungs = {
		P = 15,
		Strength = 40,
		Modifier = "LungsMutation",
		Image = "rbxassetid://17569898436",
		Description = "Increases stamina by 25%"
	},
	StrongMuscles = {
		P = 10,
		Strength = 35,
		Modifier = "MuscleMutation",
		Image = "rbxassetid://17569898256",
		Description = "Increases harvesting strength by 10%"
	},
	Gigantism = {
		P = 3,
		Strength = 10,
		Image = "rbxassetid://17569898256",
		ScaleMultiplier = 1.025,
		Description = "Increases horse size by 2%"
	},
	Dwarfism = {
		P = 3,
		Strength = 10,
		Image = "rbxassetid://17569898256",
		ScaleMultiplier = 0.985,
		Description = "Decreases horse size by 2%"
	},
	NimbleHooves = {
		P = 7.5,
		Strength = 40,
		Modifier = "TurnMutation",
		Image = "rbxassetid://17569898564",
		Description = "Increases turn speed by 50%"
	},
	DoubleStamina = {
		P = 1,
		Strength = 1,
		Modifier = "DoubleStamina",
		Image = "rbxassetid://17569898564",
		Description = "Doubles your stamina!"
	},
	VeryFertile = {
		P = 0.5,
		Strength = 1,
		Modifier = "VeryFertile",
		Image = "rbxassetid://17569898564",
		Description = "Reduces gestation time by 25%"
	},
	Mutated = {
		P = 0.025,
		Strength = 0,
		Modifier = "Mutated",
		Image = "rbxassetid://17569898564",
		Description = "Increases chance to pass on mutations by 25%"
	},
	Intelligence = {
		P = 2.5,
		Strength = 1,
		Modifier = "Intelligence",
		Image = "rbxassetid://17569898564",
		Description = "Increases skill XP by 25%"
	},
	CloseBond = {
		P = 1,
		Strength = 1,
		Modifier = "CloseBond",
		Image = "rbxassetid://17569898564",
		Description = "Increases bond skill trait inheritance by 25%"
	},
	DoubleJump = {
		P = 0.75,
		Strength = 1,
		Modifier = "DoubleJump",
		Image = "rbxassetid://17569898564",
		Description = "Lets you jump one more time mid-air!"
	},
	Twins = {
		P = 0.25,
		Strength = 1,
		TwinChance = 5,
		Image = "rbxassetid://16450269627",
		Description = "+5% chance to give birth to 2 foals!"
	},
	PerfectTwins = {
		P = 0.05,
		Strength = 1,
		TwinChance = 5,
		Image = "rbxassetid://16450269627",
		Description = "+5% chance to give birth to 2 identical foals!"
	},
	Trophy = {
		P = 0,
		Strength = 1,
		Image = "rbxassetid://90692155221825",
		Description = "A shiny trophy horse overlay.",
		Material = "Trophy",
		Targets = {
			"Hair",
			"Pattern",
			"Paint",
			"Keratin",
			"CoatTop",
			"CoatBottom",
			"Hoof",
			"Nose",
			"Sock"
		},
		Color = {
			"884324",
			"9fa1ac",
			"df8920",
			"49fff9",
			"922DFF"
		}
	},
	ChimeraMane = {
		P = 5,
		Strength = 5,
		Image = "rbxassetid://16450269627",
		Description = "Makes the mane to be pattern colored.",
		SetTo = "Pattern",
		Targets = { "Mane" }
	},
	ChimeraTail = {
		P = 5,
		Strength = 5,
		Image = "rbxassetid://16450269627",
		Description = "Makes the tail to be pattern colored.",
		SetTo = "Pattern",
		Targets = { "Tail" }
	},
	HarlequinTail = {
		P = 5,
		Strength = 5,
		Image = "rbxassetid://16450269627",
		Description = "Makes the tail to be paint colored.",
		SetTo = "Paint",
		Targets = { "Tail" }
	},
	HarlequinMane = {
		P = 5,
		Strength = 5,
		Image = "rbxassetid://16450269627",
		Description = "Makes the mane to be paint colored.",
		SetTo = "Paint",
		Targets = { "Mane" }
	},
	Elder = {
		P = 0,
		Strength = 0,
		Image = "rbxassetid://136997448022805",
		Description = "A halo effect for eldered horses.",
		Particles = {
			ElderTop = "Hat",
			ElderBottom = "Hat"
		}
	},
	Arcane = {
		P = 0.025,
		Strength = 2.5,
		Image = "rbxassetid://77479262528487",
		Description = "Covers your horse in mystical arcane sigils.",
		Material = "MagicMutationColor",
		EyeGlow = true,
		Targets = { "Sock", "Hair", "Hoof", "CoatBottom" },
		MaterialByTarget = {
			Keratin = "MagicMutation",
			Paint = "MagicMutation",
			CoatBottom = "MagicMutation",
			CoatTop = "MagicMutation",
			Nose = "Neon"
		},
		ParticlesByAttachment = {
			N1 = "ArcaneCrest",
			["Foot.L"] = "ArcaneDust",
			["Foot.R"] = "ArcaneDust",
			["Hand.R"] = "ArcaneDust",
			["Hand.L"] = "ArcaneDust"
		},
		EyeColor = Color3.fromRGB(255, 175, 214)
	},
	RoseInfection = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://125726109052935",
		Description = "Infects your horse with a rose-like texture and glowing eyes",
		Material = "Rose",
		EyeGlow = true,
		Targets = { "Pattern", "Paint", "Keratin", "Eye" },
		EyeColor = Color3.fromRGB(255, 64, 77)
	},
	Artisan = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://104191278924032",
		Description = "Covers your horse in a bright artisan design",
		Material = "Artisan",
		EyeGlow = false,
		Targets = { "CoatTop", "CoatBottom", "Keratin" },
		ParticlesByAttachment = {
			["Foot.L"] = "SmallSpeckles",
			["Foot.R"] = "SmallSpeckles",
			["Hand.R"] = "SmallSpeckles",
			["Hand.L"] = "SmallSpeckles"
		},
		EyeColor = Color3.fromRGB(255, 157, 58)
	},
	Porcelain = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://75122596483830",
		Description = "Covers your horse in Porceain",
		Material = "Porcelain",
		EyeGlow = true,
		MaterialByTarget = {
			Sock = "Neon"
		},
		Targets = { "Keratin", "Hoof", "Paint", "Pattern" },
		ParticlesByAttachment = {},
		EyeColor = Color3.fromRGB(37, 37, 255)
	},
	FloweringSakura = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://84019715820112",
		Description = "Covers your horse in flowering sakura",
		Material = "Sakura",
		EyeGlow = true,
		Targets = { "Sock", "Hair", "CoatBottom" },
		ParticlesByAttachment = {
			["Foot.L"] = "SakuraPetals",
			["Foot.R"] = "SakuraPetals",
			["Hand.R"] = "SakuraPetals",
			["Hand.L"] = "SakuraPetals"
		},
		EyeColor = Color3.fromRGB(255, 175, 214)
	},
	RoseInfection = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://125726109052935",
		Description = "Infects your horse with a rose-like texture and glowing eyes",
		Material = "Rose",
		EyeGlow = true,
		Targets = { "Pattern", "Paint", "Keratin", "Eye" },
		EyeColor = Color3.fromRGB(255, 64, 77)
	},
	Astral = {
		P = 0,
		Strength = 0,
		Image = "rbxassetid://128386767967652",
		Description = "Causes your horse to gain a veil of cosmic energy",
		Material = "AstralStars",
		EyeGlow = true,
		Targets = { "CoatBottom", "CoatTop", "Sock", "Hair" },
		MaterialByTarget = {
			Hoof = "Neon",
			Keratin = "Neon",
			Pattern = "Neon",
			Paint = "Neon"
		},
		ParticlesByAttachment = {
			N1 = "AstralNeck",
			Head = "AstralHeadFall",
			["Eyelid.L"] = "AstralEye",
			["Eyelid.R"] = "AstralEye",
			["Hand.L"] = "AstralFeet",
			["Hand.R"] = "AstralFeet",
			["Foot.L"] = "AstralFeet",
			["Foot.R"] = "AstralFeet",
			["Elbow.L"] = "AstralFall",
			["Elbow.R"] = "AstralFall",
			["Leg.L"] = "AstralFall",
			["Leg.R"] = "AstralFall"
		},
		EyeColor = Color3.fromRGB(236, 145, 254)
	},
	Lacebound = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://123696558439940",
		Description = "Causes your horse to appear adorned in gothic lace",
		Material = "Lace",
		Targets = { "CoatBottom", "CoatTop", "Sock" },
		ParticlesByAttachment = {
			["Hand.L"] = "LaceCrest",
			["Hand.R"] = "LaceCrest",
			["Foot.L"] = "LaceCrest",
			["Foot.R"] = "LaceCrest"
		}
	},
	Arisen = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://107457085139175",
		Description = "Causes your horse to look like an arisen entity",
		Material = "Neon",
		EyeGlow = true,
		Targets = { "Sock", "Keratin" },
		MaterialByTarget = {
			Hoof = "ForceField",
			Hair = "ForceField",
			CoatBottom = "DragonScale",
			CoatTop = "DragonScale"
		},
		ParticlesByAttachment = {
			N1 = "ArisenCrest"
		},
		EyeColor = Color3.fromRGB(255, 255, 255)
	},
	Crystalized = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://94558510402231",
		Description = "Encases your horse in shimmering crystal with fractal patterns and icy brilliance",
		Material = "Crystals",
		EyeGlow = true,
		Targets = {
			"Sock",
			"Nose",
			"Hoof",
			"Keratin",
			"CoatTop",
			"Pattern",
			"Hair",
			"CoatBottom",
			"Paint"
		},
		EyeColor = Color3.fromRGB(183, 220, 255)
	},
	Alien = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://97336301923396",
		Description = "Encases your horse in alien like growths",
		Material = "Alien",
		EyeGlow = true,
		Targets = { "CoatTop", "Hair", "CoatBottom", "Pattern", "Sock" },
		ParticlesByAttachment = {
			N1 = "AlienAura"
		},
		EyeColor = Color3.fromRGB(209, 209, 209)
	},
	NorthStar = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://75019789765302",
		Description = "Encases your horse in stars",
		Material = "NorthStar",
		EyeGlow = true,
		Targets = { "CoatTop", "Hair", "CoatBottom", "Pattern", "Sock" },
		ParticlesByAttachment = {
			N1 = "NorthStarCrest"
		},
		EyeColor = Color3.fromRGB(237, 227, 39)
	},
	Frost = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://87419993990587",
		Description = "Encases your horse in frost",
		Material = "Frost",
		EyeGlow = true,
		Targets = { "CoatTop", "Hair", "CoatBottom", "Pattern", "Sock" },
		ParticlesByAttachment = {
			N1 = "FrostCrest"
		},
		EyeColor = Color3.fromRGB(97, 188, 218)
	},
	FestiveEye = {
		P = 0,
		Strength = 2.5,
		Image = "rbxassetid://82468765908811",
		Description = "Gives your horse a festive eye",
		Targets = { "Eye" },
		Eyecolor1 = Color3.fromRGB(12, 119, 37),
		Eyecolor2 = Color3.fromRGB(209, 2, 31),
		EyeColor = Color3.fromRGB(255, 170, 85)
	},
	Solar = {
		P = 0,
		Strength = 0,
		Image = "rbxassetid://138146566346591",
		Description = "This horse is a descendant of the sun.",
		Material = "Sun",
		EyeGlow = true,
		MaterialByTarget = {
			Keratin = "Neon",
			Hoof = "Neon"
		},
		ParticlesByAttachment = {
			["Eyelid.L"] = "SunEye",
			["Eyelid.R"] = "SunEye",
			N1 = "SunCrest",
			Step = "FlameHoof"
		},
		Targets = { "Nose", "Sock", "CoatTop", "CoatBottom", "Hair", "Pattern", "Paint", "Eye" },
		EyeColor = Color3.fromRGB(255, 170, 85)
	},
	Lunar = {
		P = 0,
		Strength = 0,
		Image = "rbxassetid://121709437769555",
		Description = "This horse is a descendant of the moon.",
		Material = "Moon",
		EyeGlow = true,
		Targets = { "Nose", "Sock", "CoatTop", "CoatBottom", "Hair", "Pattern", "Paint", "Eye" },
		MaterialByTarget = {
			Keratin = "Neon",
			Hoof = "Neon"
		},
		ParticlesByAttachment = {
			["Eyelid.L"] = "MoonEye",
			["Eyelid.R"] = "MoonEye",
			N1 = "MoonCrest"
		},
		EyeColor = Color3.fromRGB(116, 141, 255)
	},
	Void = {
		P = 0,
		Strength = 0,
		Image = "rbxassetid://139356078090931",
		Description = "This horse is a descendant of the void.",
		Material = "Neon",
		EyeGlow = true,
		Targets = { "Nose", "Hair", "Pattern", "Paint", "Hoof", "Keratin" },
		MaterialByTarget = {
			CoatTop = "Foil",
			CoatBottom = "Foil",
			Sock = "Foil"
		},
		ParticlesByAttachment = {
			["Eyelid.L"] = "LightEye",
			["Eyelid.R"] = "LightEye",
			N1 = "VoidCrest",
			Step = "DarkFire"
		},
		EyeColor = Color3.fromRGB(255, 255, 255)
	},
	Heavenly = {
		P = 0,
		Strength = 0,
		Image = "rbxassetid://121300568852555",
		Description = "This horse is a descendant of the heavens.",
		Material = "Neon",
		EyeGlow = true,
		Targets = { "Nose", "Hair", "Pattern", "Paint", "Hoof", "Keratin" },
		MaterialByTarget = {
			CoatTop = "Foil",
			CoatBottom = "Foil",
			Sock = "Foil"
		},
		ParticlesByAttachment = {
			["Eyelid.L"] = "DarkEye",
			["Eyelid.R"] = "DarkEye",
			N1 = "HeavenlyCrest",
			Step = "LightFire"
		},
		EyeColor = Color3.fromRGB(0, 0, 0)
	}
}
for k, v in pairs(tbl) do
	v.Name = k
	v.Type = v.Type or "Mutation"
end
return tbl